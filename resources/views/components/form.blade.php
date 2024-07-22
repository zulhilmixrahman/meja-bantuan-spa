@props(['action' => '', 'method' => 'POST', 'hasFiles' => false])
@php($method = strtoupper($method))
<form method="{{ $method !== 'GET' ? 'POST' : $method }}" {!! $action !== '' ? 'action="' . $action . '"' : '' !!} {!! $hasFiles ? 'enctype="multipart/form-data"' : '' !!}
    {{ $attributes }}>
    @if ($method != 'GET')
        @csrf
    @endif
    @if (!in_array($method, ['POST', 'GET']))
        @method($method)
    @endif
    {{ $slot }}
</form>
