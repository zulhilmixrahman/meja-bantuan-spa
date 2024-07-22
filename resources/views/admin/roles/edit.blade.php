@extends('layouts.main')

@section('page-header')
    <div class="row g-2 align-items-center">
        <div class="col">
            <h2 class="page-title">@lang('Roles')</h2>
        </div>
    </div>
@endsection

@section('content')
    <div class="card">
        <x-form :action="route('admin.roles.update', $role)" method="PUT">
            <div class="card-body">
                <div class="mb-3 row">
                    <label for="name" class="col-2 col-form-label">@lang('Role')</label>
                    <div class="col">
                        <x-inputs.input type="text" name="name" :value="$role->name" />
                        <x-inputs.error name="name" />
                        <small class="form-hint">*@lang('Role name will be save as lowercase string')</small>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label class="col-2 col-form-label">@lang('Permission')</label>
                    <div class="col">
                        @if ($permissions->count() > 0)
                            <div class="row">
                                @foreach ($permissions as $name => $permission)
                                    <div class="col-3">
                                        <div class="card border">
                                            <div class="card-header text-bg-dark py-2">
                                                <h6 class="card-title text-capitalize text-white mb-0">
                                                    {{ $name }}
                                                </h6>
                                            </div>
                                            <div class="card-body p-1">
                                                @foreach ($permission as $item)
                                                    <li
                                                        class="list-group-item d-flex justify-content-between align-items-center p-1">
                                                        <div class="form-check">
                                                            <input type="checkbox" name="permissions[]"
                                                                id="box{{ $item->id }}" value="{{ $item->name }}"
                                                                class="form-check-input" @checked(in_array($item->id, $rolePermissions))>
                                                            <label for="box{{ $item->id }}"
                                                                class="form-check-label">{{ $item->name }}</label>
                                                        </div>
                                                    </li>
                                                @endforeach
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        @endif
                    </div>
                </div>
            </div>

            <div class="card-footer text-end">
                <div class="d-flex">
                    <a href="{{ route('admin.roles.index') }}" class="btn btn-link">@lang('Back')</a>
                    @can('edit role')
                        <button type="submit" class="btn btn-warning ms-auto">@lang('Update')</button>
                    @endcan
                </div>
            </div>
        </x-form>
    </div>
@endsection
