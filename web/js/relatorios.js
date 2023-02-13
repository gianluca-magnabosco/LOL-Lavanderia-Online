

$(function() {
    $('#dateRange').daterangepicker({locale: {format: "DD/MM/YYYY"}
        }, function(start, end, label) {

            let dataInicio = new Date(moment(start.format("DD/MM/YYYY"), "DD/MM/YYYY"));
            let dataFim = new Date(moment(end.format("DD/MM/YYYY"), "DD/MM/YYYY"));
            
            let options = { year: 'numeric', month: '2-digit', day: '2-digit' };
            
            dataInicio = dataInicio.toLocaleDateString('pt-BR', options);
            dataFim = dataFim.toLocaleDateString('pt-BR', options);

            if ($("#checkBoxReceitas").prop("checked")) {
                let urlReceitas = "relatorio?action=redirect&tipo=receitas&dataInicio=" + dataInicio + "&dataFim=" + dataFim;
                location.href = urlReceitas;
            }

        });
    });


$('#dateRange').on("keypress paste", function() {
    return false;
});




$(function() {
    $('#dateRange2').daterangepicker({locale: {format: "DD/MM/YYYY"}
        }, function(start, end, label) {

            var dataInicio = new Date(moment(start.format("DD/MM/YYYY"), "DD/MM/YYYY"));
            var dataFim = new Date(moment(end.format("DD/MM/YYYY"), "DD/MM/YYYY"));

            let options = { year: 'numeric', month: '2-digit', day: '2-digit' };
            
            dataInicio = dataInicio.toLocaleDateString('pt-BR', options);
            dataFim = dataFim.toLocaleDateString('pt-BR', options);

            if ($("#checkBoxPedidos").prop("checked")) {
                let urlPedidos = "relatorio?action=redirect&tipo=pedidos&dataInicio=" + dataInicio + "&dataFim=" + dataFim;
                location.href = urlPedidos;
            }

        });
    });


$('#dateRange2').on("keypress paste", function() {
    return false;
});