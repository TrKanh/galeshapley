<?php

namespace App\Http\Controllers;

use App\Models\Candidate;
use App\Models\Employer;
use App\Models\JobPosition;
use Illuminate\Http\Request;

class JobMatchingController extends Controller
{
    public function matchCandidates()
    {
        return view('choose-match-type');
    }

    // --- Nút “Tạo mới dữ liệu” ---
    public function resetData()
    {
        JobPosition::query()->delete();
        Candidate::query()->delete();
        Employer::query()->delete();

        Candidate::factory()->count(50)->create();
        Employer::factory()->count(10)->create()->each(function ($emp) {
            $n = rand(1, 3);
            JobPosition::factory()->count($n)
                       ->create(['employer_id' => $emp->id]);
        });

        return redirect()->route('choose-match-type')
                         ->with('status', '✔️ Dữ liệu mới đã được tạo');
    }

    // --- Nút “Tạo danh sách ưu tiên” ---
    public function generatePreferencesOnly()
    {
        $filtered = $this->getSkillMatchedCandidatesAndEmployers();
        $this->generatePreferences(Candidate::all(), Employer::all());

        return redirect()->route('choose-match-type')
                         ->with('status', '✔️ Preferences đã được cập nhật');
    }

    private function computeSimilarity(array $a, array $b): int
    {
        return count(array_intersect($a, $b));
    }

    private function generatePreferences($candidates, $employers): void
    {
        // Candidate -> JobPosition
        foreach ($candidates as $cand) {
            $scores = [];
            foreach ($employers as $emp) {
                foreach ($emp->jobPositions as $job) {
                    // Tính điểm phù hợp dựa trên requirements của ứng viên và features của job
                    $score = $this->computeSimilarity($cand->requirements, $job->features);
                    $scores[$job->id] = $score;
                }
            }
            // Sắp xếp danh sách ưu tiên giảm dần theo điểm
            arsort($scores);
            // Lấy danh sách job_id đã sắp xếp
            $cand->preferences = array_keys($scores);
            $cand->save();
        }

        // Employer -> Candidate
        foreach ($employers as $emp) {
            $scores = [];
            foreach ($candidates as $cand) {
                $totalScore = 0;
                foreach ($emp->jobPositions as $job) {
                    // Tính điểm phù hợp dựa trên skills của ứng viên và required_skills của job
                    $score = $this->computeSimilarity($cand->skills, $job->required_skills);
                    $totalScore += $score;
                }
                $scores[$cand->id] = $totalScore;
            }
            // Sắp xếp danh sách ưu tiên giảm dần theo điểm
            arsort($scores);
            // Lấy danh sách candidate_id đã sắp xếp
            $emp->preferences = array_keys($scores);
            $emp->save();
        }
    }


