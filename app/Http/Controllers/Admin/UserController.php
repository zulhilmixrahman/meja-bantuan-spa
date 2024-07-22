<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Department;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;
use Spatie\Permission\Models\Role;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('admin.users.index', [
            'users' => User::paginate()
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.users.create', [
            'roles' => Role::all(),
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'avatar' => 'nullable|mimes:jng,jpg,jpeg,gif',
            'name' => 'required',
            'email' => 'required|email|unique:users,email',
            'roles' => 'required|array'
        ]);

        $pswdGenerated = config('app.env') == 'production'
            ? implode('-', fake()->words(3))
            : config('constants.default-password');

        $user = new User($validatedData);
        $user->password = Hash::make($pswdGenerated);

        if ($request->hasFile('avatar')) {
            $path = $request->file('avatar')->store('users-avatar', 'public');
            $user->avatar = $path;
        }

        if ($user->save()) {
            $user->syncRoles($validatedData['roles']);
        }

        return redirect()->route('admin.users.index')->with('success', 'New user created');
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(User $user)
    {
        return view('admin.users.edit', [
            'user' => $user,
            'roles' => Role::all(),
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, User $user)
    {
        $validatedData = $request->validate([
            'avatar' => 'nullable|mimes:jng,jpg,jpeg,gif',
            'name' => 'required',
            'email' => ['required', 'email', Rule::unique('users')->ignore($user->id)],
            'roles' => 'required|array'
        ]);

        $user->fill($validatedData);

        if ($request->hasFile('avatar')) {
            if ($user->avatar != null) {
                if (Storage::exists($user->avatar)) {
                    Storage::delete($user->avatar);
                }
            }

            $path = $request->file('avatar')->store('users-avatar', 'public');
            $user->avatar = $path;
        }

        if ($user->save()) {
            $user->syncRoles($validatedData['roles']);
        }

        return redirect()->route('admin.users.edit', $user)->with('success', 'User updated');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(User $user)
    {
        $user->delete();
        return redirect()->route('admin.users.index')->with('success', 'User deleted');
    }
}
