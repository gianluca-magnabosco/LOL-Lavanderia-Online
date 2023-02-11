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
        <title>Área do Funcionário</title>
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
        
        <c:if test="${empty sessionScope.login or login.role == \"Cliente\"}">
            <c:redirect url="/login">
                <c:param name="message" value="Voce precisa estar logado em uma conta de funcionario para acessar esta pagina!"/>
            </c:redirect>
        </c:if>
        
        <c:import url="header.jsp"/>

        <div class="content">

            <h3 class="pedidos-aberto">Pedidos em aberto:</h3>

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
                                            <tr class="cell-1 aberto">
                                                <td class="text-center">
                                                    <div class="inner-circle"></div>
                                                </td>
                                                <td>#LOL-${pedido.id}</td>
                                                <td><span class="badge badge-warning">${pedido.status}</span></td>
                                                <td><fmt:formatNumber value="${pedido.orcamento}" type="currency"/></td>
                                                <td><fmt:formatDate value="${pedido.dataInicio}" pattern="dd/MM/yyyy HH:mm"/></td>
                                                <td class="text-center">
                                                    <button class="btn btn-info btn-sm consultar consultar${pedido.id}" type="button">Consultar</button>
                                                    <button class="btn btn-success btn-sm confirmar confirmar${pedido.id}">Confirmar recolhimento</button>
                                                    <div class="inner-circle"></div>
                                                </td>    
                                            </tr> 
                                            
                                            <script>
                                                $(".consultar${pedido.id}").on("click", () => {
                                                    location.href="<c:url value='/pedido?action=consultar&id=${pedido.id}'/>";
                                                });
                                                
                                                $(".confirmar${pedido.id}").on("click", () => {
                                                    location.href = "<c:url value='/pedido?action=recolher&id=${pedido.id}'/>";
                                                });
                                            </script>
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