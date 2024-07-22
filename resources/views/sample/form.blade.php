@extends('layouts.main')

@section('page-header')
    <div class="row g-2 align-items-center">
        <div class="col">
            <h2 class="page-title">
                Sample Form
            </h2>
        </div>
    </div>
@endsection

@section('content')
    <div class="card">
        <x-form :action="url('sample/save')" method="PUT">
            <div class="card-body">
                <!-- Inline form layout -->
                <div class="mb-3 row">
                    <label for="username" class="col-2 col-form-label">Username</label>
                    <div class="col-4">
                        <x-inputs.inputname="username" id="userid" placeholder="Label Text 1" />
                        <x-inputs.error name="username" />
                    </div>

                    <label for="email" class="col-2 col-form-label">Email</label>
                    <div class="col-4">
                        <x-inputs.input type="email" name="email" placeholder="Label Text 2" />
                        <x-inputs.error name="email" />
                    </div>
                </div>

                <!-- Default form layout -->
                <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <x-inputs.input type="text" name="fullname" placeholder="Full Row Text" />
                    <x-inputs.error name="fullname" />
                </div>

                <div class="mb-3">
                    <label for="address" class="form-label">Address</label>
                    <x-inputs.textarea name="address" />
                    <x-inputs.error name="address" />
                </div>

                <div class="mb-3 row">
                    <div class="col">
                        <x-inputs.input type="number" name="postcode" placeholder="Postcode" />
                        <x-inputs.error name="postcode" />
                    </div>

                    <label for="state" class="col-2 col-form-label">State</label>
                    <div class="col-6">
                        <select name="state" @class(['form-select', 'is-invalid' => $errors->has('state')])>
                            <option value="">-- Pilihan --</option>
                            @foreach ($states as $key => $value)
                                <option value="{{ $key }}" @selected($key == old('state', $state_id))>{{ $value }}
                                </option>
                            @endforeach
                        </select>
                        <x-inputs.error name="state" />
                    </div>
                </div>

                <!-- Checkbox / Radio button -->
                <div class="mb-3 row">
                    <div class="col">
                        <div class="form-check">
                            <x-inputs.check type="radio" name="rd" id="radio1" value="radio1" />
                            <label class="form-check-label" for="radio1">Radio button</label>
                            <x-inputs.error name="rd" />
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-check">
                            <x-inputs.check type="checkbox" name="ck" id="check1" value="check1" />
                            <label class="form-check-label" for="check1">Checkbox</label>
                            <x-inputs.error name="ck" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="card-footer d-flex justify-content-end">
                <a href="{{ route('home') }}" class="btn btn-ghost-secondary me-auto">Kembali</a>
                <button type="submit" class="btn btn-primary ms-auto">Simpan</button>
            </div>

        </x-form>
    </div>
@endsection
