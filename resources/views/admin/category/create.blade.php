@extends('layouts.main')

@section('page-header')
    <div class="row g-2 align-items-center">
        <div class="col">
            <h2 class="page-title">
                Tambah Kategori
            </h2>
        </div>
    </div>
@endsection

@section('content')
    <div class="card">
        <x-form :action="route('admin.categories.store')" method="POST">
            <div class="card-body">

                <!-- Default form layout -->
                <div class="mb-3">
                    <label class="form-label">Kategori</label>
                    <x-inputs.input type="text" name="name" placeholder="Contoh: Peralatan" />
                    <x-inputs.error name="name" />
                </div>

            </div>

            <div class="card-footer d-flex justify-content-end">
                <a href="{{ route('admin.categories.index') }}" class="btn btn-ghost-secondary me-auto">Kembali</a>
                <button type="submit" class="btn btn-primary ms-auto">Simpan</button>
            </div>

        </x-form>
    </div>
@endsection
