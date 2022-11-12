function cpfMask(cpfField){
    var text = cpfField.value;
    if(isNaN(text[text.length-1])){
        cpfField.value = text.substring(0, text.length-1);
        return;
    }

    cpfField.setAttribute("maxlength", "14");
    if (text.length === 3 || text.length === 7) cpfField.value += ".";
    if (text.length === 4 && text[3] !== ".") cpfField.value = text.substring(0, 3) + "." + text.substring(3, 4);
    if (text.length === 8 && text[7] !== ".") cpfField.value = text.substring(0, 7) + "." + text.substring(7, 8);
    if (text.length === 11) cpfField.value += "-";
    if (text.length === 12 && text[11] !== "-") cpfField.value = text.substring(0, 11) + "-" + text.substring(11, 12);
}


function phoneNumberMask(phoneNumberField){
    var text = phoneNumberField.value;
    if(isNaN(text[text.length-1])){
        phoneNumberField.value = text.substring(0, text.length-1);
        return;
    }

    phoneNumberField.setAttribute("maxlength", "15");
    if (text.length === 1) phoneNumberField.value = "(" + text;
    if (text.length === 3) phoneNumberField.value += ") ";
    if (text.length === 4 && text[3] !== ")") phoneNumberField.value = text.substring(0, 3) + ") " + text.substring(3, 4);
    if (text.length === 10) phoneNumberField.value += "-";
    if (text.length === 11 && text[10] !== "-") phoneNumberField.value = text.substring(0, 10) + "-" + text.substring(10, 11);
}


function cepMask(cepField){
    var text = cepField.value;
    if(isNaN(text[text.length-1])){
        cepField.value = text.substring(0, text.length-1);
        return;
    }

    cepField.setAttribute("maxlength", "9");
    if (text.length === 5) cepField.value += "-";
    if (text.length === 6 && text[5] !== "-") cepField.value = text.substring(0, 5) + "-" + text.substring(5, 6);
    if (text.length === 9) getEndereco();
}


function getEndereco() {
    
    var cep = document.getElementById("cep");
    var url = "http://viacep.com.br/ws/" + cep.value + "/json/";

    var logradouro = document.getElementById("logradouro");
    var bairro = document.getElementById("bairro");
    var cidade = document.getElementById("localidade");
    var uf = document.getElementById("uf");

    if (!cep.value.match(/\d{5}-\d{3}/)) {
        logradouro.value = "";
        bairro.value = "";
        uf.value = "";
        cidade.value = "";
        return;
    }
    
    fetch(url, {method: 'GET'})
            .then(response => {
                response.json()
                .then(data => {
                    if (data.logradouro === undefined || data.bairro === undefined || data.uf === undefined || data.localidade === undefined) {
                        logradouro.value = "";
                        bairro.value = "";
                        uf.value = "";
                        cidade.value = "";
                        return;
                    }
                    logradouro.value = data.logradouro;
                    bairro.value = data.bairro;
                    uf.value = data.uf;
                    cidade.value = data.localidade;
                });
            });
    }



function validateForm() {
    $("#registerForm").validate({
        rules: {
            email: {
                required: true,
                email: true
            },

            cpf: {
                required: true,
                cpfValido: true
            },

            nome: "required",
            
            numero: {
                required: true,
                numeroValido: true
            },
            
            cep: {
                required: true,
                cepValido: true
            },
            
            telefone: {
                required: true,
                telefoneValido: true
            }
        },

        messages: {
            email: {
                required: "<b style='color: red'>Por favor insira um email</b>",
                email: "<b style='color: red'>Por favor insira um email válido</b>"
            },

            cpf: {
                required: "<b style='color: red'>Por favor insira um CPF</b>",
                cpfValido: "<b style='color: red'>Por favor insira um CPF válido</b>"
            },

            nome: "<b style='color: red'>Por favor insira um nome</b>",
            
            numero: {
                required: "<b style='color: red'>Por favor insira um número</b>",
                numeroValido: "<b style='color: red'>Por favor insira um número válido</b>"
            },
            
            cep: {
                required: "<b style='color: red'>Por favor insira um CEP</b>",
                cepValido: "<b style='color: red'>Por favor insira um CEP válido</b>"
            },
            
            telefone: {
                required: "<b style='color: red'>Por favor insira um telefone</b>",
                telefoneValido: "<b style='color: red'>Por favor insira um telefone válido</b>"
            }
        }
    });
}


function validateNumber(value) {
    return value.match(/\d+/);
}


function validateCEP(value) {
    var uf = document.getElementById("uf");
    
    getEndereco();
    
    if (uf.value.length === 0) {
        return false;
    }
    
    return true;
}


function validatePhoneNumber(value) {
    return value.match(/\(\d{2}\)\s\d{5}-\d{4}/);
}


function validateCPF(value) {
    if (!value.match(/\d{3}\.\d{3}\.\d{3}-\d{2}/)) {
        return false;
    }
    
    value = value.replace(/[\.-]/g, "");

    var soma = 0;
    
    for (var i = 1; i <= 9; i++) {
        soma += parseInt(value.substring(i - 1, i)) * (11 - i);
    }
    
    var resto = soma % 11;
    if (resto === 10 || resto === 11 || resto < 2) {
        resto = 0;
    } else {
        resto = 11 - resto;
    }

    if (resto !== parseInt(value.substring(9, 10))) {
        return false;
    }

    soma = 0;

    for (var i = 1; i <= 10; i++) {
        soma += parseInt(value.substring(i - 1, i)) * (12 - i);
    }
    resto = soma % 11;

    if (resto === 10 || resto === 11 || resto < 2) {
        resto = 0;
    } else {
        resto = 11 - resto;
    }

    if (resto !== parseInt(value.substring(10, 11))) {
        return false;
    }

    return true;
}
