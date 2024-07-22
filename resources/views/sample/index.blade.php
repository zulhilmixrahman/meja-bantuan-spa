@extends('layouts.main')

@section('page-header')
    <div class="row g-2 align-items-center">
        <div class="col">
            <h2 class="page-title">
                Sample Table
            </h2>
        </div>
        <!-- Page title actions -->
        <div class="col-auto ms-auto d-print-none">
            <div class="btn-list">
                <a href="{{ url('sample/form') }}" class="btn btn-primary d-sm-inline-block">
                    <i class="fa-solid fa-plus"></i> Add Record
                </a>
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
                        <td class="text-center">#</td>
                        <td>Header 1</td>
                        <td>Header 2</td>
                        <td>Header 3</td>
                        <td>Action</td>
                    </tr>
                </thead>
                <tbody>
                    @for ($item = 1; $item <= rand(3, 10); $item++)
                    @php ($name = fake()->name())
                        <tr>
                            <td class="text-center">{{ $item }}</td>
                            <td>{{ $name }}</td>
                            <td>{{ fake()->freeEmail() }}</td>
                            <td>{{ fake()->sentence() }}</td>
                            <td class="text-center align-middle">
                                <button type="button" class="btn btn-yellow btn-icon">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                </button>
                                <x-buttons.delete :url="url('/sample/delete')" :text="$name" />
                            </td>
                        </tr>
                    @endfor
                </tbody>
            </table>
        </div>
    </div>
@endsection
