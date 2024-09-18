<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Str;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class PermissionsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        if (Schema::hasTable((new Permission())->getTable())) {
            DB::statement('SET FOREIGN_KEY_CHECKS = 0');
            DB::table((new Permission)->getTable())->truncate();
            DB::statement('SET FOREIGN_KEY_CHECKS = 1');
        }
        if (Schema::hasTable((new Role())->getTable())) {
            DB::statement('SET FOREIGN_KEY_CHECKS = 0');
            DB::table((new Role)->getTable())->truncate();
            DB::statement('SET FOREIGN_KEY_CHECKS = 1');
        }
        if (Schema::hasTable((new User())->getTable())) {
            DB::statement('SET FOREIGN_KEY_CHECKS = 0');
            DB::table((new User)->getTable())->truncate();
            DB::statement('SET FOREIGN_KEY_CHECKS = 1');
        }

        /** Reset cached roles and permissions *****/
        app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();

        $permissions['role'] = ['access roles', 'add role', 'edit role', 'delete role'];
        $permissions['permission'] = ['access permissions', 'add permission', 'edit permission', 'delete permission'];
        $permissions['user'] = ['access users', 'add user', 'edit user', 'delete user'];
        $permissions['department'] = ['access departments', 'add department', 'edit department', 'delete department'];

        $permissions['category'] = ['access categories', 'add category', 'edit category', 'delete category'];
        $permissions['subcategory'] = ['access subcategories', 'add subcategory', 'edit subcategory', 'delete subcategory'];
        $permissions['complaint'] = ['urus aduan', 'agih aduan', 'kemaskini tindakan'];


        /** CREATE PERMISSIONS *********************/
        foreach ($permissions as $key => $permission) {
            foreach ($permission as $permission_name) {
                Permission::create([
                    'name' => $permission_name,
                    'guard_name' => 'web',
                    'created_at' => now(),
                    'updated_at' => now()
                ]);
            }
        }

        /** CREATE ROLES ***************************/
        $super_admin = Role::create([
            'name' => 'administrator',
            'guard_name' => 'web',
            'created_at' => now(),
            'updated_at' => now()
        ])->givePermissionTo(Permission::all());

        $pentadbir = Role::create([
            'name' => 'Pentadbir Aduan',
            'guard_name' => 'web',
            'created_at' => now(),
            'updated_at' => now()
        ])->givePermissionTo(array_merge(
            $permissions['category'],
            $permissions['subcategory'],
            ['urus aduan', 'agih aduan']
        ));

        $pegawai = Role::create([
            'name' => 'Pegawai Aduan',
            'guard_name' => 'web',
            'created_at' => now(),
            'updated_at' => now()
        ])->givePermissionTo(['kemaskini tindakan']);


        /** CREATE DEFAULT USERS *******************/
        $admin = User::create([
            'name' => 'Pentadbir Sistem',
            'email' => 'admin@spa.my',
            'email_verified_at' => now(),
            'password' => Hash::make(config('constants.default-password')),
            'remember_token' => Str::random(10),
            'created_at' => now(),
            'updated_at' => now(),
        ]);
        $admin->assignRole($super_admin);

        $user2 = User::create([
            'name' => fake('ms_MY')->name(),
            'email' => 'pentadbir@spa.my',
            'email_verified_at' => now(),
            'password' => Hash::make(config('constants.default-password')),
            'remember_token' => Str::random(10),
            'created_at' => now(),
            'updated_at' => now(),
        ]);
        $user2->assignRole($pentadbir);

        $user3 = User::create([
            'name' => fake('ms_MY')->name(),
            'email' => 'pegawai@spa.my',
            'email_verified_at' => now(),
            'password' => Hash::make(config('constants.default-password')),
            'remember_token' => Str::random(10),
            'created_at' => now(),
            'updated_at' => now(),
        ]);
        $user3->assignRole($pegawai);
    }
}
