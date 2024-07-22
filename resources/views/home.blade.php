@extends('layouts.main')

@section('page-header')
    <div class="row g-2 align-items-center">
        <div class="col">
            <h2 class="page-title">Dashboard</h2>
        </div>
    </div>
@endsection

@section('content')
    <div class="card">
        <div class="card-body">
            <h2>Hi {{ auth()->user()->name }}! <small class="text-body-secondary">You are logged in.</small></h2>
        </div>
    </div>
@endsection
