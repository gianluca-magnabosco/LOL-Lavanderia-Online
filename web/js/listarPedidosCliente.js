function filterByStatus() {
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


$(document).ready(filterByStatus);
$(".btn-group .btn").on("click", filterByStatus);  

