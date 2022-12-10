
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

