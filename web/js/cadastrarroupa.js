
function prazoMask(element) {
    var currentNumber = element.value[element.value.length - 1];
    var string = element.value.substring(0, element.value.search(/\s/));
    
    if (isNaN(currentNumber)) {
        if (element.value[element.value.length - 1] != ")") {
            string = string.substring(0, string.length - 1);
            element.value = string + " dia(s)";
        }
        return;
    }
    
    if (element.value[0] == "0") {
        element.value = Math.abs(currentNumber);
        element.value += " dia(s)";
        return;
    }
    
    string += currentNumber;
    
    element.value = string;
    element.value += " dia(s)";
}


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




$(document).ready(validateFormulario());

$.validator.addMethod("precoValido", function(value, element, param) {
    return validatePreco(value);
});

$.validator.addMethod("prazoValido", function(value, element, param) {
    return validatePrazo(value);
});