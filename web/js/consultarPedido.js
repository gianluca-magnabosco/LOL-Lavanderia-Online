$(".consultar").on("click", function() {
    console.log($(".searchbar").val());
    if (!$(".searchbar").val().match(/#SO\-\d{6}/)) {
        $("#errorMsg").text("Insira um número de pedido válido!");
        return;
    }
    
    $("#errorMsg").text("");
    $("#overlay.consultarOverlay").toggle();
});

$(".searchbar").on("keypress", function(event) {
    var length = $(this).val().length;
    
    if (length < 4) {
        $(this).val("#SO-");
    } else if (length > 9) {
        event.preventDefault();
    }
    
    if ((event.code === "ArrowLeft") || (event.code == "ArrowRight") ||
       (event.code == "ArrowUp") || (event.code == "ArrowDown") || 
       (event.code == "Delete") || (event.code == "Backspace")) {
        return;
    } else if (event.key.search(/\d/) == -1) {
        event.preventDefault();
    }
});