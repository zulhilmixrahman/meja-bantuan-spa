@extends('layouts.main')

@section('page-header')
    <div class="row g-2 align-items-center">
        <div class="col">
            <h2 class="page-title">
                Senarai Aduan
            </h2>
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
                        <td>Tindakan</td>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($complaint->logs as $log)
                        <tr>
                            <td class="text-center">{{ $loop->iteration }}</td>
                            <td>{{ $log->detail }}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
@endsection
