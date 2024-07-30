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
        <x-form :action="route('admin.sub_categories.update', ['sub_category' => $sub_category])" method="PUT">
            <div class="card-body">

                <div class="mb-3">
                    <label class="form-label">Kategori</label>
                    <select name="category_id" class="form-select @error('category_id') is-invalid @enderror">
                        <option value="">-- Pilihan --</option>
                        @foreach ($categories as $category)
                            <option value="{{ $category->id }}" @selected(old('category_id', $sub_category->category_id) == $category->id)>
                                {{ $category->name }}
                            </option>
                        @endforeach
                    </select>
                    <x-inputs.error name="category_id" />
                </div>

                <div class="mb-3">
                    <label class="form-label">Sub Kategori</label>
                    <x-inputs.input type="text" name="name" :value="$sub_category->name" />
                    <x-inputs.error name="name" />
                </div>

            </div>

            <div class="card-footer d-flex justify-content-end">
                <a href="{{ route('admin.sub_categories.index') }}" class="btn btn-ghost-secondary me-auto">Kembali</a>
                <button type="submit" class="btn btn-yellow ms-auto">Kemaskini</button>
            </div>

        </x-form>
    </div>
@endsection
