$(document).ready(function(){
    jQuery('#date-range').datepicker({
        toggleActive: true,
        format: 'yyyy-mm-dd'
    });

    statistik = Morris.Area({
        element: 'morris-area-chart',
        xkey: 'periode',
        parseTime: false,
        ykeys: ['income'],
        labels: ['Income'],
        pointSize: 3,
        fillOpacity: 0,
        pointStrokeColors:['#FF7A01'],
        behaveLikeLine: true,
        gridLineColor: '#e0e0e0',
        lineWidth: 1,
        hideHover: 'auto',
        lineColors: ['#FF7A01'],
        resize: true,
        data: []
    });

    $('#btnFilterStatistik').click();
})


function loadDataCS(){
    $('.preloader').fadeIn();
    $.ajax({
        method: "POST",
        url: document.app.site_url+'/pimpinan/get/income_chart',
        data: {
            'start_date': $('#date-range [name=start]').val(),
            'end_date': $('#date-range [name=end]').val()
        }
    })
    .done(function( response ) {
        $('.preloader').fadeOut();
        $('#contentTableProduct').empty();
        var product = response.product;

        if(product.length > 0){
            product.forEach(function(val, index){
                val.total = rupiah(val.total);

                if(typeof val.qty == 'object') val.qty = 0;

                var no = (index + 1);
                var el = `<tr>
                    <td>${no}</td>
                    <td>${val.name}</td>
                    <td>${val.qty}</td>
                    <td>${val.total}</td>
                </td>`;

                $('#contentTableProduct').append(el);
            });
        }

        statistik.setData(response.data);
        statistik.redraw()

    });
}
