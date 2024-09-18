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
        for ($i = 0; $i < 10; $i++) {
            $status = ['baru', 'dalam_tindakan', 'selesai'];
            $statusKey = array_rand($status);

            $firstName = fake('ms_MY')->firstName();
            $lastName = fake('ms_MY')->lastName();

            \App\Models\Complaint::create([
                'no_tiket' => 'ICT-' . date('Ym') . '-' . time(),
                'user_name' => implode(' ', [$firstName, $lastName]),
                'user_email' => strtolower($lastName) . '@' . fake()->freeEmailDomain(),
                'sub_category_id' => \App\Models\SubCategory::inRandomOrder()->first()->id,
                'title' => fake('ms_MY')->sentence(rand(7, 15)),
                'detail' => fake('ms_MY')->paragraph(),
                'status' => $status[$statusKey],
                'officer_id' => ($statusKey == 0) ? null : \App\Models\User::inRandomOrder()->first()->id

            ]);

            sleep(rand(1, 3));
        }
    }
}
