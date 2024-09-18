<?php

namespace App\Http\Controllers\Public;

use App\Http\Controllers\Controller;
use App\Mail\ComplaintSubmitted;
use App\Models\Category;
use App\Models\Complaint;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rules\File;

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
            'lampiran' => [
                'nullable',
                File::types(['jpg', 'png', 'pdf']) // Limit by extensions file
                    ->max(2 * 1024) // Limit file size in bytes (1mb = 1024byte)
            ]
        ]);

        // dd($request->all());

        $complaint = new Complaint();

        $complaint->no_tiket = 'ICT-' . date('Ym') . '-' . time();
        $complaint->sub_category_id = $request->input('sub_category_id');

        $complaint->user_name = $request->input('user_name');
        $complaint->user_email = $request->input('user_email');
        $complaint->user_tel = $request->input('user_tel');
        $complaint->title = $request->input('title');
        $complaint->detail = $request->input('detail');

        if ($request->hasFile('lampiran')) {
            $path = $request->file('lampiran')->store('lampiran-aduan');
            $complaint->lampiran = $path;
        }

        $complaint->save();

        // Email notification to user
        // Mail::to($complaint->user_email)->send(new ComplaintSubmitted($complaint));
        Mail::to($complaint->user_email)->queue(new ComplaintSubmitted($complaint));

        return to_route('public.ticket', ['ticket' => $complaint->no_tiket]);
    }

    public function showTicket($ticket)
    {
        $complaint = Complaint::where('no_tiket', $ticket)->first();
        // dd($complaint);
        return view('public.ticket', [
            'complaint' => $complaint
        ]);
    }

    public function download($ticket)
    {
        $complaint = Complaint::where('no_tiket', $ticket)->firstOrFail();

        if ($complaint->lampiran !== null) {
            $extension = \Illuminate\Support\Facades\File::extension($complaint->lampiran);
            $filename = $ticket . '.' . $extension;

            return Storage::download($complaint->lampiran, $filename);
        }

        return abort(404, 'Lampiran not found');
    }

    public function printTicket($ticket)
    {
        $complaint = Complaint::where('no_tiket', $ticket)->firstOrFail();

        // Generate PDF
        $pdf = \PDF::loadView('public.pdf', ['complaint' => $complaint]);

        // View PDF in browser
        return $pdf->stream($ticket . '.pdf');

        // Force user to download pdf file
        // return $pdf->download($ticket . '.pdf');
    }
}
