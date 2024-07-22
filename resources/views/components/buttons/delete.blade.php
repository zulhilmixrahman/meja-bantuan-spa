@props(['url', 'buttonClass' => 'danger', 'text' => null, 'label' => null])
<button type="button" class="btn btn-{{ $buttonClass }} {{ is_null($label) ? 'btn-icon' : '' }}" data-bs-toggle="modal"
    data-bs-target="#deleteModal" data-url="{{ $url }}" data-text="{{ $text }}">
    {!! $label ?? '<i class="fa-solid fa-trash-can"></i>' !!}
</button>
