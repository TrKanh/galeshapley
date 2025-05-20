<?php

// database/migrations/2025_04_19_000002_add_features_to_job_positions.php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('job_positions', function (Blueprint $table) {
            $table->json('features')->nullable()->after('required_skills');
        });
    }

    public function down()
    {
        Schema::table('job_positions', function (Blueprint $table) {
            $table->dropColumn('features');
        });
    }
};
