$(document).ready(validateForm());

$.validator.addMethod("cpfValido", (value, element, param) => {
    return validateCPF(value);
});

$.validator.addMethod("cepValido", (value, element, param) => {
    return validateCEP(value);
});

$.validator.addMethod("telefoneValido", (value, element, param) => {
    return validatePhoneNumber(value);
});

$.validator.addMethod("numeroValido", (value, element, param) => {
    return validateNumber(value);
});