@props(['name', 'value', 'required' => false])
<textarea id="{{ $name }}" name="{{ $name }}" rows="{{ $rows ?? 5 }}" {{ $required ? 'required' : '' }} {{
    $attributes->merge(['class' => 'form-control' . ($errors->has($name) ? ' is-invalid' : '')]) }}>{{ old($name, $value ?? '') }}</textarea>
