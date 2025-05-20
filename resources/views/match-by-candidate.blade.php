<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kết quả ghép đôi - Candidate-Proposing</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 30px;
            background-color: #f8fafc;
        }

        h1, h2 {
            color: #2c3e50;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #fff;
            background-color: #3490dc;
            padding: 10px 15px;
            border-radius: 6px;
        }

        .table-container {
            max-height: 300px;
            overflow-y: auto;
            overflow-x: auto;
            margin-bottom: 40px;
            border: 1px solid #ccc;
            border-radius: 6px;
            background-color: white;
        }

        table {
            width: 100%;
            min-width: 900px;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #e2e8f0;
        }

        .status {
            font-weight: bold;
        }

        .status.success {
            color: green;
        }

        .status.partial {
            color: orange;
        }

        .status.fail {
            color: red;
        }

        .group-light {
            background-color: #ffffff;
        }

        .group-dark {
            background-color: #f1f5f9;
        }
    </style>
</head>
<body>
    <h1>🔗 Kết quả ghép đôi (Candidate-Proposing)</h1>

    <h2>✔️ Ghép cặp thành công:</h2>
    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>ID Ứng viên</th>
                    <th>Tên</th>
                    <th>Kỹ năng</th>
                    <th>ID Công việc</th>
                    <th>Công việc</th>
                    <th>Kỹ năng yêu cầu</th>
                    <th>ID Employer</th>
                    <th>Tên Employer</th>
                    <th>Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $currentEmployer = null;
                    $rowColorToggle = false;
                @endphp
                @forelse($matches as $match)
                    @php
                        if ($currentEmployer !== $match['employer_id']) {
                            $currentEmployer = $match['employer_id'];
                            $rowColorToggle = !$rowColorToggle;
                        }
                        $rowClass = $rowColorToggle ? 'group-light' : 'group-dark';
                    @endphp
                    <tr class="{{ $rowClass }}">
                        <td>{{ $match['candidate_id'] }}</td>
                        <td>{{ $match['candidate'] }}</td>
                        <td>{{ implode(', ', $match['candidate_skills'] ?? []) }}</td>
                        <td>{{ $match['job_id'] }}</td>
                        <td>{{ $match['job_description'] }}</td>
                        <td>{{ implode(', ', $match['required_skills'] ?? []) }}</td>
                        <td>{{ $match['employer_id'] }}</td>
                        <td>{{ $match['employer'] }}</td>
                        <td class="status success">✅ Thành công</td>
                    </tr>
                @empty
                    <tr><td colspan="9">Không có cặp ghép đôi thành công.</td></tr>
                @endforelse
            </tbody>
        </table>
    </div>

    <h2>⚠️ Kỹ năng phù hợp nhưng không được ghép:</h2>
    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>ID Ứng viên</th>
                    <th>Tên</th>
                    <th>Kỹ năng</th>
                    <th>Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                @forelse($skillMatchedButUnmatched ?? [] as $candidate)
                    <tr>
                        <td>{{ $candidate['id'] }}</td>
                        <td>{{ $candidate['name'] }}</td>
                        <td>{{ implode(', ', $candidate['skills'] ?? []) }}</td>
                        <td class="status partial">⚠️ Không đủ kỹ năng yêu cầu công việc</td>
                    </tr>
                @empty
                    <tr><td colspan="4">Tất cả ứng viên phù hợp kỹ năng đã được ghép đôi.</td></tr>
                @endforelse
            </tbody>
        </table>
    </div>

    <h2>❌ Không có kỹ năng phù hợp với bất kỳ công việc nào:</h2>
    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>ID Ứng viên</th>
                    <th>Tên</th>
                    <th>Kỹ năng</th>
                    <th>Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                @forelse($skillUnmatchedCandidates ?? [] as $candidate)
                    <tr>
                        <td>{{ $candidate['id'] }}</td>
                        <td>{{ $candidate['name'] }}</td>
                        <td>{{ implode(', ', $candidate['skills'] ?? []) }}</td>
                        <td class="status fail">❌ Không có kỹ năng phù hợp</td>
                    </tr>
                @empty
                    <tr><td colspan="4">Không có ứng viên nào hoàn toàn không phù hợp kỹ năng.</td></tr>
                @endforelse
            </tbody>
        </table>
    </div>

    <a href="{{ route('choose-match-type') }}">⬅️ Quay lại</a>
</body>
</html>
