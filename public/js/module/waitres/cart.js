function delOrders(cart_id){
    swal({
        title: "Apakah anda yakin?",
        text: "Akan menghapus",
        type: "warning",
        showCancelButton: true,
        confirmButtonClass: "btn-danger",
        confirmButtonText: "Ya",
        cancelButtonText: "Batal",
        closeOnConfirm: false,
        closeOnCancel: true
    },
    function(isConfirm) {
        if (isConfirm) {
            $('.preloader').fadeIn();
            $.ajax({
                method: "POST",
                url: document.app.site_url+'/orders/cart/del/'+cart_id
            })
            .done(function( response ) {
                $('.preloader').fadeOut();
                var title = 'Berhasil!';
                if(!response.status) title = 'Gagal!';
                window.location.reload();

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

function bayarPesanan(){
    $('#jumlah_uang').trigger('keyup');
    $('#formModal').modal({
        backdrop: 'static',
        keyboard: false
    });
}

$(document).ready(function(){
    $('#jumlah_uang').keyup(function(){
        var price = parseInt($('#FormData [name=total_price]').val()),
            uang = parseInt($(this).val());

        if(isNaN(price)) price = 0;
        if(isNaN(uang)) uang = 0;

        $('#kembalian').val(uang - price);
    });


    $('#btnSaveFormData').click(function(e){
        if(formValidator('#FormData')){
            var data = serialzeForm('#FormData');

            if(data.refund < 0)
            {
                alert('harap diisi jumlah uang dengan valid');
                return;
            }

            $('.preloader').fadeIn();
            $.ajax({
                method: "POST",
                url: document.app.site_url+'/orders/cart/checkout',
                data: data
            })
            .done(function( response ) {
                $('.preloader').fadeOut();
                var title = 'Berhasil!',
                    timer = 1000;
                    showConfirmButton = false;

                if(!response.status) {
                    var timer = 3000;
                    title = 'Gagal!';
                    showConfirmButton = true;
                } else {
                    $('#FormData')[0].reset()
                    $('#formModal').modal('toggle')
                }

                swal({
                    title: title,
                    text: response.message,
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonClass: "btn-danger",
                    confirmButtonText: "Cetak",
                    cancelButtonText: "Tutup",
                    closeOnConfirm: false,
                    closeOnCancel: true
                },
                function(isConfirm) {
                    if (isConfirm) {
                        window.open(document.app.site_url+'/orders/cetak/struk/'+data.order_id);
                    } else {
                        document.location.reload()
                    }
                });
            });
        }
    })
});
