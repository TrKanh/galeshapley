<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Employer;

class EmployerSeeder extends Seeder
{
    public function run()
    {
        // Tạo 5 công ty ngẫu nhiên
        Employer::factory(5)->create(); // Đảm bảo đã có HasFactory trong model Employer
    }
}
