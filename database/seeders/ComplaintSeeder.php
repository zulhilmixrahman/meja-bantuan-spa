<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ComplaintSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        for ($i = 0; $i < 50; $i++) {
            $year = 2024;
            $month = rand(7, 9);
            $status = ['baru', 'dalam_tindakan', 'selesai'];
            $statusKey = array_rand($status);

            $firstName = fake('ms_MY')->firstName();
            $lastName = fake('ms_MY')->lastName();
            $fakeDate = fake()->dateTimeBetween('-3 month', 'today');
            $date = Carbon::parse($fakeDate);

            \App\Models\Complaint::create([
                'no_tiket' => 'ICT-' . $date->format('Ym') . '-' . fake()->unixTime(),
                'user_name' => implode(' ', [$firstName, $lastName]),
                'user_email' => strtolower($lastName) . '@' . fake()->freeEmailDomain(),
                'sub_category_id' => \App\Models\SubCategory::inRandomOrder()->first()->id,
                'title' => fake('ms_MY')->sentence(rand(7, 15)),
                'detail' => fake('ms_MY')->paragraph(),
                'status' => $status[$statusKey],
                'officer_id' => ($statusKey == 0) ? null : \App\Models\User::inRandomOrder()->first()->id,
                'created_at' => $date->format('Y-m-d H:i:s')
            ]);
        }
    }
}
