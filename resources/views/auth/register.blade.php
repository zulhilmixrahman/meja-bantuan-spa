@extends('layouts.auth')

@section('content')
<div class="card card-md">
    <div class="card-body">
        <h2 class="h2 text-center mb-4">@lang('Create account') {{ config('app.name') }}</h2>
        <x-form :action="route('register')">
            <div class="mb-3">
                <label class="form-label">@lang('Name')</label>
                <input type="name" name="name" class="form-control @error('name') is-invalid @enderror"
                    placeholder="@lang('Enter name')" autocomplete="off">
                @error('name')
                <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>

            <div class="mb-3">
                <label class="form-label">@lang('Email Address')</label>
                <input type="email" name="email" class="form-control @error('email') is-invalid @enderror"
                    placeholder="@lang('Enter email')" autocomplete="off">
                @error('email')
                <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>

            <div class="mb-2">
                <label class="form-label">@lang('Password')</label>
                <div class="input-group has-validation">
                    <input type="password" name="password"
                        class="input-password form-control @error('password') is-invalid @enderror"
                        placeholder="@lang('Your password')" autocomplete="off">
                    <span class="input-group-text display-password fa-solid fa-eye"></span>
                    @error('password')
                    <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>
            </div>

            <div class="form-footer">
                <button type="submit" class="btn btn-primary w-100">@lang('Create new account')</button>
            </div>
        </x-form>
    </div>
</div>
<div class="text-center text-secondary mt-3">
    @lang('Already have account?') <a href="{{ route('login') }}">@lang('Login')</a>
</div>
@endsection

@section('right-block')
<img src="{{ asset('images/illustrations/undraw_work_together_h63l.svg') }}" height="300" class="d-block mx-auto">
@endsection
