
$(function() {
    $('#dataNasc').daterangepicker({
            locale: {
                format: "DD/MM/YYYY"
            },
            singleDatePicker: true,
            showDropdowns: true,
            minYear: 1901,
            maxYear: 2010
        }, function(start, end, label) {
            var data = new Date(moment(start.format("DD/MM/YYYY"), "DD/MM/YYYY"));
            
    });
});

$('#dataNasc').on("keypress paste", function() {
    return false;
});