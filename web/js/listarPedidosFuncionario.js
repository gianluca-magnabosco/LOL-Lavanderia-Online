$(".confirmar").on("click", function() {
    $("#overlay.aceitarOverlay").toggle();
});

$(".consultar").on("click", function() {
    $("#overlay.consultarOverlay").toggle();
});

var dateList = [];
var elements = [];

$(".data").each(function() {
    var date = moment($(this).text().substring(0, 10), "DD/MM/YYYY");
    dateList.push(new Date(date));
    elements.push($(this));
});


$(function() {
    $('#dateRange').daterangepicker({locale: {format: "DD/MM/YYYY"}
        }, function(start, end, label) {
            var dataInicio = new Date(moment(start.format("DD/MM/YYYY"), "DD/MM/YYYY"));
            var dataFim = new Date(moment(end.format("DD/MM/YYYY"), "DD/MM/YYYY"));

            $(".table-responsive table tbody tr").fadeOut("fast");

            var i = 0;
            dateList.forEach(date => {
                if (date >= dataInicio && date <= dataFim) {
                    elements[i].closest("tr").fadeIn("fast");
                }
                i++;
            });


        });
    });


$('#dateRange').on("keypress paste", function() {
    return false;
});

$("#todos").on("click", function() {
    $(".table-responsive table tbody tr").fadeIn();
});

$("#hoje").on("click", function() {
    $(".table-responsive table tbody tr").fadeOut("fast");
    var i = 0;
    dateList.forEach(date => {
        if (date.getTime() === new Date(moment().startOf("day")).getTime()) {
            elements[i].closest("tr").fadeIn("fast");
        }
        i++;
    });
});
