<?php

namespace App\Http\Controllers\Helpdesk;

use App\Http\Controllers\Controller;
use App\Models\Complaint;
use App\Models\User;
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

    public function agihanForm(Complaint $complaint)
    {
        $officers = User::all();
        return view('helpdesk.complaint.agihan', [
            'complaint' => $complaint,
            'officers' => $officers,
        ]);
    }

    public function agih(Request $request, Complaint $complaint)
    {

    }

    public function tindakanForm(Complaint $complaint)
    {
        return view('helpdesk.complaint.tindakan', [
            'complaint' => $complaint
        ]);
    }

    public function tindakan(Request $request, Complaint $complaint)
    {

    }
}
