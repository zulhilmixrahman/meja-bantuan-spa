@props(['id', 'name', 'value', 'checkedVal' => null, 'type' => 'radio', 'required' => false])
<input type="{{ $type }}" id="{{ $id }}" name="{{ $name }}" value="{{ $value }}" {{ $required ? 'required' : '' }} {{
    $attributes->merge(['class' => 'form-check-input' . ($errors->has($name) ? ' is-invalid' : '')]) }}
@checked(old($name, $checkedVal)==$value)>
