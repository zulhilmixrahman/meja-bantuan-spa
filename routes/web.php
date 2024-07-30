<?php

use App\Http\Controllers\Public\ComplaintController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});
Route::get('aduan', [ComplaintController::class, 'showForm']);
Route::post('aduan', [ComplaintController::class, 'complaint'])->name('public.complaint');

Auth::routes();

Route::middleware('auth')->group(function () {
    Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

    Route::prefix('admin')->name('admin.')->group(function () {
        Route::resource('departments', App\Http\Controllers\Admin\DepartmentController::class)->except(['show']);
        Route::resource('users', App\Http\Controllers\Admin\UserController::class)->except(['show']);
        Route::resource('roles', App\Http\Controllers\Admin\RoleController::class)->except(['show', 'destroy']);
        Route::resource('permissions', App\Http\Controllers\Admin\PermissionController::class)->only(['index', 'create', 'store']);

        Route::resource('categories', App\Http\Controllers\Admin\CategoryController::class);
        Route::resource('sub_categories', App\Http\Controllers\Admin\SubCategoryController::class);
    });
});

/**
 * Route sample code for developtment reference
 * DELETE AND REMOVE BEFORE DEPLOY IN PRODUCTION!
 */
Route::get('sample', fn() => view('sample.index'));

Route::get('sample/form', function () {
    $states = [1 => 'Kedah', 2 => 'Perak', 3 => 'Selangor', 4 => 'Melaka', 5 => 'Johor'];
    $state_id = array_rand($states, 1);
    return view('sample.form', compact('states', 'state_id'));
});

Route::post('sample/form', function (App\Http\Requests\SampleForm $request) {
    return response()->json($request->except(['_token']));
});

Route::delete('/sample/delete', function () {
    return redirect('sample')->with('success', 'Record deleted');
});
