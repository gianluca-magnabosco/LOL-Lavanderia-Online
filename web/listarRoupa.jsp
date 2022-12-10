<%-- 
    Document   : listarRoupa
    Created on : 9 de dez. de 2022, 23:44:50
    Author     : penna
--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lista de Roupas</title>
        <link rel="stylesheet" type="text/css" href="css/funcionarioinicio.css">
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
        <%@ include file="headerFuncionario.jsp" %>
        
        <% if (request.getParameter("roupa") != null && request.getParameter("roupa").equals("adicionar")) { %>
            <%@ include file="roupaConfirmadaPopup.jsp" %>
        <% } %>  
        
        <% if (request.getParameter("roupa") != null && request.getParameter("roupa").equals("remover")) { %>
            <%@ include file="roupaRemovidaPopup.jsp" %>
        <% } %>  
        
        <%@ include file="aceitarPopup.jsp" %>

        <%@ include file="removerPopup.jsp" %>

        
        <div class="content">
            <div class="container mt-5">
                <h3 class="pedidos-aberto">Roupas já cadastradas:</h3>
                <div class="table-responsive table-borderless mt-4">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Nome</th>
                                <th>Preço</th>
                                <th>Prazo</th>
                                <th>Foto</th>
                                <th></th>
                            </tr>
                        </thead>   

                        <tbody class="table-body">
                            <tr class="cell-1">
                                <td>Camiseta Social "Pollo"</td>
                                <td>R$ 10,00</td>
                                <td>1 dia(s)</td>
                                <td><img src="images/item-4.png" width="42" height="42"></td>
                                <td class="text-center">
                                    <a href="cadastrarRoupa.jsp?update=true"><button class="btn btn-warning btn-sm text-light alterar">Alterar</button></a>
                                    <button class="btn btn-danger btn-sm remover">Remover</button>
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
        <%@ include file="footer.jsp" %>       
    </body>
    
    <script type="text/javascript">
        $(".acknowledge").on("click", function() {
            location.href="listarRoupa.jsp";
        });
        
        $(".remover").on("click", function() {
            $("#overlay.cancelarOverlay").toggle();
        });
        
        $(".confirmar").on("click", function() {
            location.href="listarRoupa.jsp?roupa=remover";
        });
        
        $(".cancelar").on("click", function() {
            $("#overlay.cancelarOverlay").toggle();
        });
    </script>
    
</html>