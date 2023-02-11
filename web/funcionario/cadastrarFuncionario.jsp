<%-- 
    Document   : manutencaoFuncionario
    Created on : 09 de dez. de 2022, 21:02:12
    Author     : gealb
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cadastrar Funcionário</title>
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/funcionarioinicio.css'/>">
        <link rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        >
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>        
        <script type="text/javascript"
            src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js">
        </script> 
    </head>
    
    <body>
                
        <c:if test="${empty sessionScope.login or login.role == \"Cliente\"}">
            <c:redirect url="/login">
                <c:param name="message" value="Voce precisa estar logado em uma conta de funcionario para acessar esta pagina!"/>
            </c:redirect>
        </c:if>
        
        <c:import url="header.jsp"/>
        
        <div class="content">
            
            <h3 class="pedidos-aberto">Cadastro de funcionário</h3>
            
            <div class="container mt-5">
                <div class="d-flex justify-content-center row">
                    <div class="col-md-10">
                        <div class="container">
                            <form id="formulario" class="border rounded p-3" action="listarFuncionario.jsp?funcionario=adicionar" method="post">
                                <div class="mb-2">
                                    <label for="nome" class="form-label">Nome Completo</label>
                                    <input type="text" class="form-control" placeholder="Insira o nome" name="nome" id="nome"
                                               <% if (request.getParameter("update") != null) {
                                                    out.println("value=\"Geovanna Alberti Correia de Freitas\"");
                                                  }
                                               %>
                                               >
                                </div>

                                <div class="mb-2"> 
                                    <label for="email" class="form-label">E-mail de login</label>
                                    <input type="text" placeholder="Insira o e-mail para login" class="form-control" name="email" id="email"
                                               <% if (request.getParameter("update") != null) {
                                                    out.println("value=\"geovanna.alberti@ufpr.br\"");
                                                  }
                                               %>
                                               >
                                </div>

                                <div class="mb-2">
                                    <label for="senha" class="form-label">Senha</label>
                                    <input type="password" placeholder="Insira uma senha" class="form-control" id="senha" name="senha">
                                </div>

                                <div class="mb-2">
                                    <label for="dataNasc" class="form-label">Data de nascimento</label>
                                    <input type="text" placeholder="Insira a data de nascimento" class="form-control" id="dataNasc" name="dataNasc"
                                               <% if (request.getParameter("update") != null) {
                                                    out.println("value=\"20/11/2002\"");
                                                  } else {
                                                    out.println("value=\"01/01/1901\"");
                                                  }
                                               %>
                                               >
                                </div>

                                <div class="field is-grouped justify-content-center text-center mt-3"> 
                                    <div class="control">
                                        <button class="btn btn-success btn-lg cadastrar" type="button">Cadastrar</button>
                                        <button class="btn btn-danger btn-lg cancelar" type="button">Cancelar</button>
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
        
        <script type="text/javascript" src="../js/cadastrarFuncionario.js"></script>

        <script type="text/javascript">

            $("#cancelar").on("click", function() {
                $("#overlay.cancelarOverlay").toggle();
            });

            $(".cancelar").on("click", function() {
                $("#overlay.cancelarOverlay").toggle();
            });

            $(".cadastrar").on("click", function() {
                $("#overlay.aceitarOverlay").toggle();
            });

            $(".confirmar").on("click", function() {
                location.href="funcionarioInicio.jsp";
            });

            $(".aceitar").on("click", function() {
                $("#formulario").submit();
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

                        dataNasc: "required"
                    },

                    messages: {
                        nome: "<b style='color: red'>Por favor insira um nome</b>",

                        email: {
                            required: "<b style='color: red'>Por favor insira um e-mail</b>",
                            email: "<b style='color: red'>Por favor insira um e-mail válido</b>"
                        },

                        senha: "<b style='color: red'>Por favor insira uma senha</b>",

                        dataNasc: "<b style='color: red'>Por favor insira uma data de nascimento</b>"
                    }

                });

            }

            $(document).ready(validateFormulario());

        </script>      
    </body>
    
    
</html>