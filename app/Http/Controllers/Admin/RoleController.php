<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Permission;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Spatie\Permission\Models\Role;

class RoleController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('admin.roles.index', [
            'roles' => Role::all()
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $collection = Permission::get();
        $permissions = $collection->groupBy(function ($item, $key) {
            //groupBy 2nd word permission name
            return explode(' ', Str::singular($item['name']))[1];
        });
        $permissions->toArray();

        return view('admin.roles.create', compact('permissions'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // dd($request->all());
        $validatedData = $request->validate(['name' => 'required']);

        $role = new Role();
        $role->name = trim(strtolower($validatedData['name']));
        $role->guard_name = 'web';

        if ($role->save()) {
            $role->syncPermissions($request->permissions);
            return redirect()->route('admin.roles.index')->with('success', 'New role created');
        }

        return redirect()->route('admin.roles.edit', $role)->withInput($validatedData)->with('warning', 'Failed to save role permissions');
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Role $role)
    {
        $collection = Permission::get();
        $permissions = $collection->groupBy(function ($item, $key) {
            //groupBy 2nd word permission name
            return explode(' ', Str::singular($item['name']))[1];
        });
        $permissions->toArray();

        $rolePermissions = DB::table('role_has_permissions')->where('role_has_permissions.role_id', $role->id)
            ->pluck('role_has_permissions.permission_id', 'role_has_permissions.permission_id')
            ->all();

        return view('admin.roles.edit', compact('role', 'permissions', 'rolePermissions'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Role $role)
    {
        $validatedData = $request->validate(['name' => 'required']);

        $role->name = trim(strtolower($validatedData['name']));

        if ($role->save()) {
            $role->syncPermissions($request->permissions);
            return redirect()->route('admin.roles.index')->with('success', 'Role updated');
        }

        return redirect()->route('admin.roles.edit', $role)->withInput($validatedData)->with('warning', 'Failed to update role permissions');
    }
}
