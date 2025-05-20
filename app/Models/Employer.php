<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Employer extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 'job_description', 'preferences',
    ];

    protected $casts = [
        'preferences' => 'array',
    ];

    /**
     * Các vị trí việc làm thuộc employer này.
     */
    public function jobPositions()
    {
        return $this->hasMany(JobPosition::class);
    }
}
