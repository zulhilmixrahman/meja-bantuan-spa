<!doctype html>
<html lang="{{ config('app.locale') }}">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ config('app.name') }}</title>
    <!-- CSS files -->
    <link href="{{ asset('tabler/css/tabler.min.css?1684106062') }}" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
    <link href="{{ asset('tabler/css/demo.min.css?1684106062') }}" rel="stylesheet" />
    <style>
        @import url('https://rsms.me/inter/inter.css');

        :root {
            --tblr-font-sans-serif: 'Inter Var', -apple-system, BlinkMacSystemFont, San Francisco, Segoe UI, Roboto, Helvetica Neue, sans-serif;
        }

        body {
            font-feature-settings: "cv03", "cv04", "cv11";
        }
    </style>
    @yield('page-styles')
</head>

<body>
    <script src="{{ asset('tabler/js/demo-theme.min.js?1684106062') }}"></script>
    <div class="page">
        <!-- Sidebar -->
        @include('layouts.components.sidebar')
        <!-- Navbar -->
        @include('layouts.components.navbar')
        <div class="page-wrapper">
            <!-- Page header -->
            <div class="page-header d-print-none">
                <div class="container-xl">
                    @yield('page-header')
                </div>
            </div>
            <!-- Page body -->
            <div class="page-body">
                <div class="container-xl">
                    @include('layouts.components.alerts')
                    @yield('content')
                </div>
            </div>
            <footer class="footer footer-transparent d-print-none">
                <div class="container-fluid">
                    <div class="row text-end">
                        <div class="col mt-3 mt-lg-0">
                            Copyright &copy; {{ now()->year }}
                            <a href="https://github.com/zulhilmixrahman" class="link-secondary">Tabler</a>.
                            All rights reserved.
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>

    @include('layouts.components.modals')
    <!-- Tabler Core -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="{{ asset('tabler/js/tabler.min.js?1684106062') }}" defer></script>
    <script>
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $(document).ready(function() {
            $('#deleteModal').on('show.bs.modal', function(event) {
                var button = $(event.relatedTarget); // Button that triggered the modal
                var url = button.data('url'); // Extract info from data-* attributes
                var textMsg = button.data('text'); // Extract info from data-* attributes
                $('#modalFormDelete').attr('action', url);
                $('#textMsg').text(textMsg);
            });

        });
    </script>
    @yield('page-scripts')
</body>

</html>
