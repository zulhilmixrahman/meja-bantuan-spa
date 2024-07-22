@extends('layouts.auth')

@section('content')
<div class="card card-md">
    <div class="card-body">
        <h2 class="h2 text-center mb-4">@lang('Login') {{ config('app.name') }}</h2>
        <x-form :action="route('login')">
            <div class="mb-3">
                <label class="form-label">@lang('Email Address')</label>
                <input type="email" name="email" class="form-control @error('email') is-invalid @enderror"
                    placeholder="@lang('your@email.com')" autocomplete="off">
                @error('email')
                <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>
            <div class="mb-2">
                <label class="form-label">
                    @lang('Password')
                    <span class="form-label-description">
                        <a href="{{ route('password.request') }}">@lang('I forgot password')</a>
                    </span>
                </label>
                <div class="input-group input-group-flat">
                    <input type="password" name="password" class="input-password form-control"
                        placeholder="@lang('Your password')" autocomplete="off">
                    <span class="input-group-text display-password fa-solid fa-eye"></span>
                </div>
            </div>
            <div class="form-footer">
                <button type="submit" class="btn btn-primary w-100">@lang('Login')</button>
            </div>
        </x-form>
    </div>
</div>
<div class="text-center text-secondary mt-3">
    @lang('Don\'t have account yet?') <a href="{{ route('register') }}">@lang('Register')</a>
</div>
@endsection
