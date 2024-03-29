<%-- 
    Document   : listarpedidoscliente
    Created on : 8 de dez. de 2022, 03:44:11
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
        <link rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        >     
        <script type="text/javascript"
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous">
        </script>
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/clienteinicio.css'/>">
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
        <c:import url="/popup/pagar.jsp"/>
        
        <c:if test="${not empty param.realizado}">
            <c:import url="/popup/pedidoConfirmado.jsp">
                <c:param name="id" value="${param.id}"/>
            </c:import>
        </c:if>
        
        
        <div class="content">
            
            <div class="jumbotron">
                <h1 class="display-4">Faça agora mesmo o seu pedido!</h1>
                <button onclick="location.href='<c:url value='pedido?action=formPedido'/>'" id="botao-sucesso" class="btn btn-success btn-lg" role="button">Realizar pedido!</button>
            </div>
            
            <hr class="gradient">
            
            <c:if test="${not empty param.message}">
                <div class="d-flex align-items-center">
                    <h4 class="mx-auto mt-5" style="color: red; font-weight: 1000">${param.message}</h4>
                </div>
            </c:if>
            
            <h2 class="pedidos-aberto" style="margin-top: 50px;">Seus pedidos:</h2>

            <div class="container mt-5">
                         
                <div class="row" style="margin: -10px 0px 10px 46px;  width: 1000px;">
                    <div class="col-sm-2" style="padding: 0px; z-index: 0;"><h4>Filtrar por: </h4></div>
                    <div class="btn-group" data-toggle="buttons" style="z-index: 0;">
                        <label class="btn btn-info active">
                            <input type="radio" name="status" value="todos" checked="checked"> Todos
                        </label>

                        <label class="btn btn-info text-light">
                            <input type="radio" name="status" value="aguardando"> Aguardando Pagamento
                        </label>   

                        <label class="btn btn-secondary text-light">
                            <input type="radio" name="status" value="recolhido"> Recolhidos
                        </label>                            

                        <label class="btn text-light" style="background-color: #F28C28;">
                            <input type="radio" name="status" value="pago"> Pagos
                        </label>

                        <label class="btn btn-warning">
                            <input type="radio" name="status" value="aberto"> Em aberto
                        </label>

                        <label class="btn btn-success">
                            <input type="radio" name="status" value="finalizado"> Finalizados
                        </label>	

                        <label class="btn text-light" style="background-color: #8B0000;">
                            <input type="radio" name="status" value="rejeitado"> Rejeitados
                        </label>	

                        <label class="btn btn-danger">
                            <input type="radio" name="status" value="cancelado"> Cancelados
                        </label>	
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
                                                    <td><fmt:formatDate value="${pedido.dataInicio}" pattern="dd/MM/yyyy"/></td>
                                                    <td class="text-center">
                                                        <button class="btn btn-info btn-sm consultar consultar${pedido.id}">Consultar</button>
                                                        <c:choose>
                                                            <c:when test="${pedido.status == \"AGUARDANDO PAGAMENTO\"}">
                                                                <button class="btn btn-success btn-sm pagar pagar${pedido.id}">Pagar Pedido</button></a>
                                                                <script>
                                                                    $(".pagar${pedido.id}").on("click", () => {
                                                                        $("#overlay.pagarOverlay").show();

                                                                        $(".pagamento").on("click", () => {
                                                                            location.href="<c:url value='/pedido?action=pagar&id=${pedido.id}'/>";
                                                                        });
                                                                    });
                                                                </script>
                                                            </c:when>
                                                            <c:when test="${pedido.status == \"EM ABERTO\"}">
                                                                <button class="btn btn-danger btn-sm cancelar cancelar${pedido.id}">Cancelar Pedido</button>
                                                                <script>
                                                                    $(".cancelar${pedido.id}").on("click", () => {
                                                                        $("#overlay.cancelarOverlay").show();

                                                                        $(".confirmarCancelamento").on("click", () => {
                                                                            location.href="<c:url value='/pedido?action=cancelar&id=${pedido.id}'/>";
                                                                        });
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
        
        <script type="text/javascript" defer src="<c:url value='/js/listarPedidosCliente.js'/>"></script>
        
    </body>
    
</html>
