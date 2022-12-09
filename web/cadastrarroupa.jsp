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
        <title>Cadastrar Peça de Roupa</title>
        <link rel="stylesheet" type="text/css" href="css/realizarpedido.css">
        <link rel="stylesheet" href="css/bulma.min.css" />
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
        <script type="text/javascript" src="js/cadastrarroupa.js"></script>
    </head>
    
    <body>
        <%@ include file="headerfuncionario.jsp" %>
        
        <% if (request.getParameter("aceitar") != null) { %>
            <%@ include file="aceitarpopup.jsp" %>
        <% } %>  
        
        <% if (request.getParameter("recusar") != null) { %>
            <%@ include file="cancelarpopup.jsp" %>
        <% } %>          
        
        <div class="content">
            <hr class="gradient">

            <div id="app">
                <div class="section">
                    <div class="container">
                        <div class="media is-pulled-right">
                            <div class="media-content">
                                <div class="field is-grouped">
                                    <div class="control"></div>
                                    <div class="control">
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="container">
                            <form class="border rounded p-3" action="cadastrarroupa" method="post" id="formulario">

                                <div class="mb-2">
                                    <label for="nomeRoupa" class="form-label">Nome da Roupa</label>
                                    <div class="control">
                                        <input type="text" class="form-control input" placeholder="Insira o nome da peça de roupa" name="nome" id="nome">
                                    </div>
                                </div>
                                    
                                <div class="mb-2">
                                    <label for="precoRoupa" class="form-label">Preço</label>
                                    <div class="control">
                                        <input type="text" oninput="precoMask(this)" name="preco" placeholder="Insira o custo da lavagem da peça" class="form-control input" id="preco">
                                    </div>
                                </div>    

                                <div class="mb-2">
                                    <label for="prazoRoupa" class="form-label">Prazo de Entrega Estimado</label>
                                    <div class="control">
                                        <input type="text" name="prazo" oninput="prazoMask(this)" placeholder="Insira o prazo estimado para lavagem" class="form-control input" id="prazo">
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

                                <div class="field is-grouped justify-content-center""> 
                                    <div class="control">
                                        <button class="btn btn-danger btn-lg" id="recusar">Cancelar</button>
                                    </div>
                                    <div class="control">
                                        <button class="btn btn-success btn-lg" type="submit" id="aceitar">Cadastrar</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <%@ include file="footer.jsp" %>    
        
    </body>
    
    <script type="text/javascript">

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
      
        
        <script type="text/javascript">
            $("#aceitar").on("click", function() {               
                    location.href = "cadastrarroupa.jsp?aceitar=true";
                    return;
                }
                
            );
        </script>   
        
        <script type="text/javascript">
            $("#recusar").on("click", function() {               
                    location.href = "cadastrarroupa.jsp?recusar=true";
                    return;
                }
                
            );
        </script>         
    
</html>