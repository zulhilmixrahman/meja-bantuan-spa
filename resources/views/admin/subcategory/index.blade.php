@extends('layouts.main')

@section('page-header')
    <div class="row g-2 align-items-center">
        <div class="col">
            <h2 class="page-title">
                Senarai Sub Kategori
            </h2>
        </div>
        <!-- Page title actions -->
        <div class="col-auto ms-auto d-print-none">
            <div class="btn-list">
                <a href="{{ route('admin.sub_categories.create') }}" class="btn btn-primary d-sm-inline-block">
                    <i class="fa-solid fa-plus"></i> Tambah
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
                        <td>Kategori</td>
                        <td>Sub Kategori</td>
                        <td>Tindakan</td>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($senarai_sub_kategori as $item)
                        <tr>
                            <td class="text-center">{{ $loop->iteration }}</td>
                            <td>{{ $item->category_id }}</td>
                            <td>{{ $item->name }}</td>
                            <td class="text-center align-middle">
                                <a href="{{ route('admin.sub_categories.edit', ['sub_category' => $item]) }}" class="btn btn-yellow btn-icon">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                </a>
                                <x-buttons.delete :url="route('admin.sub_categories.destroy', ['sub_category' => $item])" :text="$item->name" />
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
@endsection
