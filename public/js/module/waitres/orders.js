function serveTable(json_table){
    var person = prompt("Masukan nama pelanggan", "Indri");
    json_table = JSON.parse(atob(json_table));

    swal({
        title: "Apakah anda yakin?",
        text: "Melayani sdr "+person,
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
                url: document.app.site_url+'/orders/app/serve/',
                data: {
                    customer_name: person,
                    table_id: json_table.table_id
                }
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
