<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Candidate;

class CandidateSeeder extends Seeder
{
    public function run()
    {
        // Tạo 100 ứng viên ngẫu nhiên
        Candidate::factory(100)->create(); // Đảm bảo đã có HasFactory trong model Candidate
    }
}
