<?php

namespace Database\Factories;

use App\Models\JobPosition;
use App\Models\Employer;
use Illuminate\Database\Eloquent\Factories\Factory;

class JobPositionFactory extends Factory
{
    protected $model = JobPosition::class;

    public function definition()
    {
        $skillsPool     = ['php', 'laravel', 'mysql', 'javascript', 'vue', 'react', 'node', 'html', 'css'];
        $attributePool = [
            "Làm việc từ xa",
            "Bảo hiểm y tế",
            "Quyền chọn cổ phiếu",
            "Giờ làm việc linh hoạt",
            "Ngân sách đào tạo",
            "Thẻ thành viên phòng gym"
        ];
        return [
            'employer_id'      => Employer::factory(),
            'job_description'  => $this->faker->jobTitle,
            'required_skills'  => $this->faker->randomElements($skillsPool, rand(2, 4)),
            'features'         => $this->faker->randomElements($attributePool, rand(1, 3)),
            'candidate_id'     => null,
        ];
    }
}
