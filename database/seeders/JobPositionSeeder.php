<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\JobPosition;
use App\Models\Employer;

class JobPositionSeeder extends Seeder
{
    public function run()
    {
        // Tạo 5 vị trí công việc cho mỗi công ty
        $employers = Employer::all();
        
        foreach ($employers as $employer) {
            for ($i = 0; $i < 5; $i++) {
                JobPosition::factory()->create([
                    'employer_id' => $employer->id,
                ]);
            }
        }
    }
}
