@extends('layouts.main')

@section('page-header')
    <div class="row g-2 align-items-center">
        <div class="col">
            <h2 class="page-title">
                Agih Aduan
            </h2>
        </div>
    </div>
@endsection

@section('content')
    <div class="card">
        <x-form :action="route('helpdesk.agih', ['complaint' => $complaint])" method="POST">
            <div class="card-body">

                <div class="mb-3 row">
                    <div class="col-2">No Tiket</div>
                    <div class="col">{{ $complaint->no_tiket }}</div>
                </div>

                <div class="mb-3 row">
                    <div class="col-2">Aduan</div>
                    <div class="col">
                        <strong>{{ $complaint->title }}</strong><br>
                        {{ $complaint->detail }}
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="status" class="col-2 col-form-label">Status</label>
                    <div class="col-auto">
                        <select name="status" @class(['form-select', 'is-invalid' => $errors->has('status')])>
                            <option value="">-- Pilihan --</option>
                            <option value="dalam_tindakan">Dalam Tindakan</option>
                            <option value="selesai">Selesai</option>
                            <option value="tutup">Tutup</option>
                        </select>
                        <x-inputs.error name="status" />
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="officer_id" class="col-2 col-form-label">Tindakan</label>
                    <div class="col-6">
                        <x-inputs.textarea name="detail" />
                        <x-inputs.error name="detail" />
                    </div>
                </div>
            </div>

            <div class="card-footer d-flex justify-content-end">
                <a href="{{ route('helpdesk.index') }}" class="btn btn-ghost-secondary me-auto">Kembali</a>
                <button type="submit" class="btn btn-primary ms-auto">Simpan</button>
            </div>
        </x-form>
    </div>
@endsection
