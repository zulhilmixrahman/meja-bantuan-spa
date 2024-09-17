<html>

<head>
    <title>{{ $complaint->no_tiket }}</title>
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
    <h1 style="text-align: center">{{ config('app.name') }}</h1>

    <table>
        <tr>
            <th style="width: 200px;">No Tiket</th>
            <td>{{ $complaint->no_tiket }}</td>
        </tr>

        <tr>
            <th>Nama Pengadu</th>
            <td>{{ $complaint->user_name }}</td>
        </tr>

        <tr>
            <th>Emel Pengadu</th>
            <td>{{ $complaint->user_email }}</td>
        </tr>

        <tr>
            <th>No Tel Pengadu</th>
            <td>{{ $complaint->user_tel }}</td>
        </tr>

        <tr>
            <th>Kategori</th>
            <td>{{ $complaint->sub_category->category->name }} / {{ $complaint->sub_category->name }}</td>
        </tr>

        <tr>
            <th>Tajuk Aduan</th>
            <td>{{ $complaint->title }}</td>
        </tr>

        <tr>
            <th>Butiran Aduan</th>
            <td>{{ $complaint->detail }}</td>
        </tr>
    </table>

</body>

</html>
