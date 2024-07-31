<?php

namespace App\Http\Controllers\Helpdesk;

use App\Http\Controllers\Controller;
use App\Models\Complaint;
use App\Models\ComplaintLog;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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
        try {
            DB::beginTransaction();

            $complaint->officer_id = $request->input('officer_id');
            $complaint->save();

            $log = new ComplaintLog();
            $log->complaint_id = $complaint->id;
            $log->detail = 'Agihan aduan kepada ' . $complaint->officer->name;
            $log->save();

            DB::commit();
            return to_route('helpdesk.index')->with('success', 'Aduan telah diagih');
        } catch (\Throwable $th) {
            DB::rollBack();
        }

        return to_route('helpdesk.agih', ['complaint' => $complaint])->with('error', 'Ralat agih aduan');
    }

    public function tindakanForm(Complaint $complaint)
    {
        return view('helpdesk.complaint.tindakan', [
            'complaint' => $complaint
        ]);
    }

    public function tindakan(Request $request, Complaint $complaint)
    {
        try {
            DB::beginTransaction();

            $complaint->status = $request->input('status');
            $complaint->save();

            $log = new ComplaintLog();
            $log->complaint_id = $complaint->id;
            $log->detail = $request->input('detail');
            $log->save();

            DB::commit();
            return to_route('helpdesk.index')->with('success', 'Aduan telah diagih');
        } catch (\Throwable $th) {
            dd($th->getMessage());
            DB::rollBack();
        }

        return to_route('helpdesk.tindakan', ['complaint' => $complaint])->with('error', 'Ralat agih aduan');
    }

    public function logs(Complaint $complaint)
    {
        return view('helpdesk.complaint.logs', [
            'complaint' => $complaint
        ]);
    }
}
