$(".btn-group .btn").on("click", filterByStatus);  
$(document).ready(filterByStatus);

function filterByStatus() {
    var inputValue;
    
    if ($(this).is(document)) {
        inputValue = $(this).find(".content input:checked").val();
    } else {
        inputValue = $(this).find("input").val();
    }
    
    if (inputValue == "todos") {
        $(".table-responsive table tbody tr").fadeIn();
        return;
    }

    var target = $("table tr[class='cell-1 " + inputValue + "']");
    $(".table-responsive table tbody tr").fadeOut("fast").promise().done(function () {
        target.fadeIn("fast");
    });    
}


$(".cancelar").on("click", function() {
    $("#overlay.cancelarOverlay").toggle();
});

$(".confirmar").on("click", function() {
    $("#overlay.cancelarOverlay").toggle();
});

$(".consultar").on("click", function() {
    $("#overlay.consultarOverlay").toggle();
});

$(".pagar").on("click", function() {
    $("#overlay.pagarOverlay").toggle();
});