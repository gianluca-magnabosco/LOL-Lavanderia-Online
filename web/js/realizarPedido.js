function enviarRequest() {
    let selectedRows = [];
    let totalValue = document.getElementById("totalAmount").innerHTML;
    let prazoValue = document.getElementById("finalDeadLine").innerHTML;

    let rows = document.querySelectorAll("tbody tr");
    for (let i = 0; i < rows.length; i++) {
        let checkbox = rows[i].querySelector("input[type='checkbox']");
        let quantidade = rows[i].querySelector("input[id='itemQuantidade']").value;
        if (checkbox.checked && quantidade > 0) {
            selectedRows.push({
                "id": rows[i].querySelector("p[id='idItem']").innerHTML,
                "nome": rows[i].querySelector("p[id='itemName']").innerHTML,
                "quantidade": quantidade
            });
        }
    }

    if (selectedRows.length === 0) {
        document.getElementById("errormsg").innerHTML = "Nenhum item selecionado ou quantidade igual a zero";
        return;
    }
    
    let request = new XMLHttpRequest();
    request.open("POST", "pedido?action=realizar");
    request.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    request.send(JSON.stringify({ "prazo": prazoValue, "total": totalValue, "itens": selectedRows }));
    
    request.addEventListener("load", function() {
        if (request.status === 200) {
            window.location.href = "pedido?action=insertSuccess";
        } else {
            document.getElementById("errormsg").innerHTML = "Erro ao realizar pedido: " + request.status;
        }
    });
}


$("#aceitar").on("click", function() {
    $("#errormsg").text("");
    let check = 0;
    if ($("input:checkbox:checked").length === 0) {
        $("#errormsg").text("Selecione ao menos um item!");
        return;
    }
    
    $("input:checkbox:checked").each(function() {
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
    
    
    enviarRequest();
    return;
});


$("body").on("click keydown keyup", function() {
    let total = 0;
    let deadLine = 0;
    let deadLines = [];
    $("input:checkbox").each(function() {
        if (!$(this).is(':checked')) {
            $(this).closest('tr').find('.result').text("R$ 0,00");
            return;
        }
        let currentPrice = $(this).closest('tr').find('.preco').text().replaceAll("R$", "").replaceAll(",", ".");
        let currentAmount = $(this).closest('tr').find('input[type=number]').val();
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

