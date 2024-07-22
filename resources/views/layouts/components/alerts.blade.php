@session('success')
    <div class="alert alert-success alert-dismissible" role="alert">
        <div class="d-flex">
            <div class="me-3"><i class="fa-solid fa-check"></i></div>
            <div>{{ $value ?? 'Action success' }}</div>
        </div>
        <a class="btn-close" data-bs-dismiss="alert" aria-label="close"></a>
    </div>
@endsession

@session('info')
    <div class="alert alert-info alert-dismissible" role="alert">
        <div class="d-flex">
            <div class="me-3"><i class="fa-solid fa-info"></i></div>
            <div>{{ $value ?? 'Simple info' }}</div>
        </div>
        <a class="btn-close" data-bs-dismiss="alert" aria-label="close"></a>
    </div>
@endsession

@session('warning')
<div class="alert alert-warning" role="alert">
    <div class="d-flex">
        <div class="me-3"><i class="fa-solid fa-question"></i></div>
        <div>{{ $value ?? 'Something missing' }}</div>
    </div>
</div>
@endsession

@session('error')
<div class="alert alert-important alert-danger" role="alert">
    <div class="d-flex">
        <div class="me-3"><i class="fa-solid fa-triangle-exclamation"></i></div>
        <div>{{ $value ?? 'Something wrong!' }}</div>
    </div>
</div>
@endsession
