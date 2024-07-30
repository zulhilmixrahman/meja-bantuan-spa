@extends('layouts.main')

@section('page-header')
    <div class="row g-2 align-items-center">
        <div class="col">
            <h2 class="page-title">
                Tambah Sub Kategori
            </h2>
        </div>
    </div>
@endsection

@section('content')
    <div class="card">
        <x-form :action="route('admin.sub_categories.store')" method="POST">
            <div class="card-body">

                <div class="mb-3">
                    <label class="form-label">Kategori</label>
                    <select name="category_id" class="form-select">
                        <option value="">-- Pilihan --</option>
                        @foreach ($categories as $category)
                            <option value="{{ $category->id }}">
                                {{ $category->name }}
                            </option>
                        @endforeach
                    </select>
                    <x-inputs.error name="category_id" />
                </div>

                <div class="mb-3">
                    <label class="form-label">Sub Kategori</label>
                    <x-inputs.input type="text" name="name" />
                    <x-inputs.error name="name" />
                </div>

            </div>

            <div class="card-footer d-flex justify-content-end">
                <a href="{{ route('admin.sub_categories.index') }}" class="btn btn-ghost-secondary me-auto">Kembali</a>
                <button type="submit" class="btn btn-primary ms-auto">Simpan</button>
            </div>

        </x-form>
    </div>
@endsection
