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

        <script src="{{ base_url('js/module/waitres/cart.js') }}" type="text/javascript"></script>
@endsection

@section('content')
            <div class="row white-box">
                Curtomer Name: <b>{{ $orders->customer_name }}</b>
                <br>
                Total Price:
                <h2>{{ rupiah($orders->total_price) }}</h2>
            </div>

            <div class="row">
                <button class="btn btn-info form-control" onclick="window.location = '{{ site_url('orders') }}'">Kembali</button>
            </div>
            
            <br>

            @if (empty($cart))
            <div class="row white-box">
                Belum ada pesanan
            </div>
            @endif

            @foreach ($cart as $key => $value)
            <div class="row white-box">
                <div class="col-xs-9">
                    <b>{{ $value->product_name }}</b>
                </div>
                <div class="col-xs-3">
                    x {{ $value->qty }}
                </div>
                <br>
                <br>
                <div class="col-xs-12">
                    <i class="fa fa-trash pull-right" style="font-size: 20px; color: #F00; cursor: pointer;" onclick="delOrders({{ $value->cart_id }})"></i>

                    <b>{{ rupiah($value->price) }}</b>
                </div>
            </div>
            @endforeach

            <div class="row">
                <button class="btn btn-success form-control" onclick="window.location = '{{ site_url('orders/product/index/'.$orders->order_id) }}'">Tambah</button>
            </div>
@endsection
