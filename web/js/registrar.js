const cpfMask = cpfField => {
    let text = cpfField.value;
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
};



const phoneNumberMask = phoneNumberField => {
    let text = phoneNumberField.value;
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
};



const cepMask = cepField => {
    let text = cepField.value;
    if(isNaN(text[text.length-1])){
        cepField.value = text.substring(0, text.length-1);
        return;
    }

    cepField.setAttribute("maxlength", "9");
    if (text.length === 5) cepField.value += "-";
    if (text.length === 6 && text[5] !== "-") cepField.value = text.substring(0, 5) + "-" + text.substring(5, 6);
    if (text.length === 9) getEndereco();
};



const getEndereco = () => {
    
    let cep = document.getElementById("cep");
    let url = "http://viacep.com.br/ws/" + cep.value + "/json/";

    let logradouro = document.getElementById("logradouro");
    let bairro = document.getElementById("bairro");
    let cidade = document.getElementById("localidade");
    let uf = document.getElementById("uf");

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
};



const validateForm = () => {
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
};



const validateNumber = value => {
    return value.match(/\d+/);
};



const validateCEP = value => {
    let uf = document.getElementById("uf");
    
    getEndereco();
    
    if (uf.value.length === 0) {
        return false;
    }
    
    return true;
};



const validatePhoneNumber = value => {
    return value.match(/\(\d{2}\)\s\d{5}-\d{4}/);
};



const validateCPF = value => {
    if (!value.match(/\d{3}\.\d{3}\.\d{3}-\d{2}/)) {
        return false;
    }
    
    value = value.replace(/[\.-]/g, "");

    n = 0;
    m = 0;
    for (i = 9; i < 11; i++) {
        for (n = 0, m = 0; m < i; m++) {
            n += value[m] * ((i + 1) - m);
        }
        n = ((10 * n) % 11) % 10;
        if (value[m] != n) {
            return false;
        }
    }

    return true;
};
