<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Consultar Pedido</title>
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/clienteinicio.css'/>"/>
        <link rel="stylesheet" href="<c:url value='/css/bulma.min.css'/>"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
        <script type="text/javascript"
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous">
        </script> 
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/cancelarpopup.css'/>">
    </head>
    
    <body>
        
        <%@ include file="header.jsp" %>

        <div id="content">
            <center id="centertext" style="padding-top: 0px;">
                <h2>Pedido #LOL-${param.id}</h2>
                <div id="bottomtext">
                    <div class="table-wrap border">
                        <table class="table justify-content-center">
                            <thead>
                                <th>Item</th>
                                <th>Qtde.</th>
                                <th>Preço Indv.</th>
                                <th>Preço Total</th>
                                <th>Prazo</th>
                                <th>Situação</th>
                            </thead>

                            <tbody>
                                <c:if test="${pedido.id == param.id}">
                                    <c:forEach var="item" items="${pedido.itens}">
                                        <tr>
                                            <td>${item.nome}</td>
                                            <td>${item.quantidade}</td>
                                            <td>R$ ${item.preco}</td>
                                            <td>R$ ${item.preco * item.quantidade}</td>
                                            <td>${item.tempo} dias</td>
                                            <td>${pedido.status}</td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                        </table>

                        <div class="border">
                            <h5 class="mt-2">Total: R$ ${pedido.orcamento}</h5>
                        </div>
                        <div class="border">
                            <h5 class="mt-2">Prazo: ${pedido.tempo} dias</h5>
                        </div>
                    </div>
                </div>
            </center>
        </div>
                        
        <%@ include file="../footer.jsp" %>
       
    </body>
</html>


