@extends('layouts.auth')

@section('content')
    <div class="card card-md">
        <div class="card-body">
            <h2 class="h2 text-center mb-4">@lang('Reset Password')</h2>

            @session('status')
                <div class="alert alert-important alert-success" role="alert">
                    {{ $value }}
                </div>
            @endsession

            <x-form :action="route('password.email')">
                <div class="mb-3">
                    <label class="form-label">@lang('Email Address')</label>
                    <input type="email" class="form-control" placeholder="@lang('your@email.com')" autocomplete="off">
                </div>

                <div class="form-footer">
                    <button type="submit" class="btn btn-primary w-100">@lang('Send Password Reset Link')</button>
                </div>
            </x-form>
        </div>
    </div>
@endsection

@section('right-block')
    <img src="{{ asset('images/illustrations/undraw_sign_in_e6hj.svg') }}" height="300" class="d-block mx-auto">
@endsection
