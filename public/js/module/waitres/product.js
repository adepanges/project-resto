function pesanProduct(json_product){
    var qty = prompt("Berupa jumlah yang dipesan", 1);
    data = JSON.parse(atob(json_product));
    data.qty = qty;
    
    swal({
        title: "Apakah anda yakin?",
        text: `memesan ${data.name} dengan jumlah ${qty}`,
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
                url: document.app.site_url+'/orders/cart/save',
                data: data
            })
            .done(function( response ) {
                $('.preloader').fadeOut();
                var title = 'Berhasil!';
                if(!response.status) title = 'Gagal!';

                window.location = document.app.site_url+'/orders/cart/index/'+orders.order_id;

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
