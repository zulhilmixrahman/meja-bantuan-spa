@props(['type' => 'text', 'name', 'id' => null, 'value', 'required' => false])
<input type="{{ $type }}" id="{{ $id ?? $name }}" name="{{ $name }}" value="{{ old($name, $value ?? null) }}"
    {{ $attributes->merge(['class' => 'form-control' . ($errors->has($name) ? ' is-invalid' : '')]) }}
    {{ $required ? 'required' : '' }} autocomplete="off">
