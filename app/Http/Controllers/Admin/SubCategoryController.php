<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\SubCategory;
use Illuminate\Http\Request;

class SubCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $senarai_sub_kategori = SubCategory::paginate();
        return view('admin.subcategory.index', [
            'senarai_sub_kategori' => $senarai_sub_kategori,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $categories = Category::all();
        return view('admin.subcategory.create', [
            'categories' => $categories
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'category_id' => 'required|integer|exists:categories,id',
            'name' => 'required',
        ]);

        $sub_category = new SubCategory();
        $sub_category->category_id = $request->input('category_id');
        $sub_category->name = $request->input('name');
        $sub_category->save();

        return to_route('admin.sub_categories.index');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(SubCategory $sub_category)
    {
        $categories = Category::all();
        return view('admin.subcategory.edit', [
            'categories' => $categories,
            'sub_category' => $sub_category,
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, SubCategory $sub_category)
    {
        $request->validate([
            'category_id' => 'required|integer|exists:categories,id',
            'name' => 'required',
        ]);

        $sub_category->category_id = $request->input('category_id');
        $sub_category->name = $request->input('name');
        $sub_category->save();

        return to_route('admin.sub_categories.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(SubCategory $sub_category)
    {
        $sub_category->delete();
        return to_route('admin.sub_categories.index');
    }
}
