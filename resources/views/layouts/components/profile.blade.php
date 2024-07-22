<div class="nav-item dropdown">
    <a href="#" class="nav-link d-flex lh-1 text-reset p-0" data-bs-toggle="dropdown" aria-label="Open user menu">
        <span class="avatar avatar-sm"
            style="background-image: url({{ auth()->user()->avatar ?? asset('images/avatar.png') }})"></span>
        <div class="d-none d-xl-block ps-2">
            <div>{{ auth()->user()->name ?? 'User Name' }}</div>
            <div class="mt-1 small text-muted">{{ auth()->user()->email ?? 'email' }}</div>
        </div>
    </a>
    <div class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
        <a href="#" class="dropdown-item">Profile</a>
        <a href="#" class="dropdown-item">Change Password</a>
        <div class="dropdown-divider"></div>
        <a href="#" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#logoutModal">@lang('Log out')</a>
    </div>
</div>
