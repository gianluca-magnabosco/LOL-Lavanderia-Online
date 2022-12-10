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
    <title>Lista de Roupas</title>
        <link rel="stylesheet" type="text/css" href="css/funcionarioinicio.css">
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
         >
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js">
</head>
    
<body>
    <%@ include file="headerfuncionario.jsp" %>

    <% if (request.getParameter("aceitar") != null) { %>
        <%@ include file="aceitarRoupaPopup.jsp" %>
    <% } %>  

    <% if (request.getParameter("recusar") != null) { %>
        <%@ include file="cancelarpopup.jsp" %>
    <% } %>

    <div class="content">
        <div class="container mt-5">
            <h3 class="pedidos-aberto">Funcionários já cadastrados:</h3>
            <table class="table">
                <thead>
                    <tr>
                        <th>Nome Completo</th>
                        <th>Email</th>
                        <th>Data de Nascimento</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>

                <tbody class="table-body">
                    <tr class="cell-1">
                        <td>Geovanna Alberti Correia de Freitas</td>
                        <td>geovanna.alberti@ufpr.br</td>
                        <td>20/11/2002</td>
                        <td class="text-center">
                            <a href="#"><button class="btn btn-danger btn-sm">Excluir</button></a> 
                            <a href="cadastrarFuncionario.jsp"><button class="btn btn-info btn-sm">Alterar</button></a><br>
                        <div class="inner-circle"></div>
                        <td><i class="text-black-50"></i></td>
                    </tr>
                </tbody>
            </table>  
        </div>
    </div>
    <div class="clear"></div>
    <br/>
    <%@ include file="footer.jsp" %>       
</body>