
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
        $("table tbody tr").fadeIn();
        return;
    }

    var target = $("table tr[class='cell-1 " + inputValue + "']");
    $("table tbody tr").fadeOut("fast").promise().done(function () {
        target.fadeIn("fast");
    });    
}
