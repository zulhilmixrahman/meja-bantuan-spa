@extends('layouts.main')

@section('page-header')
    <div class="row g-2 align-items-center">
        <div class="col">
            <h2 class="page-title">@lang('Permissions')</h2>
        </div>
    </div>
@endsection

@section('content')
    <div class="card">
        <x-form :action="route('admin.permissions.store')">
            <div class="card-body">
                <div class="mb-3 row">
                    <label for="name" class="col-2 col-form-label">@lang('Permission')</label>
                    <div class="col">
                        <x-inputs.input type="text" name="name" />
                        <x-inputs.error name="name" />
                        <small class="form-hint">*@lang('Permission name will be save as lowercase string')</small>
                    </div>
                </div>
            </div>

            <div class="card-footer text-end">
                <div class="d-flex">
                    <a href="{{ route('admin.permissions.index') }}" class="btn btn-link">@lang('Back')</a>
                    @can('add permission')
                        <button type="submit" class="btn btn-primary ms-auto">@lang('Submit')</button>
                    @endcan
                </div>
            </div>
        </x-form>
    </div>
@endsection
