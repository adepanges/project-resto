@extends('layout.waitres')

@section('title', $title)

@section('load_css')
@parent
        <link href="{{ base_url('plugins/bower_components/datatables/jquery.dataTables.min.css') }}" rel="stylesheet" type="text/css" />
        <link href="{{ base_url('plugins/bower_components/datatables-bootstrap/Buttons-1.5.1/css/buttons.dataTables.min.css') }}" rel="stylesheet" type="text/css" />
        <link href="{{ base_url('plugins/bower_components/sweetalert/sweetalert.css') }}" rel="stylesheet" type="text/css">
        <link href="{{ base_url('plugins/bower_components/switchery/dist/switchery.min.css') }}" rel="stylesheet" />
@endsection

@section('load_js')
@parent
        <script src="{{ base_url('plugins/bower_components/datatables/jquery.dataTables.min.js') }}"></script>
        <script src="{{ base_url('plugins/bower_components/datatables-bootstrap/Buttons-1.5.1/js/dataTables.buttons.min.js') }}"></script>
        <script src="{{ base_url('plugins/bower_components/datatables-bootstrap/Buttons-1.5.1/js/buttons.flash.min.js') }}"></script>
        <script src="{{ base_url('plugins/bower_components/blockUI/jquery.blockUI.js') }}"></script>
        <!-- Sweet-Alert  -->
        <script src="{{ base_url('plugins/bower_components/sweetalert/sweetalert.min.js') }}"></script>
        <script src="{{ base_url('plugins/bower_components/sweetalert/jquery.sweet-alert.custom.js')}}"></script>
        <script src="{{ base_url('plugins/bower_components/switchery/dist/switchery.min.js') }}"></script>
        <script src="{{ base_url('js/validator.js') }}"></script>

        <script src="{{ base_url('js/module/waitres/product.js') }}" type="text/javascript"></script>
@endsection

@section('content')
            <div class="row">
            @foreach ($active_product as $key => $value)
                <?php
                $value->order_id = $orders->order_id;
                ?>
                <div class="col-xs-6 col-md-4 col-lg-3 container-product">
                    <div class="white-box side-prouct">
                        <span class="type-product">{{ $value->type }}</span><br>
                        <b>{{ $value->name }}</b><br>
                        <i class="harga">{{ rupiah($value->unit_price) }}</i>
                    </div>
                    <button class="btn btn-success form-control" onclick="pesanProduct('{{ base64_encode(json_encode($value)) }}')">Pesan</button>
                </div>
            @endforeach
            </div>

            <script type="text/javascript">
                var orders = {!! json_encode($orders) !!};
            </script>
@endsection
