<?php
// database/factories/CandidateFactory.php

namespace Database\Factories;

use App\Models\Candidate;
use Illuminate\Database\Eloquent\Factories\Factory;

class CandidateFactory extends Factory
{
    protected $model = Candidate::class;

    public function definition()
    {
        $skillsPool = ['php', 'laravel', 'mysql', 'javascript', 'vue', 'react', 'node', 'html', 'css'];
        $attributePool = [
            "Làm việc từ xa",
            "Bảo hiểm y tế",
            "Quyền chọn cổ phiếu",
            "Giờ làm việc linh hoạt",
            "Ngân sách đào tạo",
            "Thẻ thành viên phòng gym"
        ];

        return [
            'name'         => $this->faker->name,
            'skills'       => $this->faker->randomElements($skillsPool, rand(2, 5)),
            'requirements' => $this->faker->randomElements($attributePool, rand(1, 3)),
            'preferences'  => [], // sẽ được gán động
        ];
    }
}