    /**
     * Candidate-Proposing Gale–Shapley (One-to-One)
     * Hiển thị: matched candidates, eligible but unmatched candidates, và ineligible candidates.
     */
    public function matchCandidatesByCandidateProposing()
    {
        // 1. Reset tất cả ghép đôi cũ
        JobPosition::query()->update(['candidate_id' => null]);
    
        // 2. Lọc ra candidates và employers hợp lệ (skill match)
        $filtered   = $this->getSkillMatchedCandidatesAndEmployers();
        $candidates = $filtered['candidates'];
        $employers  = $filtered['employers'];
    
        // 3. Sinh preferences: mỗi Candidate lưu mảng job_id theo điểm similarity
        $this->generatePreferences(Candidate::all(), Employer::all());
    
        // 4. Khởi tạo Gale–Shapley với JobPosition làm “receiver”
        $freeCandidates = [];    // queue candidate còn tự do
        $proposalIndex  = [];    // con trỏ đã propose đến đâu cho mỗi candidate
        $jobCapacity    = [];    // capacity mỗi job = 1
        $jobMatches     = [];    // job_id => [candidate_id,..]
    
        // 4.1 Mọi candidate bắt đầu tự do, chưa propose
        foreach ($candidates as $c) {
            $freeCandidates[]          = $c->id;
            $proposalIndex[$c->id]     = 0;
        }
    
        // 4.2 Mỗi job vị trí capacity=1, matches = []
        foreach ($employers as $emp) {
            foreach ($emp->jobPositions as $job) {
                $jobCapacity[$job->id] = 1;
                $jobMatches[$job->id]  = [];
            }
        }
    
        // 4.3 Hàm xếp hạng candidate theo ưu tiên của employer
        //     Lấy Employer từ JobPosition để so sánh
        $rank = function (JobPosition $job, int $cid): int {
            $prefs = $job->employer->preferences ?: [];
            $pos   = array_search($cid, $prefs, true);
            return ($pos === false) ? PHP_INT_MAX : $pos;
        };
    
        // 5. Vòng lặp Gale–Shapley
        while (!empty($freeCandidates)) {
            $cid  = array_shift($freeCandidates);
            $cand = Candidate::find($cid);
    
            $prefs = $cand->preferences ?: [];
            // nếu đã propose hết => continue
            if (!isset($prefs[$proposalIndex[$cid]])) {
                continue;
            }
    
            $jobId = $prefs[$proposalIndex[$cid]++];
            $job   = JobPosition::find($jobId);

            // nếu job chưa có trong mảng match/capacity thì khởi tạo (chống lỗi)
            if (!isset($jobMatches[$jobId])) {
                $jobMatches[$jobId] = [];
                $jobCapacity[$jobId] = 1;
            }

            // propose vào job
            $jobMatches[$jobId][] = $cid;

    
            // sort đề xuất của job theo employer preference
            usort($jobMatches[$jobId], function ($a, $b) use ($job, $rank) {
                return $rank($job, $a) - $rank($job, $b);
            });
    
            // nếu vượt capacity => reject candidate yếu nhất
            if (count($jobMatches[$jobId]) > $jobCapacity[$jobId]) {
                $rejected = array_pop($jobMatches[$jobId]);
                $freeCandidates[] = $rejected;
            }
        }
    
        // 6. Gán kết quả vào DB và build finalMatches để view
        $finalMatches = [];
        foreach ($jobMatches as $jobId => $cids) {
            $job = JobPosition::find($jobId);
            foreach ($cids as $cid) {
                $job->candidate_id = $cid;
                $job->save();
    
                $candidate = Candidate::find($cid);
                $employer  = $job->employer;
    
                $finalMatches[] = [
                    'candidate_id'     => $cid,
                    'candidate'        => $candidate->name,
                    'candidate_skills' => $candidate->skills,
                    'job_id'           => $job->id,
                    'job_description'  => $job->job_description,
                    'required_skills'  => $job->required_skills,
                    'employer_id'      => $employer->id,
                    'employer'         => $employer->name,
                ];
            }
        }
    
        // 7. Chuẩn bị matched / unmatched để gửi về view
        $matchedCids = array_column($finalMatches, 'candidate_id');
        $matchedButUnmatched = $candidates
            ->filter(fn($c) => !in_array($c->id, $matchedCids))
            ->map(fn($c) => ['id'=>$c->id,'name'=>$c->name,'skills'=>$c->skills]);
    
        $ineligible = Candidate::all()
            ->filter(fn($c) => !$candidates->contains('id', $c->id))
            ->map(fn($c) => ['id'=>$c->id,'name'=>$c->name,'skills'=>$c->skills]);
    
        return view('match-by-candidate', [
            'matches'                  => $finalMatches,
            'skillMatchedButUnmatched' => $matchedButUnmatched,
            'skillUnmatchedCandidates' => $ineligible,
        ]);
    }
    
    

