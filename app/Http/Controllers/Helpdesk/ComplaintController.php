<?php

namespace App\Http\Controllers\Helpdesk;

use App\Http\Controllers\Controller;
use App\Models\Complaint;
use Illuminate\Http\Request;

class ComplaintController extends Controller
{
    public function index()
    {
        $complaints = Complaint::paginate();
        return view('helpdesk.complaint.index', [
            'complaints' => $complaints
        ]);
    }
}
