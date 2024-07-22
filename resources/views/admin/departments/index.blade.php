@extends('layouts.main')

@section('page-header')
    <div class="row g-2 align-items-center">
        <div class="col">
            <h2 class="page-title">@lang('Departments')</h2>
        </div>
        <!-- Page title actions -->
        <div class="col-auto ms-auto d-print-none">
            <div class="btn-list">
                @can('add department')
                    <a href="{{ route('admin.departments.create') }}" class="btn btn-primary d-sm-inline-block">
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
                            <td class="text-center">Department</td>
                            <td class="text-center" style="width: 20%;">Action</td>
                        </tr>
                    </thead>
                    <tbody>
                        @php($index = $departments->firstItem())
                        @forelse ($departments as $department)
                            <tr>
                                <td class="text-center">{{ $index++ }}</td>
                                <td>{{ $department->code ?? '#' }}: {{ $department->name }}</td>
                                <td class="text-center align-middle">
                                    @can('edit department')
                                        <a href="{{ route('admin.departments.edit', $department) }}"
                                            class="btn btn-yellow btn-icon">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                        </a>
                                    @endcan
                                    @can('delete department')
                                        <x-buttons.delete :url="route('admin.departments.destroy', $department)" :text="$department->name" />
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
            <div class="f-flex mt-3">{{ $departments->links() }}</div>
        </div>
    </div>
@endsection
