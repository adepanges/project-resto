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

        <script src="{{ base_url('js/module/waitres/orders.js') }}" type="text/javascript"></script>
@endsection

@section('content')
            <div class="row">
            @foreach ($active_table as $key => $value)
                <?php
                $cls_active = '';
                if (!empty($value->order_id) && $value->is_active == 1 )
                {
                    $cls_active = 'table-onserve';
                }
                ?>
                <div class="col-xs-6 col-md-4 col-lg-3">
                    <div class="white-box side-tables {{ $cls_active }}">
                        <h1>{{ $value->code }}</h1>
                        <b>{{ $value->name }}</b>
                        <br>
                        <span>{{ $value->customer_name }}</span>
                        <br>
                    @if ($value->is_active != 1)
                        <button class="btn btn-info" onclick="serveTable('{{ base64_encode(json_encode($value)) }}')">Serve</button>
                    @else
                        <button class="btn btn-success" onclick="window.location = '{{ site_url('orders/cart/index/'.$value->order_id) }}'">Cart</button>
                    @endif
                    </div>
                </div>
            @endforeach
            </div>
@endsection
