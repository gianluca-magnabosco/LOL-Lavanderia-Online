$(".consultar").on("click", () => {
    console.log($(".searchbar").val());
    if (!$(".searchbar").val().match(/#LOL\-\d+/)) {
        $("#errorMsg").text("Insira um número de pedido válido!");
        return;
    }
    
    let id = $(".searchbar").val().replace(/#LOL\-/, "");
    
    id = parseInt(id);
    
    location.href="pedido?action=consultar&id=" + id;
});


$(".searchbar").on("keypress", function(event) {
        
    let length = $(this).val().length;
    
    if (length < 4) {
        $(this).val("#LOL-");
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