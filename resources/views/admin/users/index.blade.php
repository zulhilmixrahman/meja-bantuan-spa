@extends('layouts.main')

@section('page-header')
    <div class="row g-2 align-items-center">
        <div class="col">
            <h2 class="page-title">@lang('Users')</h2>
        </div>
        <!-- Page title actions -->
        <div class="col-auto ms-auto d-print-none">
            <div class="btn-list">
                @can('add user')
                    <a href="{{ route('admin.users.create') }}" class="btn btn-primary d-sm-inline-block">
                        <i class="fa-solid fa-plus"></i> @lang('Add Record')
                    </a>
                @endcan
            </div>
        </div>
    </div>
@endsection

@section('content')
    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered table-striped table-hover">
                    <thead class="table-dark">
                        <tr>
                            <td class="text-center" style="width: 50px;">#</td>
                            <td class="text-center">Name</td>
                            <td class="text-center">Email</td>
                            <td class="text-center" style="width: 20%;">Action</td>
                        </tr>
                    </thead>
                    <tbody>
                        @php($index = $users->firstItem())
                        @forelse ($users as $user)
                            <tr>
                                <td class="text-center">{{ $index++ }}</td>
                                <td>{{ $user->name }}</td>
                                <td>{{ $user->email }}</td>
                                <td class="text-center align-middle">
                                    @can('edit user')
                                        <a href="{{ route('admin.users.edit', $user) }}" class="btn btn-yellow btn-icon">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                        </a>
                                    @endcan
                                    @if ($user->id !== auth()->user()->id)
                                        @can('delete user')
                                            <x-buttons.delete :url="route('admin.users.destroy', $user)"
                                                text="{{ $user->name }} ({{ $user->email }})" />
                                        @endcan
                                    @endif
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
            <div class="f-flex mt-3">{{ $users->links() }}</div>
        </div>
    </div>
@endsection
