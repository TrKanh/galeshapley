<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Candidate extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 'skills', 'requirements', 'preferences',
    ];

    protected $casts = [
        'skills'       => 'array',
        'requirements' => 'array',
        'preferences'  => 'array',
    ];

    /**
     * Job positions mà candidate đã được ghép.
     */
    public function matchedPositions()
    {
        return $this->hasMany(JobPosition::class, 'candidate_id');
    }
}
