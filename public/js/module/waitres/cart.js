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
