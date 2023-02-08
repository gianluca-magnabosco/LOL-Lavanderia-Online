
const validateForm = () => {
    $("#loginForm").validate({
        rules: {
            email: {
                required: true,
                email: true
            },

            password: "required"
        },

        messages: {
            email: {
                required: "<b class='inputError'>Por favor insira um email</b>",
                email: "<b class='inputError'>Por favor insira um email válido</b>"
            },

            password: "<b class='inputError'>Por favor insira uma senha</b>"
        }
    });
};