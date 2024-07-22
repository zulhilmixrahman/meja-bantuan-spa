<!doctype html>
<html lang="{{ config('app.locale') }}">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
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
</head>

<body class=" d-flex flex-column">
    <script src="{{ asset('tabler/js/demo-theme.min.js?1684106062') }}"></script>
    <div class="page page-center">
        <div class="container container-normal py-4">
            <div class="row align-items-center g-4">
                <div class="col-lg">
                    <div class="container-tight">
                        <div class="text-center mb-4">
                            <a href="{{ url('/') }}" class="navbar-brand navbar-brand-autodark">
                                <img src="{{ asset('images/logo.svg') }}" height="100" alt="Jata Negara">
                            </a>
                        </div>
                        @yield('content')
                    </div>
                </div>
                <div class="col-lg d-none d-lg-block">
                    @yield('right-block')
                    @sectionMissing('right-block')
                        <img src="{{ asset('images/illustrations/undraw_secure_login_pdn4.svg') }}" height="300"
                            class="d-block mx-auto">
                    @endif
                </div>
            </div>
        </div>
    </div>
    <!-- Libs JS -->
    <script src="{{ asset('tabler/js/tabler.min.js?1684106062') }}" defer></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" defer></script>
    <script src="{{ asset('js/auth.js') }}" defer></script>
</body>

</html>
