<%-- 
    Document   : clienteinicio
    Created on : 16 de nov. de 2022, 21:33:43
    Author     : gfbat
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
        <title>Área do Cliente</title>
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/clienteinicio.css'/>">
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

        <c:import url="/popup/cancelar.jsp"/>
        
        <div class="content">
            <div class="jumbotron">
                <h1 class="display-4">Faça agora mesmo o seu pedido!</h1>
                <button onclick="location.href='<c:url value='/pedido?action=formPedido'/>'" id="botao-sucesso" class="btn btn-success btn-lg" role="button">Realizar pedido!</button>
            </div>
            
            <hr class="gradient">
            
            <h3 class="pedidos-aberto">Seus pedidos em aberto:</h3>
            <div class="container mt-5">
                <div class="d-flex justify-content-center row">
                    <div class="col-md-10" style="z-index: 0;">
                        <div class="rounded">
                            <div class="table-responsive table-borderless">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th class="text-center">
                                                <div class="inner-circle"></div>
                                            </th>
                                            <th>Pedido #</th>
                                            <th>Status</th>
                                            <th>Total</th>
                                            <th>Feito em</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-body">
                                        <c:forEach var="pedido" items="${pedidos}">
                                            <c:if test="${not empty pedido}">
                                                <tr class="cell-1">
                                                    <td></td>
                                                    <td>#LOL-${pedido.id}</td>
                                                    <td><span class="badge badge-warning">${pedido.status}</span></td>
                                                    <td><fmt:formatNumber value="${pedido.orcamento}" type="currency"/></td>
                                                    <td><fmt:formatDate value="${pedido.dataInicio}" pattern="dd/MM/yyyy"/></td>
                                                    <td class="text-center">
                                                        <button class="btn btn-info btn-sm consultar consultar${pedido.id}" id="bt1" type="button" value="button1">Consultar</button></a>
                                                        <button class="btn btn-danger btn-sm cancelar cancelar${pedido.id}" id="btn1" type="button" value="button1">Cancelar Pedido</button>
                                                        <div class="inner-circle"></div>
                                                    </td>
                                                </tr>

                                                <script>
                                                    $(".consultar${pedido.id}").on("click", () => {
                                                        location.href="<c:url value='/pedido?action=consultar&id=${pedido.id}'/>";
                                                    });

                                                    $(".cancelar${pedido.id}").on("click", () => {
                                                        $("#overlay.cancelarOverlay").show();
                                                        
                                                        $(".confirmarCancelamento").on("click", () => {
                                                            location.href="<c:url value='/pedido?action=cancelar&id=${pedido.id}'/>";
                                                        });
                                                    });
                                                </script>
                                            </c:if>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clear"></div>
            <br/>
        
        </div>
        
        <c:import url="/footer.jsp"/>

    </body>     
    
</html>