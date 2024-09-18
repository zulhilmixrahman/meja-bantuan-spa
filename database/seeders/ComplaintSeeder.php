<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ComplaintSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        for ($i=0; $i < 50; $i++) {
            \App\Models\Complaint::create([
                'no_tiket' => 'ICT-' . date('Ym') . '-' . rand(1000000000, 9999999999),
                'user_name' => fake()->name(),
                'user_email' => fake()->freeEmail(),
                'sub_category_id' => \App\Models\SubCategory::inRandomOrder()->first()->id,
                'title' => fake()->realText(),
                'detail' => fake()->paragraphs(2, true),
            ]);
        }
    }
}
