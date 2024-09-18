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
            <div class="d-flex mb-2">
                <a href="{{ route('helpdesk.download') }}" class="btn btn-dark ms-auto">Download</a>
            </div>

            <table class="table table-bordered table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <td class="text-center">#</td>
                        <td>Tiket</td>
                        <td>Kategori</td>
                        <td>Sub Kategori</td>
                        <td>Pegawai Kes</td>
                        <td>Tindakan</td>
                    </tr>
                </thead>
                <tbody>
                    @php($index = $complaints->firstItem())
                    @foreach ($complaints as $complaint)
                        <tr>
                            <td class="text-center">{{ $index++ }}</td>
                            <td>{{ $complaint->no_tiket }}</td>
                            <td>{{ $complaint->sub_category->category->name }}</td>
                            <td>{{ $complaint->sub_category->name }}</td>
                            <td>{{ $complaint->officer->name ?? 'Tiada' }}</td>
                            <td class="text-center align-middle">
                                @can('agih aduan')
                                <a href="{{ route('helpdesk.agih', ['complaint' => $complaint->id]) }}" class="btn btn-purple">
                                    Agih Aduan
                                </a>
                                @endcan

                                @can('kemaskini tindakan')
                                <a href="{{ route('helpdesk.tindakan', ['complaint' => $complaint->id]) }}" class="btn btn-lime">
                                    Tindakan
                                </a>
                                <a href="{{ route('helpdesk.logs', ['complaint' => $complaint->id]) }}" class="btn btn-blue">
                                    Log Tindakan
                                </a>
                                @endcan
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>

            <div>{{ $complaints->links() }}</div>
        </div>
    </div>
@endsection
