<html>

<head>
    <title>@yield('title')</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style>
        @page {
            size: A4 landscape;
        }

        body {
            font-size: 12pt;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            font-weight: bold;
            text-align: left;
        }

        tr,
        th,
        td {
            vertical-align: top;
            padding: 5px;
            border: 1px solid black;
        }
    </style>
</head>

<body>
    @yield('content')
</body>

</html>
