@extends('layouts.main')

@section('page-header')
    <div class="row g-2 align-items-center">
        <div class="col">
            <h2 class="page-title">@lang('Permissions')</h2>
        </div>
        <!-- Page title actions -->
        <div class="col-auto ms-auto d-print-none">
            <div class="btn-list">
                @can('add permission')
                    <a href="{{ route('admin.permissions.create') }}" class="btn btn-primary d-sm-inline-block">
                        <i class="fa-solid fa-plus"></i> @lang('Add Permission')
                    </a>
                @endcan
            </div>
        </div>
    </div>
@endsection

@section('page-styles')
<style>
    .copy-text {
        cursor: copy;
    }
</style>
@endsection

@section('content')
    <div class="card">
        <div class="card-body">
            @forelse ($permissions as $permission)
                <span class="badge bg-{{ $permission->color }} mb-2 copy-text"
                    data-text="{{ $permission->name }}">{{ ucwords($permission->name) }}</span>
            @empty
                <div class="alert alert-warning" role="alert">
                    <div class="d-flex">
                        <div class="my-auto mx-3">
                            <i class="fa-solid fa-triangle-exclamation fa-2xl"></i>
                        </div>
                        <div>
                            <h4 class="alert-title">@lang('No record found')!</h4>
                            <div class="text-secondary">@lang('You can try to add new record first')</div>
                        </div>
                    </div>
                </div>
            @endforelse

            <div class="form-text mt-5 fst-italic">@lang('Click button to copy permission name')</div>
        </div>
    </div>

    <div class="toast-container position-fixed bottom-0 end-0 p-3">
        <div id="copiedToast" class="toast align-items-center bg-primary-subtle border-0" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="d-flex">
                <div class="toast-body">Permission name copied!</div>
                <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
        </div>
    </div>
@endsection

@section('page-scripts')
    <script>
        $(document).ready(function() {
            $('.copy-text').click(function() {
                $("#copiedToast").toast("show");
                navigator.clipboard.writeText($(this).data('text').trim());
            });
        });
    </script>
@endsection
