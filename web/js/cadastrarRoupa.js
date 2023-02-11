function precoMask(element) {
    if (isNaN(element.value[element.value.length -1])) {
        element.value = element.value.substring(0, element.value.length - 1);
        return;
    }
    
    element.value = element.value.replace('.', '').replace(',', '').replace(/\D/g, '');

    const options = { minimumFractionDigits: 2 };
    const result = new Intl.NumberFormat('pt-BR', options).format(
        parseFloat(element.value) / 100
    );

    element.value = 'R$ ' + result;
}

$("#cancelar").on("click", function(event) {
    location.href="roupa?action=listar";
});

$("#prazo").on("input", function(event) {
    var element = $(this);
    var currentNumber = element.val()[element.val().length - 1];
    var string = element.val().substring(0, element.val().search(/\s/));

    if (isNaN(currentNumber)) {
        element.val(element.val().substring(0, element.val().length - 1));
        if (element.val()[element.val().length - 1] != ")" && event.originalEvent.data == null) {
            string = string.substring(0, string.length - 1);
            element.val(string + " dia(s)");
        }
        return;
    }

    if (element.val()[0] == "0") {
        element.val(Math.abs(currentNumber) + " dia(s)");
        return;
    }

    string += currentNumber;

    element.val(string + " dia(s)");
});


function validatePrazo(value) {
    return value.match(/\d+\sdia\(s\)/);
}

function validateFormulario() {
    $("#formulario").validate({
        rules: {
            nome: "required",

            preco: "required",

            tempo: {
                required: true,
                prazoValido: true
            },

            imagem: "required"
        },

        messages: {
            nome: "<b style='color: red'>Por favor insira um nome</b>",

            preco: "<b style='color: red'>Por favor insira um preço</b>",

            tempo: {
                required: "<b style='color: red'>Por favor insira um prazo</b>",
                prazoValido: "<b style='color: red'>Por favor insira um prazo válido</b>"
            },

            imagem: "<b style='color: red; display: block; margin-top: 100px;'>Por favor insira uma foto da peça de roupa</b>"
        }

    });

}

$(document).ready(validateFormulario());

$.validator.addMethod("prazoValido", function(value, element, param) {
    return validatePrazo(value);
});

