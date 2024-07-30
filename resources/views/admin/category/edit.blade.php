@extends('layouts.main')

@section('page-header')
    <div class="row g-2 align-items-center">
        <div class="col">
            <h2 class="page-title">
                Kemaskini Kategori
            </h2>
        </div>
    </div>
@endsection

@section('content')
    <div class="card">
        <x-form :action="route('admin.categories.update', ['category' => $kategori])" method="PUT">
            <div class="card-body">

                <!-- Default form layout -->
                <div class="mb-3">
                    <label class="form-label">Kategori</label>
                    <x-inputs.input type="text" name="name" placeholder="Contoh: Peralatan" :value="$kategori->name" />
                    <x-inputs.error name="name" />
                </div>

            </div>

            <div class="card-footer d-flex justify-content-end">
                <a href="{{ route('admin.categories.index') }}" class="btn btn-ghost-secondary me-auto">Kembali</a>
                <button type="submit" class="btn btn-yellow ms-auto">Kemaskini</button>
            </div>

        </x-form>
    </div>
@endsection
