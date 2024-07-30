<?php

use App\Models\SubCategory;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('complaints', function (Blueprint $table) {
            $table->id();
            $table->string('user_name');
            $table->string('user_email');
            $table->string('user_tel')->nullable();
            $table->foreignIdFor(SubCategory::class)->constrained();
            $table->string('title');
            $table->text('detail');
            $table->foreignId('officer_id')->nullable()->constrained('users', 'id');
            $table->string('status')->default('baru')->comment('baru|agihan|dalam_tindakan|selesai|tutup');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('complaints');
    }
};
