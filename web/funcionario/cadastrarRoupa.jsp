<%-- 
    Document   : cadastraroupa
    Created on : 30 de dez. de 2022, 20:12:31
    Author     : penna
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cadastro de Peça de Roupa</title>
        <link rel="stylesheet" type="text/css" href="../css/funcionarioinicio.css">
        <link rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        >
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous">
        </script>
        <script type="text/javascript"
            src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js">
        </script>     
    </head>
    
    <body>
        <%@ include file="header.jsp" %>
        
        <%@ include file="../popup/aceitar.jsp" %>
        
        <%@ include file="../popup/cancelar.jsp" %>
        
        <div class="content">

            <h3 class="pedidos-aberto">Cadastro de Peça de Roupa</h3>

            <div class="container mt-5">
                <div class="d-flex justify-content-center row">
                    <div class="col-md-10">
                        <div class="container">
                            <form class="border rounded p-3" action="listarRoupa.jsp?roupa=adicionar" method="post" id="formulario">
                                <div class="mb-2">
                                    <label for="nomeRoupa" class="form-label">Nome da Roupa</label>
                                    <div class="control">
                                        <input type="text" class="form-control input" placeholder="Insira o nome da peça de roupa" name="nome" id="nome"
                                               <% if (request.getParameter("update") != null) {
                                                    out.println("value='Camiseta Social \"Pollo\"'");
                                                  }
                                               %>
                                               >
                                    </div>
                                </div>

                                <div class="mb-2">
                                    <label for="precoRoupa" class="form-label">Preço</label>
                                    <div class="control">
                                        <input type="text" oninput="precoMask(this)" name="preco" placeholder="Insira o custo da lavagem da peça" class="form-control input" id="preco"
                                               <% if (request.getParameter("update") != null) {
                                                    out.println("value=\"R$ 10,00\"");
                                                  }
                                               %>
                                               >
                                    </div>
                                </div>    

                                <div class="mb-2">
                                    <label for="prazoRoupa" class="form-label">Prazo de Entrega Estimado</label>
                                    <div class="control">
                                        <input type="text" name="prazo" placeholder="Insira o prazo estimado para lavagem" class="form-control input" id="prazo"
                                               <% if (request.getParameter("update") != null) {
                                                    out.println("value=\"1 dia(s)\"");
                                                  }
                                               %>
                                               >
                                    </div>
                                </div>

                                <div class="input-group mb-4" style="margin-top: 20px;">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Foto</span>
                                    </div>

                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input input" id="foto" name="foto" accept="image/*">
                                        <label class="custom-file-label" for="fotoRoupa">Insira uma foto da peça de roupa</label>
                                    </div>
                                </div>

                                <div class="field is-grouped justify-content-center text-center"> 
                                    <div class="control">
                                        <button class="btn btn-success btn-lg" type="button" id="cadastrar">Cadastrar</button>
                                        <button class="btn btn-danger btn-lg" id="cancelar" type="button">Cancelar</button>
                                    </div>
                                </div>

                            </form>
                        </div>
                        
                    </div>
                </div>
            </div>
            <div class="clear"></div>
            <br/>
        </div>
        <%@ include file="../footer.jsp" %>       
    </body>

    <script type="text/javascript" src="../js/cadastrarRoupa.js"></script>
    
    <script type="text/javascript">
        
        $("#cancelar").on("click", function() {
            $("#overlay.cancelarOverlay").toggle();
        });
        
        $(".cancelar").on("click", function() {
            $("#overlay.cancelarOverlay").toggle();
        });
        
        $("#cadastrar").on("click", function() {
            $("#overlay.aceitarOverlay").toggle();
        });
        
        $(".confirmar").on("click", function() {
            location.href="funcionarioInicio.jsp";
        });
        
        $(".aceitar").on("click", function() {
            $("#formulario").submit();
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

                    prazo: {
                        required: true,
                        prazoValido: true
                    },

                    foto: "required"
                },

                messages: {
                    nome: "<b style='color: red'>Por favor insira um nome</b>",

                    preco: "<b style='color: red'>Por favor insira um preço</b>",

                    prazo: {
                        required: "<b style='color: red'>Por favor insira um prazo</b>",
                        prazoValido: "<b style='color: red'>Por favor insira um prazo válido</b>"
                    },

                    foto: "<b style='color: red; display: block; margin-top: 100px;'>Por favor insira uma foto da peça de roupa</b>"
                }
                
            });
  
        }
      
        $(document).ready(validateFormulario());

        $.validator.addMethod("prazoValido", function(value, element, param) {
            return validatePrazo(value);
        });
    </script>       

    
</html>