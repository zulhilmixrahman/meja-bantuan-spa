@extends('layouts.main')

@section('page-header')
    <div class="row g-2 align-items-center">
        <div class="col">
            <h2 class="page-title">@lang('Users')</h2>
            <div class="text-muted mt-1">@lang('Edit user')</div>
        </div>
    </div>
@endsection

@section('content')
    <div class="card">
        <x-form :action="route('admin.users.update', $user)" method="PUT" :hasFiles="true">
            <div class="card-body">
                <div class="mb-3 row">
                    <label for="avatar" class="col-2 col-form-label align-self-center">@lang('Avatar')</label>
                    @if ($user->avatar != null)
                        <div class="col-2 text-center align-self-center">
                            <img src="{{ asset('storage/' . $user->avatar) }}" class="img-thumbnail rounded mb-1"
                                alt="User Avatar" style="height: 150px; width: auto;">
                        </div>
                    @endif
                    <div class="col-6 align-self-end">
                        <input type="file" name="avatar" class="form-control @error('avatar') is-invalid @enderror"
                            accept=".png,.jpg,.jpeg,.gif">
                        <x-inputs.error name="avatar" />
                        <small class="form-hint">@lang('Acceptable extensions'): .png, .jpg, .jpeg, .gif</small>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="name" class="col-2 col-form-label">@lang('Full Name')</label>
                    <div class="col">
                        <x-inputs.input type="text" name="name" :value="$user->name" />
                        <x-inputs.error name="name" />
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="email" class="col-2 col-form-label">@lang('Email')</label>
                    <div class="col-6">
                        <x-inputs.input type="email" name="email" :value="$user->email" />
                        <x-inputs.error name="email" />
                    </div>
                </div>

                <div class="mb-3 row">
                    <label class="col-2 col-form-label">@lang('Roles')</label>
                    <div class="col-4">
                        <ul class="list-group">
                            @foreach ($roles as $role)
                                <li class="list-group-item py-2 px-2">
                                    <label class="form-check mb-0">
                                        <input type="checkbox" name="roles[]" value="{{ $role->name }}"
                                            class="form-check-input" @checked(in_array($role->name, $user->roles_in_array))>{{ ucwords($role->name) }}
                                    </label>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                </div>
            </div>

            <div class="card-footer text-end">
                <div class="d-flex">
                    <a href="{{ route('admin.users.index') }}" class="btn btn-link">@lang('Back')</a>
                    @if ($user->id !== auth()->user()->id)
                        @can('delete user')
                            <x-buttons.delete :url="route('admin.users.destroy', $user)" buttonClass="outline-danger"
                                text="{{ $user->name }} ({{ $user->email }})" />
                        @endcan
                    @endif
                    @can('edit user')
                        <button type="submit" class="btn btn-warning ms-auto">@lang('Update')</button>
                    @endcan
                </div>
            </div>
        </x-form>
    </div>
@endsection
