<div class="modal fade" id="logoutModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered">
        <div class="modal-content">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-status bg-danger"></div>
            <div class="modal-body text-center py-4">
                <h3>@lang('Log out')</h3>
                <div class="text-muted">@lang('Are you sure you want to log out?')</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-link me-auto" data-bs-dismiss="modal">@lang('Cancel')</button>
                <button type="button" class="btn btn-danger btn-icon"
                    onclick="event.preventDefault(); document.getElementById('logout-form').submit();">@lang('Yes, Log me out')</button>
            </div>
        </div>
    </div>
    <x-form :action="route('logout')" method="POST" style="display: none;" id="logout-form" />
</div>

<div class="modal fade" id="deleteModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered">
        <x-form method="DELETE" id="modalFormDelete">
            <div class="modal-content">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <div class="modal-status bg-danger"></div>
                <div class="modal-body text-center py-4">
                    <h3>@lang('Delete Record')</h3>
                    <div class="text-muted">@lang('Are you sure you want to delete this record?')</div>
                    <div id="textMsg"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-link me-auto" data-bs-dismiss="modal">
                        @lang('Cancel')
                    </button>
                    <button type="submit" class="btn btn-danger">
                        @lang('Yes, Delete it!')
                    </button>
                </div>
            </div>
        </x-form>
    </div>
</div>
</div>
