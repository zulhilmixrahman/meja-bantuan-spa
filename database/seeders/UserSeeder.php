<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        for ($i = 0; $i < 5; $i++) {
            $firstName = fake()->firstName();
            $lastName = fake()->lastName();

            $admin = \App\Models\User::create([
                'name' => implode(' ', [$firstName, $lastName]),
                'email' => strtolower($lastName) . '@spa.my',
                'email_verified_at' => now(),
                'password' => Hash::make(config('constants.default-password')),
                'remember_token' => Str::random(10),
                'created_at' => now(),
                'updated_at' => now(),
            ]);
            $admin->assignRole(3);
        }
    }
}
