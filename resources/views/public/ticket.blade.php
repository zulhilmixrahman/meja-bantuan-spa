@extends('layouts.blank')

@section('content')
    <div class="card">
        <div class="card-body">
            <div class="mb-3 row">
                <label for="username" class="col-2 col-form-label">No Tiket</label>
                <div class="col">{{ $complaint->no_tiket }}</div>
            </div>

            <div class="mb-3 row">
                <label for="username" class="col-2 col-form-label">Nama Pengadu</label>
                <div class="col">{{ $complaint->user_name }}</div>
            </div>

            <div class="mb-3 row">
                <label for="username" class="col-2 col-form-label">Emel Pengadu</label>
                <div class="col-4">{{ $complaint->user_email }}</div>

                <label for="email" class="col-2 col-form-label">No Tel Pengadu</label>
                <div class="col-4">{{ $complaint->user_tel }}</div>
            </div>

            <div class="mb-3 row">
                <label for="category_id" class="col-2 col-form-label">Kategori</label>
                <div class="col">{{ $complaint->sub_category->category->name }} / {{ $complaint->sub_category->name }}</div>
            </div>

            <!-- Default form layout -->
            <div class="mb-3">
                <label class="form-label">Tajuk Aduan</label>
                {{ $complaint->title }}
            </div>

            <div class="mb-3">
                <label for="detail" class="form-label">Butiran Aduan</label>
                {{ $complaint->detail }}
            </div>
        </div>

        <div class="card-footer d-flex justify-content-end">
            <a href="{{ route('home') }}" class="btn btn-ghost-secondary me-auto">Kembali</a>
        </div>

    </div>
@endsection

@section('page-scripts')
    <script>
        function getOptions(catID) {
            $.ajax({
                method: 'POST',
                url: '{{ route('subcategories.options') }}',
                data: {
                    id: catID
                },
                dataType: 'json',
                success: function(response) {
                    // console.log(response);
                    $('select[name=sub_category_id]').empty();
                    $.each(response, function(key, value) {
                        var div_data = "<option value=" + key +
                            ('{{ old('sub_category_id') }}' == key ? ' selected' : '') +
                            ">" + value + "</option>";
                        $(div_data).appendTo('select[name=sub_category_id]');
                    });
                }
            });
        }

        $('select[name="category_id"]').change(function() {
            // alert( $(this).val() );
            getOptions($(this).val());
        });

        @if (old('category_id') !== null)
            getOptions({{ old('category_id') }});
        @endif
    </script>
@endsection
