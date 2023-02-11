$(".cancelar").on("click", function() {
    location.href="funcionarioController?action=listar";
});

function validateFormulario() {
    $("#formulario").validate({
        rules: {
            nome: "required",

            email: {
                required: true,
                email: true
            },

            senha: "required",

            dataNascimento: "required"
        },

        messages: {
            nome: "<b style='color: red'>Por favor insira um nome</b>",

            email: {
                required: "<b style='color: red'>Por favor insira um e-mail</b>",
                email: "<b style='color: red'>Por favor insira um e-mail válido</b>"
            },

            senha: "<b style='color: red'>Por favor insira uma senha</b>",

            dataNascimento: "<b style='color: red'>Por favor insira uma data de nascimento</b>"
        }

    });

}

$(document).ready(validateFormulario());

$(function() {
    $('#dataNascimento').daterangepicker({
            locale: {
                format: "DD/MM/YYYY"
            },
            singleDatePicker: true,
            showDropdowns: true,
            minYear: 1901,
            maxYear: 2010
        }, function(start, end, label) {
            var data = new Date(moment(start.format("DD/MM/YYYY"), "DD/MM/YYYY"));
            
    });
});

$('#dataNascimento').on("keypress paste", function() {
    return false;
});