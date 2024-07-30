@extends('layouts.blank')

@section('content')
    <div class="card">
        <x-form :action="route('public.complaint')" method="POST">
            <div class="card-body">
                <div class="mb-3 row">
                    <label for="username" class="col-2 col-form-label">Nama Pengadu</label>
                    <div class="col">
                        <x-inputs.input name="user_name" />
                        <x-inputs.error name="user_name" />
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="username" class="col-2 col-form-label">Emel Pengadu</label>
                    <div class="col-4">
                        <x-inputs.input type="email" name="user_email" />
                        <x-inputs.error name="user_email" />
                    </div>

                    <label for="email" class="col-2 col-form-label">No Tel Pengadu</label>
                    <div class="col-4">
                        <x-inputs.input name="user_tel" />
                        <x-inputs.error name="user_tel" />
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="category_id" class="col-2 col-form-label">Kategori</label>
                    <div class="col">
                        <select name="category_id" @class(['form-select', 'is-invalid' => $errors->has('category_id')])>
                            <option value="">-- Pilihan --</option>
                            @foreach ($categories as $category)
                                <option value="{{ $category->id }}" @selected($category->id == old('category_id'))>
                                    {{ $category->name }}
                                </option>
                            @endforeach
                        </select>
                        <x-inputs.error name="category_id" />
                    </div>
                    <div class="col">
                        <select name="sub_category_id" @class([
                            'form-select',
                            'is-invalid' => $errors->has('sub_category_id'),
                        ])>
                            <option value="">-- Pilihan --</option>
                        </select>
                        <x-inputs.error name="sub_category_id" />
                    </div>
                </div>

                <!-- Default form layout -->
                <div class="mb-3">
                    <label class="form-label">Tajuk Aduan</label>
                    <x-inputs.input type="text" name="title" />
                    <x-inputs.error name="title" />
                </div>

                <div class="mb-3">
                    <label for="detail" class="form-label">Butiran Aduan</label>
                    <x-inputs.textarea name="detail" />
                    <x-inputs.error name="detail" />
                </div>
            </div>

            <div class="card-footer d-flex justify-content-end">
                <a href="{{ route('home') }}" class="btn btn-ghost-secondary me-auto">Kembali</a>
                <button type="submit" class="btn btn-primary ms-auto">Simpan</button>
            </div>

        </x-form>
    </div>
@endsection
