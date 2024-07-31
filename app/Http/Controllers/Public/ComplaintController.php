<?php

namespace App\Http\Controllers\Public;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Complaint;
use Illuminate\Http\Request;

class ComplaintController extends Controller
{
    public function showForm()
    {
        $categories = Category::all();
        return view('public.complaint', [
            'categories' => $categories,
        ]);
    }

    public function complaint(Request $request)
    {
        $request->validate([
            'user_name' => 'required',
            'user_email' => 'required|email',
            'user_tel' => 'nullable|alpha_num',
            'category_id' => 'required|integer|exists:categories,id',
            // 'sub_category_id' => 'required|integer|exists:sub_categories,id',
            'title' => 'required',
            'detail' => 'required',
        ]);

        $complaint = new Complaint();

        $complaint->no_tiket = 'ICT-' . date('Ym') . '-' . time();
        $complaint->sub_category_id = $request->input('sub_category_id');

        $complaint->user_name = $request->input('user_name');
        $complaint->user_email = $request->input('user_email');
        $complaint->user_tel = $request->input('user_tel');
        $complaint->title = $request->input('title');
        $complaint->detail = $request->input('detail');
        $complaint->save();
    }
}
