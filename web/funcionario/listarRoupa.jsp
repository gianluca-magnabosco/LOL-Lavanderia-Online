<%-- 
    Document   : listarRoupa
    Created on : 9 de dez. de 2022, 23:44:50
    Author     : penna
--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lista de Roupas</title>
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/funcionarioinicio.css'/>">
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
        <fmt:setLocale value="pt_BR"/>
        
        <c:if test="${empty sessionScope.login or login.role == \"Cliente\"}">
            <c:redirect url="/login">
                <c:param name="message" value="Voce precisa estar logado em uma conta de funcionario para acessar esta pagina!"/>
            </c:redirect>
        </c:if>
        
        <c:import url="header.jsp"/>
        
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
                            <c:forEach var="roupa" items="${roupas}">
                                <tr class="cell-1">
                                    <td>${roupa.nome}</td>
                                    <td><fmt:formatNumber value="${roupa.preco}" type="currency"/></td>
                                    <td>${roupa.tempo} dia(s)</td>
                                    <td><img src="<c:url value='${roupa.imagem}'/>" width="42" height="42"></td>
                                    <td class="text-center">
                                        <a href="<c:url value='/roupa?action=formRoupa&id=${roupa.id}'/>"><button class="btn btn-warning btn-sm text-light alterar">Alterar</button></a>
                                        <a href="<c:url value='/roupa?action=delete&id=${roupa.id}'/>"><button class="btn btn-danger btn-sm remover">Remover</button></a>
                                        <div class="inner-circle"></div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="clear"></div>
        <br/>
        
        <c:import url="/footer.jsp"/>      
        
    </body>
    
</html>