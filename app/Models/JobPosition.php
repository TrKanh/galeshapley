<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class JobPosition extends Model
{
    use HasFactory;

    protected $fillable = [
        'employer_id', 'job_description', 'required_skills', 'features', 'candidate_id',
    ];

    protected $casts = [
        'required_skills' => 'array',
        'features'        => 'array',
    ];

    public function employer()
    {
        return $this->belongsTo(Employer::class);
    }

    public function candidate()
    {
        return $this->belongsTo(Candidate::class);
    }
}
