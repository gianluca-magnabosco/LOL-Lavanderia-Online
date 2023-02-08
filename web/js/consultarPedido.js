$(".consultar").on("click", () => {
    console.log($(".searchbar").val());
    if (!$(".searchbar").val().match(/#LOL\-\d+/)) {
        $("#errorMsg").text("Insira um número de pedido válido!");
        return;
    }
    
    <c:import url="/popup/consultar.jsp" charEncoding="UTF-8">
        <c:param name="id" value="${pedido.id}"/>
    </c:import>
                                                
    $("#errorMsg").text("");
    $("#overlay.consultarOverlay").toggle();
});

$(".searchbar").on("keypress", event => {
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