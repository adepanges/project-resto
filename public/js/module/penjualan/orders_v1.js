$(document).ready(function(){

    var numberer = 1;
    ordersTable = $('#ordersTable').on('preXhr.dt', function ( e, settings, data ){
            numberer = data.start + 1;
            $('.row .white-box').block({
                message: '<h3>Please Wait...</h3>',
                css: {
                    border: '1px solid #fff'
                }
            });
        }).on('xhr.dt', function ( e, settings, json, xhr ){
            $('.row .white-box').unblock();
            if(!document.datatable_search_change_event)
            {
                $("div.dataTables_filter input").unbind();
                $("div.dataTables_filter input").keyup( function (e) {
                    if (e.keyCode == 13) {
                        ordersTable.search( this.value ).draw();
                    }
                });
            }
            document.datatable_search_change_event = true;
        }).DataTable({
            serverSide: true,
            ajax: {
                url: document.app.site_url + '/orders_v1/get',
                type: 'POST'
            },
            language: {
                infoFiltered: ""
            },
            columns: [
                {
                    name: 'Number',
                    width: "5%",
                    orderable: false,
                    render: function ( data, type, full, meta ) {
                        return numberer++;
                    }
                },
                { data: "created_at", orderable: false},
                { data: "order_code", orderable: false},
                {
                    data: "customer_info",
                    orderable: false,
                    render: function ( data, type, full, meta ) {
                        var row = JSON.parse(data);
                        return `<b>${row.full_name}</b>`;
                    }
                },
                {
                    data: "customer_info",
                    orderable: false,
                    render: function ( data, type, full, meta ) {
                        var row = JSON.parse(data);
                        return `<i class="${full.call_method_icon}"> ${row.telephone}</i>`;
                    }
                },
                {
                    data: 'customer_address',
                    orderable: false,
                    render: function ( data, type, full, meta ) {
                        var customer_address = JSON.parse(data);
                        return `<span style="font-size: 9px;">
                        ${customer_address.address}<br>Ds./Kel. ${customer_address.desa_kelurahan}<br>Kec. ${customer_address.kecamatan}<br>${customer_address.kabupaten}<br>Prov. ${customer_address.provinsi}<br>${customer_address.postal_code}
                        </span>`;
                    }
                },
                { data: "package_name", orderable: false,
                    render: function ( data, type, full, meta ) {
                        return `<b style="color: #0077B5;">${data}</b>`;
                    }
                },
                { data: "total_price", orderable: false,
                    render: function ( data, type, full, meta ) {
                        return `<b style="color: #FF2D55;">${rupiah(data)}</b>`;
                    }
                },
                {
                    data: 'order_id',
                    orderable: false,
                    render: function ( data, type, full, meta ) {
                        var button = [];
                        //
                        if(document.app.access_list.penjualan_orders_detail)
                        {
                            button.push(`<a href="${document.app.site_url}/orders_v1/detail/index/${data}" type="button" class="btn btn-info btn-outline btn-circle btn-sm m-r-5"><i class="fa fa-eye"></i></a>`);
                        }

                        if(document.app.access_list.penjualan_orders_action_follow_up)
                        {
                            button.push(`<button onclick="followUp(${data})" type="button" class="btn btn-primary btn-outline btn-circle btn-sm m-r-5"><i class="mdi mdi-briefcase-upload"></i></button>`);
                        }

                        if(document.app.access_list.penjualan_orders_to_trash)
                        {
                            button.push(`<button onclick="trashOrders(${data})" type="button" class="btn btn-warning btn-outline btn-circle btn-sm m-r-5"><i class="fa fa-trash"></i></button>`);
                        }

                        return button.join('');
                    }
                }
            ]
        });
});

function followUp(id){
    swal({
        title: "Apakah anda yakin?",
        text: "Anda akan memfollow up pesanan!",
        type: "warning",
        showCancelButton: true,
        confirmButtonClass: "btn-danger",
        confirmButtonText: "Follow Up",
        cancelButtonText: "Batal",
        closeOnConfirm: false,
        closeOnCancel: true
    },
    function(isConfirm) {
        if (isConfirm) {
            window.location = document.app.site_url+'/orders_v1/app/follow_up/'+id;
        }
    });
}

function trashOrders(id){
    swal({
        title: "Are you sure?",
        text: "Anda akan membuang orders ini!",
        type: "warning",
        showCancelButton: true,
        confirmButtonClass: "btn-danger",
        confirmButtonText: "Buang",
        cancelButtonText: "Batal",
        closeOnConfirm: false,
        closeOnCancel: true
    },
    function(isConfirm) {
        if (isConfirm) {
            $('.preloader').fadeIn();
            $.ajax({
                method: "POST",
                url: document.app.site_url+'/orders_v1/app/trash/'+id
            })
            .done(function( response ) {
                $('.preloader').fadeOut();
                ordersTable.ajax.reload()
                var title = 'Berhasil!';
                if(!response.status) title = 'Gagal!';

                swal({
                    title: title,
                    text: response.message,
                    timer: 2000,
                    showConfirmButton: true
                });
            });
        }
    });
}