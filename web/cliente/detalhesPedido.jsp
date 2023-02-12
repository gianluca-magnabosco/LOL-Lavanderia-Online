<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Detalhes do Pedido #LOL-${param.id}</title>
        <link rel="stylesheet" href="<c:url value='/css/bulma.min.css'/>"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
        <script type="text/javascript"
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous">
        </script> 
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/detalhesPedido.css'/>">
    </head>
    
    <body>
        <fmt:setLocale value="pt_BR"/>
        
        <c:if test="${empty sessionScope.login or login.role == \"Funcionario\"}">
            <c:redirect url="/login">
                <c:param name="message" value="Voce precisa estar logado em uma conta de cliente para acessar esta pagina!"/>
            </c:redirect>
        </c:if>
        
        <c:import url="header.jsp"/>

        <div id="content">
            <center id="centertext" style="padding-top: 0px;">
                <h2>Pedido #LOL-${param.id}</h2>
                <h4>Situação: ${pedido.status}</h4>
                <div id="bottomtext">
                    <div class="table-wrap border">
                        <table class="table justify-content-center">
                            <thead>
                                <th>Item</th>
                                <th>Qtde.</th>
                                <th>Preço Indv.</th>
                                <th>Preço Total</th>
                                <th>Prazo</th>
                            </thead>

                            <tbody>
                                <c:if test="${pedido.id == param.id}">
                                    <c:forEach var="item" items="${pedido.itens}">
                                        <tr>
                                            <td>${item.nome}</td>
                                            <td>${item.quantidade}</td>
                                            <td><fmt:formatNumber value="${item.preco}" type="currency"/></td>
                                            <td><fmt:formatNumber value="${item.preco * item.quantidade}" type="currency"/></td>
                                            <td>${item.tempo} dias</td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                        </table>

                        <div class="border">
                            <h5 class="mt-2">Total: <fmt:formatNumber value="${pedido.orcamento}" type="currency"/></h5>
                        </div>
                        <div class="border">
                            <h5 class="mt-2">Prazo: ${pedido.tempo} dia(s)</h5>
                        </div>
                    </div>
                </div>
            </center>
        </div>
                        
        <c:import url="/footer.jsp"/>
       
    </body>
</html>


