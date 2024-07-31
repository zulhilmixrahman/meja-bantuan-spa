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
                        <td>Tiket</td>
                        <td>Kategori</td>
                        <td>Sub Kategori</td>
                        <td>Tindakan</td>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($complaints as $complaint)
                        <tr>
                            <td class="text-center">{{ $loop->iteration }}</td>
                            <td>{{ $complaint->no_tiket }}</td>
                            <td>{{ $complaint->sub_category->category->name }}</td>
                            <td>{{ $complaint->sub_category->name }}</td>
                            <td class="text-center align-middle">
                                <a href="{{ route('helpdesk.agih', ['complaint' => $complaint->id]) }}" class="btn btn-purple">
                                    Agih Aduan
                                </a>
                                <a href="{{ route('helpdesk.tindakan', ['complaint' => $complaint->id]) }}" class="btn btn-lime">
                                    Tindakan
                                </a>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
@endsection