    /**
     * Employer‑Proposing – giữ nguyên (hoặc bạn có thể mở rộng thêm tùy mục tiêu)
     */
    public function matchCandidatesByEmployerProposing()
    {
        // Để tập trung vào Candidate‑Proposing, ta giữ phần này nguyên.
        JobPosition::query()->update(['candidate_id' => null]);

        // **Sinh preference động**
        $this->generatePreferences(Candidate::all(), Employer::all());

        $filtered  = $this->getSkillMatchedCandidatesAndEmployers();
        $candidates = $filtered['candidates'];
        $employers  = $filtered['employers'];

        // Lấy danh sách candidate ID hợp lệ
        $validCandidateIds = $candidates->pluck('id')->toArray();
    
        // Khởi tạo cho candidateMatch (mỗi candidate nhận 1 match)
        $candidateMatch = [];
        foreach ($candidates as $candidate) {
            $candidateMatch[$candidate->id] = null;
        }
    
        // Khởi tạo các biến cho employer
        $proposalIndex = [];
        $employerCapacity = [];
        $employerMatches = [];
    
        foreach ($employers as $employer) {
            if (!empty($employer->preferences)) {
                $employer->preferences = array_values(array_filter(
                    $employer->preferences,
                    fn($cid) => in_array($cid, $validCandidateIds)
                ));
            }

            $proposalIndex[$employer->id] = 0;
            $capacity = JobPosition::where('employer_id', $employer->id)
                        ->whereNull('candidate_id')
                        ->count();
            $employerCapacity[$employer->id] = $capacity;
            $employerMatches[$employer->id] = [];
        }
    
        // Hàm so sánh theo preference của candidate đối với employer
        $candidatePrefers = function($candidate, $newEmployerId, $currentEmployerId) {
            $prefs = $candidate->preferences ?: [];
            $newRank = array_search($newEmployerId, $prefs);
            $currentRank = array_search($currentEmployerId, $prefs);
            $newRank = ($newRank === false) ? PHP_INT_MAX : $newRank;
            $currentRank = ($currentRank === false) ? PHP_INT_MAX : $currentRank;
            return $newRank < $currentRank;
        };
    
        $freeEmployers = [];
        foreach ($employers as $employer) {
            if ($employerCapacity[$employer->id] > 0 && count($employer->preferences) > 0) {
                $freeEmployers[] = $employer->id;
            }
        }
    
        while (!empty($freeEmployers)) {
            $employerId = array_shift($freeEmployers);
            $employer = Employer::find($employerId);
            $prefs = $employer->preferences ?? [];
    
            if (empty($prefs) || $proposalIndex[$employerId] >= count($prefs)) {
                continue;
            }
    
            $candidateId = $prefs[$proposalIndex[$employerId]];
            $proposalIndex[$employerId]++;
    
            if (!isset($candidateMatch[$candidateId])) {
                $candidateMatch[$candidateId] = null;
            }
    
            if (is_null($candidateMatch[$candidateId])) {
                $candidateMatch[$candidateId] = $employerId;
                $employerMatches[$employerId][] = $candidateId;
                $employerCapacity[$employerId]--;
            } else {
                $currentEmployer = Employer::find($candidateMatch[$candidateId]);
                if ($candidatePrefers(Candidate::find($candidateId), $employerId, $candidateMatch[$candidateId])) {
                    $oldEmployerId = $candidateMatch[$candidateId];
                    $employerMatches[$oldEmployerId] = array_values(array_filter(
                        $employerMatches[$oldEmployerId],
                        fn($cid) => $cid != $candidateId
                    ));
                    $employerCapacity[$oldEmployerId]++;
    
                    $candidateMatch[$candidateId] = $employerId;
                    $employerMatches[$employerId][] = $candidateId;
                    $employerCapacity[$employerId]--;
                } else {
                    // Candidate giữ match cũ
                }
            }
    
            if ($employerCapacity[$employerId] > 0 && $proposalIndex[$employerId] < count($prefs)) {
                $freeEmployers[] = $employerId;
            }
        }
    
        // Gán kết quả vào JobPosition và lưu finalMatches
        $finalMatches = [];
        foreach ($candidateMatch as $candidateId => $employerId) {
            if (!is_null($employerId)) {
                $jobPosition = JobPosition::where('employer_id', $employerId)
                                        ->whereNull('candidate_id')
                                        ->first();
                if ($jobPosition) {
                    $jobPosition->candidate_id = $candidateId;
                    $jobPosition->save();
    
                    $candidate = Candidate::find($candidateId);
                    $employer = Employer::find($employerId);
    
                    $finalMatches[] = [
                        'employer_id' => $employerId,
                        'employer' => $employer->name,
                        'candidate' => $candidate->name,
                        'job_description' => $jobPosition->job_description,
                        'required_skills' => $jobPosition->required_skills,
                    ];
                }
            }
        }
    
        // Sắp xếp finalMatches theo employer_id
        $finalMatches = collect($finalMatches)->sortBy('employer_id')->values()->toArray();
    
        $matchedCandidateIds = array_unique(array_column($finalMatches, 'candidate'));
        $unmatchedCandidates = $candidates->filter(function ($cand) use ($matchedCandidateIds) {
            return !in_array($cand->id, $matchedCandidateIds);
        })->pluck('name');
        $allEmployerIds = Employer::pluck('id')->toArray();
        $matchedEmployerIds = array_column($finalMatches, 'employer_id');
        $unmatchedEmployerIds = array_diff($allEmployerIds, $matchedEmployerIds);
        $unmatchedEmployers = Employer::whereIn('id', $unmatchedEmployerIds)->get();
        return view('match-by-employer', [
            'matches'            => $finalMatches,
            'employers'          => $employers,
            'unmatchedEmployers' => $unmatchedEmployers,
            'unmatchedCandidates'=> $unmatchedCandidates,
        ]);
    }
    
    /**
     * Hàm lọc skill match cho cả hai chế độ.
     * Lọc ra các candidate và employer mà tồn tại ít nhất một job position trống
     * mà candidate có thể đáp ứng yêu cầu (required_skills) của employer.
     */
    private function getSkillMatchedCandidatesAndEmployers()
    {
        $candidates = Candidate::all();
        $employers = Employer::all();
    
        $validCandidates = collect();
        $validEmployers = collect();
    
        foreach ($employers as $employer) {
            $jobPositions = JobPosition::where('employer_id', $employer->id)
                                ->whereNull('candidate_id')
                                ->get();
    
            $matchingCandidates = $candidates->filter(function ($candidate) use ($jobPositions) {
                foreach ($jobPositions as $job) {
                    if ($this->skillsMatch($candidate->skills, $job->required_skills)) {
                        return true;
                    }
                }
                return false;
            });
    
            if ($matchingCandidates->isNotEmpty()) {
                $validEmployers->push($employer);
                foreach ($matchingCandidates as $cand) {
                    $validCandidates->push($cand);
                }
            }
        }
    
        return [
            'candidates' => $validCandidates->unique('id'),
            'employers' => $validEmployers->unique('id'),
        ];
    }
    
    private function skillsMatch(array $candidateSkills, array $requiredSkills): bool
    {
        return empty(array_diff($requiredSkills, $candidateSkills));
    }
}
