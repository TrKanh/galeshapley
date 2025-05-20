<?php

namespace Database\Factories;

use App\Models\Employer;
use Illuminate\Database\Eloquent\Factories\Factory;

class EmployerFactory extends Factory
{
    protected $model = Employer::class;

    public function definition()
    {
        return [
            'name'            => $this->faker->company,
            'job_description' => $this->faker->sentence,
            // Preferences để rỗng, sẽ được generate khi chạy controller
            'preferences'     => [],
        ];
    }
}
