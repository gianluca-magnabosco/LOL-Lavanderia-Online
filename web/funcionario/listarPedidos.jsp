<%-- 
    Document   : listarpedidosfuncionario
    Created on : 8 de dez. de 2022, 06:31:06
    Author     : Gian
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lista de Pedidos</title>
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/clienteinicio.css'/>">
        <script type="text/javascript"
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous">
        </script> 
        <link rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        >   
        <script src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
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
            
            <c:if test="${not empty param.message}">
                <div class="d-flex align-items-center">
                    <h4 class="mx-auto mt-5" style="color: red; font-weight: 1000">${param.message}</h4>
                </div>
            </c:if>
            
            <h2 class="pedidos-aberto" style="margin-top: 50px;">Histórico de pedidos:</h2>

            <div class="container mt-5">

                <div class="row" style="margin: -10px 0px 10px 46px;  width: 1000px;">
                    <div class="nav border p-3 mb-2 mt-2">
                        <div class="mr-5" style="margin-top: 10px;">
                            <h4>Filtrar por: </h4>
                        </div>

                        <div class="mt-2 mr-4 ml-5">
                            <button class="btn btn-primary" type="button" id="todos">Todos os pedidos</button>
                        </div>

                        <div class="mt-2 ml-4">
                            <button class="btn btn-primary" type="button" id="hoje">Pedidos de hoje</button>
                        </div>

                        <div style="margin-left: 7px;">
                            <div class="input-group mt-2 ml-3">
                                <div class="ml-5">
                                    <label for="dateRange" style="display: flex;">
                                        <h5 class="mt-1 mr-2">Período: </h5>
                                        <input type="text" class="form-control" id="dateRange"/>
                                        <div class="input-group-text">
                                            <i class="fa fa-calendar-alt"></i>
                                        </div>
                                    </label>
                                </div>
                            </div>
                        </div>                             
                    </div>
                </div>

                
                
                <div class="d-flex justify-content-center row">
                    <div class="col-md-11" style="z-index: 0;">
                        <div class="rounded">
                            <div class="table-responsive table-borderless">
                                <table class="table" style="width: 1000px;">
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
                                                <c:choose>
                                                    <c:when test="${pedido.status == \"AGUARDANDO PAGAMENTO\"}">
                                                        <tr class="cell-1 aguardando">
                                                    </c:when>
                                                    <c:when test="${pedido.status == \"EM ABERTO\"}">
                                                        <tr class="cell-1 aberto">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <tr class="cell-1 ${fn:toLowerCase(pedido.status)}">
                                                    </c:otherwise>
                                                </c:choose>
                                                    <td class="text-center">
                                                        <div class="inner-circle"></div>
                                                    </td>
                                                    <td>#LOL-${pedido.id}</td>
                                                    <c:choose>
                                                        <c:when test="${pedido.status == \"AGUARDANDO PAGAMENTO\"}">
                                                            <td><span class="badge badge-info">${pedido.status}</span></td>
                                                        </c:when>
                                                        <c:when test="${pedido.status == \"RECOLHIDO\"}">
                                                            <td><span class="badge badge-secondary">${pedido.status}</span></td>
                                                        </c:when>
                                                        <c:when test="${pedido.status == \"PAGO\"}">
                                                            <td><span class="badge badge-secondary" style="background-color: #F28C28">${pedido.status}</span></td>
                                                        </c:when>
                                                        <c:when test="${pedido.status == \"EM ABERTO\"}">
                                                            <td><span class="badge badge-warning">${pedido.status}</span></td>
                                                        </c:when>
                                                        <c:when test="${pedido.status == \"REJEITADO\"}">
                                                            <td><span class="badge badge-danger" style="background-color: #8B0000;">${pedido.status}</span></td>
                                                        </c:when>
                                                        <c:when test="${pedido.status == \"CANCELADO\"}">
                                                            <td><span class="badge badge-danger">${pedido.status}</span></td>
                                                        </c:when>
                                                        <c:when test="${pedido.status == \"FINALIZADO\"}">
                                                            <td><span class="badge badge-success">${pedido.status}</span></td>
                                                        </c:when>
                                                    </c:choose>
                                                    <td><fmt:formatNumber value="${pedido.orcamento}" type="currency"/></td>
                                                    <td class="data"><fmt:formatDate value="${pedido.dataInicio}" pattern="dd/MM/yyyy"/></td>
                                                    <td class="text-center">
                                                        <button class="btn btn-info btn-sm consultar consultar${pedido.id}">Consultar</button>
                                                        <c:choose>
                                                            <c:when test="${pedido.status == \"EM ABERTO\"}">
                                                                <button class="btn btn-success btn-sm confirmar confirmar${pedido.id}">Confirmar Recolhimento</button>
                                                                <script>
                                                                    $(".confirmar${pedido.id}").on("click", () => {
                                                                        location.href="<c:url value='pedido?action=recolher&id=${pedido.id}'/>";
                                                                    });
                                                                </script>
                                                            </c:when>
                                                            <c:when test="${pedido.status == \"PAGO\"}">
                                                                <button class="btn btn-success btn-sm finalizar finalizar${pedido.id}">Finalizar Pedido</button></a>
                                                                <script>
                                                                    $(".finalizar${pedido.id}").on("click", () => {
                                                                        location.href="<c:url value='pedido?action=finalizar&id=${pedido.id}'/>";
                                                                    });
                                                                </script>
                                                            </c:when>
                                                            <c:when test="${pedido.status == \"RECOLHIDO\"}">
                                                                <button class="btn btn-success btn-sm confirmarLavagem confirmarLavagem${pedido.id}">Confirmar Lavagem</button></a>
                                                                <script>
                                                                    $(".confirmarLavagem${pedido.id}").on("click", () => {
                                                                        location.href="<c:url value='pedido?action=confirmar&id=${pedido.id}'/>";
                                                                    });
                                                                </script>
                                                            </c:when>
                                                        </c:choose>
                                                        <div class="inner-circle"></div>
                                                        <script>
                                                            $(".consultar${pedido.id}").on("click", () => {
                                                                location.href="<c:url value='/pedido?action=consultar&id=${pedido.id}'/>";
                                                            });
                                                        </script>
                                                    </td>    
                                                </tr>   
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
        
        <script type="text/javascript" src="<c:url value='/js/listarPedidosFuncionario.js'/>"></script>
        
    </body>
    
</html>
