<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        \App\Models\Category::create(['name' => 'Perkakasan']);
        \App\Models\Category::create(['name' => 'Aplikasi']);

        \App\Models\SubCategory::create(['name' => 'Desktop PC', 'category_id' => 1]);
        \App\Models\SubCategory::create(['name' => 'Laptop', 'category_id' => 1]);
        \App\Models\SubCategory::create(['name' => 'Printer', 'category_id' => 1]);
        \App\Models\SubCategory::create(['name' => 'Email', 'category_id' => 2]);
        \App\Models\SubCategory::create(['name' => 'Microsoft Office', 'category_id' => 2]);
    }
}
