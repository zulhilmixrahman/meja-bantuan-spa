@extends('layouts.main')

@section('page-header')
    <div class="row g-2 align-items-center">
        <div class="col">
            <h2 class="page-title">@lang('Roles')</h2>
        </div>
        <!-- Page title actions -->
        <div class="col-auto ms-auto d-print-none">
            <div class="btn-list">
                @can('add role')
                    <a href="{{ route('admin.roles.create') }}" class="btn btn-primary d-sm-inline-block">
                        <i class="fa-solid fa-plus"></i> @lang('Add Role')
                    </a>
                @endcan
            </div>
        </div>
    </div>
@endsection

@section('content')
    <div class="card">
        <div class="card-body">
            <table class="table table-bordered table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <td class="text-center" style="width: 50px;">#</td>
                        <td class="text-center">Role</td>
                        <td class="text-center" style="width: 20%;">Action</td>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($roles as $role)
                        <tr>
                            <td class="text-center">{{ $loop->iteration }}</td>
                            <td>{{ ucwords($role->name) }}</td>
                            <td class="text-center align-middle">
                                @can('edit role')
                                    <a href="{{ route('admin.roles.edit', $role) }}" class="btn btn-yellow btn-icon">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </a>
                                @endcan
                            </td>
                        </tr>
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
                </tbody>
            </table>
        </div>
    </div>
@endsection
