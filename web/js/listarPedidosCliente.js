$(".btn-group .btn").on("click", filterByStatus);  
$(document).ready(filterByStatus);

const filterByStatus = () => {
    let inputValue;
    
    if ($(this).is(document)) {
        inputValue = $(this).find(".content input:checked").val();
    } else {
        inputValue = $(this).find("input").val();
    }
    
    if (inputValue == "todos") {
        $(".table-responsive table tbody tr").fadeIn();
        return;
    }

    let target = $("table tr[class='cell-1 " + inputValue + "']");
    $(".table-responsive table tbody tr").fadeOut("fast").promise().done(() => {
        target.fadeIn("fast");
    });    
};


/*
$(".cancelar").on("click", () => {
    $("#overlay.cancelarOverlay").toggle();
});

$(".confirmar").on("click", () => {
    $("#overlay.cancelarOverlay").toggle();
});

$(".consultar").on("click", () => {
    $("#overlay.consultarOverlay").toggle();
});

$(".pagar").on("click", () => {
    $("#overlay.pagarOverlay").toggle();
});

*/