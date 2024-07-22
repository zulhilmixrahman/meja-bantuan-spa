@extends('layouts.main')

@section('page-header')
    <div class="row g-2 align-items-center">
        <div class="col">
            <h2 class="page-title">@lang('Department')</h2>
            <div class="text-muted mt-1">@lang('Create new department')</div>
        </div>
    </div>
@endsection

@section('content')
    <div class="card">
        <x-form :action="route('admin.departments.store')">
            <div class="card-body">
                <div class="mb-3 row">
                    <label for="name" class="col-2 col-form-label">@lang('Department')</label>
                    <div class="col">
                        <x-inputs.input type="text" name="name" />
                        <x-inputs.error name="name" />
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="code" class="col-2 col-form-label">@lang('Code')</label>
                    <div class="col-3">
                        <x-inputs.input type="text" name="code" />
                        <x-inputs.error name="code" />
                    </div>
                </div>
            </div>

            <div class="card-footer text-end">
                <div class="d-flex">
                    <a href="{{ route('admin.departments.index') }}" class="btn btn-link">@lang('Back')</a>
                    @can('add department')
                    <button type="submit" class="btn btn-primary ms-auto">@lang('Submit')</button>
                    @endcan
                </div>
            </div>
        </x-form>
    </div>
@endsection
