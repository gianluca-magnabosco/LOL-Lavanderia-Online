<%-- 
    Document   : clienteinicio
    Created on : 16 de nov. de 2022, 21:33:43
    Author     : gfbat
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Área do Cliente</title>
        <link rel="stylesheet" type="text/css" href="css/clienteinicio.css">
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
             >
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js">      
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous">
        </script>
    </head>
    
    <body>
        <%@ include file="headercliente.jsp" %>
        <% if (request.getParameter("pedido") != null) { %>
            <%@ include file="pedidoconfirmadopopup.jsp" %>
        <% } %>
        
        <div class="content">
            
            <div class="jumbotron">
                <h1 class="display-4">Faça agora mesmo o seu pedido!</h1>
                <a href="realizarpedido.jsp"><button id="botao-sucesso" class="btn btn-success btn-lg" role="button">Realizar pedido!</button></a>
            </div>
            <hr class="gradient">
            <h3 class="pedidos-aberto">Pedidos em aberto:</h3>

            <div class="container mt-5">
                <div class="d-flex justify-content-center row">
                    <div class="col-md-10">
                        <div class="rounded">
                            <div class="table-responsive table-borderless">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th class="text-center">
                                                    <div class="inner-circle"></div>
                                                </div>
                                            </th>
                                            <th>Pedido #</th>
                                            <th>Status</th>
                                            <th>Total</th>
                                            <th>Feito em</th>
                                            <th></th>
                                        </tr>
                                    </thead>

                                    <tbody class="table-body">
                                        <tr class="cell-1">
                                            <td class="text-center">
                                                <a href="#"><button class="btn btn-danger btn-sm">Cancelar</button></a>
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-13487</td>
                                            <td><span class="badge badge-danger">Aguardando retirada</span></td>
                                            <td>$200.00</td>
                                            <td>Hoje, 13:40</td>
                                            <td><i class="fa fa-ellipsis-h text-black-50"></i></td>
                                        </tr>

                                        <tr class="cell-1">
                                            <td class="text-center">
                                                   <a href="#"><button class="btn btn-danger btn-sm">Cancelar</button></a>
                                                    <div class="inner-circle"></div>
                                                </div>
                                            </td>
                                            <td>#SO-13453</td>
                                            <td><span class="badge badge-danger">Aguardando retirada</span></td>
                                            <td>$255.50</td>
                                            <td>Ontem, 17:59</td>
                                            <td><i class="fa fa-ellipsis-h text-black-50"></i></td>
                                        </tr>

                                        <tr class="cell-1">
                                            <td class="text-center">
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-13498</td>
                                            <td><span class="badge badge-warning">Roupas na lavanderia</span></td>
                                            <td>$57.10</td>
                                            <td>16/11/2022, 15:42</td>
                                            <td><i class="fa fa-ellipsis-h text-black-50"></i></td>
                                        </tr>

                                        <tr class="cell-1">
                                            <td class="text-center">
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-16499</td>
                                            <td><span class="badge badge-info">Em processo de entrega</span></td>
                                            <td>$560.79</td>
                                            <td>17/11/2022, 20:45</td>
                                            <td><i class="fa fa-ellipsis-h text-black-50"></i></td>
                                        </tr>
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
        
        <%@ include file="footer.jsp" %>
  
    </body>
</html>

