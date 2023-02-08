$("#aceitar").on("click", () => {
    $("#errormsg").text("");
    let check = 0;
    if ($("input:checkbox:checked").length > 0) {
        $("input:checkbox:checked").each(() => {
            currentAmount = $(this).closest('tr').find('input[type=number]').val();
            if (currentAmount == 0) {
                check++;
                return;
            }
        });

        if (check > 0) {
            $("#errormsg").text("Algum item selecionado está com quantidade 0!");
            return;
        }

        $("#overlay.aceitarOverlay").toggle();
        return;
    }

    $("#errormsg").text("Selecione ao menos um item!");
});

$("#recusar").on("click", () => {               
        $("#overlay.cancelarOverlay").toggle();
    }
);

$(".cancelar").on("click", () => {
    $("#overlay.cancelarOverlay").toggle();
});

$(".confirmar").on("click", () => {
    location.href="clienteInicio.jsp";
});



$("body").on("click keydown keyup", () => {
    let total = 0;
    let deadLine = 0;
    let deadLines = [];
    $("input:checkbox").each(() => {
        if (!$(this).is(':checked')) {
            $(this).closest('tr').find('.result').text("R$ 0,00");
            return;
        }
        currentPrice = $(this).closest('tr').find('.preco').text().replaceAll("R$", "").replaceAll(",", ".");
        currentAmount = $(this).closest('tr').find('input[type=number]').val();
        if (currentAmount == 0) {
            return;
        }
        let currentTotal = (currentPrice * currentAmount);
        total += currentTotal;
        currentTotal = currentTotal.toFixed(2);
        currentTotal = String(currentTotal).replaceAll(".", ",");
        deadLines.push(parseInt($(this).closest('tr').find('.prazo').text()));
        
        $(this).closest('tr').find('.result').text("R$ " + currentTotal);
    });
    
    deadLine = deadLines.reduce((a, b) => Math.max(a, b), -Infinity);
    if (deadLine === -Infinity) {
        deadLine = 0;
    }
    
    total = Math.ceil(total * 100) / 100;
    total = total.toFixed(2);
    
    $("#totalAmount").text("R$ " + String(total).replaceAll(".", ","));
    $("#finalDeadLine").text(deadLine + " dia(s)");
});

