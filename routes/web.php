<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\JobMatchingController;

Route::get('/choose-match-type', [JobMatchingController::class, 'matchCandidates'])
     ->name('choose-match-type');

Route::get('/match-candidates-by-candidate', [JobMatchingController::class, 'matchCandidatesByCandidateProposing'])
     ->name('match.candidate');
Route::get('/match-candidates-by-employer', [JobMatchingController::class, 'matchCandidatesByEmployerProposing'])
     ->name('match.employer');

// POST về cùng choose-match-type
Route::post('/reset-data', [JobMatchingController::class, 'resetData'])
     ->name('data.reset');
Route::post('/generate-preferences', [JobMatchingController::class, 'generatePreferencesOnly'])
     ->name('preferences.generate');
