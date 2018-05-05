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
                Nama Pelanggan: <b>{{ $orders->customer_name }}</b>
                <br>
                Total Harga:
                <h2>{{ rupiah($orders->total_price) }}</h2>
            </div>

            <div class="row">
                <button class="btn btn-warning form-control" onclick="window.location = '{{ site_url('orders') }}'">Kembali</button>
            </div>

            <br>

            @if (empty($cart))
            <div class="row white-box">
                Belum ada pesanan
            </div>
            @endif

            <div class="row">
            @foreach ($cart as $key => $value)
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                    <div class="white-box">
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
                </div>
            @endforeach
            </div>

            <div class="row">
                <div class="col-xs-12 col-md-6">
                    <button class="btn btn-success form-control" onclick="bayarPesanan()">Bayar</button>
                </div>
                <div class="col-xs-12 col-md-6">
                    <button class="btn btn-info form-control" onclick="window.location = '{{ site_url('orders/product/index/'.$orders->order_id) }}'">Tambah</button>
                </div>
            </div>

            <div class="modal fade" id="formModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="exampleModalLabel1">Checkout</h4> </div>
                        <div class="modal-body">
                            <form id="FormData" data-toggle="validator" data-delay="100">
                                <input type="hidden" name="order_id" value="{{ $orders->order_id }}">
                                <input type="hidden" name="total_price" value="{{ $orders->total_price }}">
                                <div class="form-group">
                                    <label for="recipient-name" class="control-label">Nama Pelanggan</label>
                                    <input type="text" class="form-control" value="{{ $orders->customer_name }}" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name" class="control-label">Total Harga</label>
                                    <input type="text" class="form-control" value="{{ rupiah($orders->total_price) }}" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name" class="control-label">Jumlah Uang</label>
                                    <input type="number" class="form-control" id="jumlah_uang" value="0" data-error="Hmm, harap diisi jumlah uang dengan valid" required>
                                    <div class="help-block with-errors"></div>
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name" class="control-label">Kembalian</label>
                                    <input type="number" class="form-control" min-value="0" value="0" name="kembalian" id="kembalian" data-error="Hmm, harap diisi jumlah uang dengan valid" readonly required>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>
                            <button id="btnSaveFormData" type="button" class="btn btn-primary">Checkout</button>
                        </div>
                    </div>
                </div>
            </div>
@endsection
