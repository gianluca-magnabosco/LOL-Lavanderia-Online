<%-- 
    Document   : listarFuncionario
    Created on : 10 de dez. de 2022, 00:07:13
    Author     : penna
--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lista de Funcionários</title>
        <link rel="stylesheet" type="text/css" href="../css/funcionarioinicio.css">
        <link rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        >
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous">
        </script>
    </head>

    <body>
        <%@ include file="header.jsp" %>

        <% if (request.getParameter("funcionario") != null && request.getParameter("funcionario").equals("adicionar")) { %>
            <%@ include file="../popup/funcionarioConfirmado.jsp" %>
        <% } %>  
        
        <% if (request.getParameter("funcionario") != null && request.getParameter("funcionario").equals("remover")) { %>
            <%@ include file="../popup/funcionarioRemovido.jsp" %>
        <% } %>  
        
        <%@ include file="../popup/aceitar.jsp" %> 

        <%@ include file="../popup/remover.jsp" %>


        <div class="content">
            <div class="container mt-5">
                <h3 class="pedidos-aberto">Funcionários já cadastrados:</h3>
                <div class="table-responsive table-borderless mt-4">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Nome Completo</th>
                                <th>Email</th>
                                <th>Data de Nascimento</th>
                                <th></th>
                            </tr>
                        </thead>

                        <tbody class="table-body">
                            <tr class="cell-1">
                                <td>Geovanna Alberti Correia de Freitas</td>
                                <td>geovanna.alberti@ufpr.br</td>
                                <td>20/11/2002</td>
                                <td class="text-center">
                                    <a href="consultarFuncionario.jsp"><button class="btn btn-info btn-sm text-light">Consultar</button></a>
                                    <a href="cadastrarFuncionario.jsp?update=true"><button class="btn btn-warning btn-sm text-light alterar">Alterar</button></a>
                                    <button class="btn btn-danger btn-sm remover">Excluir</button>
                                    <div class="inner-circle"></div>
                                </td>
                            </tr>
                        </tbody>
                    </table>  
                </div>
            </div>
        </div>
        
        <div class="clear"></div>
        <br/>
        
        <%@ include file="../footer.jsp" %>    
        
    </body>
    
    <script type="text/javascript">
        $(".acknowledge").on("click", function() {
            location.href="listarFuncionario.jsp";
        });
        
        $(".remover").on("click", function() {
            $("#overlay.cancelarOverlay").toggle();
        });
        
        $(".confirmar").on("click", function() {
            location.href="listarFuncionario.jsp?funcionario=remover";
        });
        
        $(".cancelar").on("click", function() {
            $("#overlay.cancelarOverlay").toggle();
        });
    </script>
</html>