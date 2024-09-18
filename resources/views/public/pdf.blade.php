@extends('layouts.pdf')

@section('title', $complaint->no_tiket)

@section('content')
    <h1 style="text-align: center">{{ config('app.name') }}</h1>

    <table>
        <tr>
            <th style="width: 200px;">No Tiket</th>
            <td>{{ $complaint->no_tiket }}</td>
        </tr>

        <tr>
            <th>Nama Pengadu</th>
            <td>{{ $complaint->user_name }}</td>
        </tr>

        <tr>
            <th>Emel Pengadu</th>
            <td>{{ $complaint->user_email }}</td>
        </tr>

        <tr>
            <th>No Tel Pengadu</th>
            <td>{{ $complaint->user_tel }}</td>
        </tr>

        <tr>
            <th>Kategori</th>
            <td>{{ $complaint->sub_category->category->name }} / {{ $complaint->sub_category->name }}</td>
        </tr>

        <tr>
            <th>Tajuk Aduan</th>
            <td>{{ $complaint->title }}</td>
        </tr>

        <tr>
            <th>Butiran Aduan</th>
            <td>{{ $complaint->detail }}</td>
        </tr>
    </table>
@endsection
