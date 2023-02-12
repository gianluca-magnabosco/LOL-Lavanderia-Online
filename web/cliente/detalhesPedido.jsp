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
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/detalhesPedido.css'/>">
        <link rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        >     
        <script type="text/javascript"
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous">
        </script> 
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
                <h4>Data de Criação do Pedido: <fmt:formatDate value="${pedido.dataInicio}" pattern="dd/MM/yyyy"/></h4>
                <c:choose>
                    <c:when test="${pedido.status == \"AGUARDANDO PAGAMENTO\"}">
                        <td>Situação: <span class="badge badge-info">${pedido.status}</span></td>
                    </c:when>
                    <c:when test="${pedido.status == \"RECOLHIDO\"}">
                        <td>Situação: <span class="badge badge-secondary">${pedido.status}</span></td>
                    </c:when>
                    <c:when test="${pedido.status == \"PAGO\"}">
                        <td>Situação: <span class="badge badge-secondary" style="background-color: #F28C28">${pedido.status}</span></td>
                    </c:when>
                    <c:when test="${pedido.status == \"EM ABERTO\"}">
                        <td>Situação: <span class="badge badge-warning">${pedido.status}</span></td>
                    </c:when>
                    <c:when test="${pedido.status == \"REJEITADO\"}">
                        <td>Situação: <span class="badge badge-danger" style="background-color: #8B0000;">${pedido.status}</span></td>
                    </c:when>
                    <c:when test="${pedido.status == \"CANCELADO\"}">
                        <td>Situação: <span class="badge badge-danger">${pedido.status}</span></td>
                    </c:when>
                    <c:when test="${pedido.status == \"FINALIZADO\"}">
                        <td>Situação: <span class="badge badge-success">${pedido.status}</span></td>
                    </c:when>
                </c:choose>
                <div class="container mt-5">
                    <div class="d-flex justify-content-center row">
                        <div class="col-md-10" style="z-index: 0;">
                            <div class="rounded">
                                <div class="table-responsive table-borderless">
                                    <table class="table mb-0">
                                        <thead>
                                            <th>Item</th>
                                            <th>Qtde.</th>
                                            <th>Preço Indv.</th>
                                            <th>Preço Total</th>
                                            <th>Prazo</th>
                                        </thead>

                                        <tbody class="table-body">
                                            <c:if test="${pedido.id == param.id}">
                                                <c:forEach var="item" items="${pedido.itens}">
                                                    <tr class="cell-1">
                                                        <td>${item.nome}</td>
                                                        <td>${item.quantidade}</td>
                                                        <td><fmt:formatNumber value="${item.preco}" type="currency"/></td>
                                                        <td><fmt:formatNumber value="${item.preco * item.quantidade}" type="currency"/></td>
                                                        <td>${item.tempo} dia(s)</td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                        </tbody>
                                    </table>

                                    <div class="cell-1 p-1" style="background-color: #c6c7c8;">
                                        <h5 class="mt-2">Total: <fmt:formatNumber value="${pedido.orcamento}" type="currency"/></h5>
                                    </div>
                                    <div class="cell-1 p-1" style="background-color: #c6c7c8;">
                                        <h5 class="mt-2">Prazo: ${pedido.tempo} dia(s)</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </center>
        </div>
                        
        <c:import url="/footer.jsp"/>
       
    </body>
</html>


