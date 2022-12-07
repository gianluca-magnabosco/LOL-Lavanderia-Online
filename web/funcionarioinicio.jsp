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
        <title>Área do Funcionario</title>
        <link rel="stylesheet" type="text/css" href="css/funcionarioinicio.css">
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
             >
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js">      
    </head>
    
    <body>
        <%@ include file="headerfuncionario.jsp" %>
        
        <div class="content">

            <h3 class="pedidos-aberto">Pedidos em aberto:</h3>

            <div class="container mt-5">
                <div class="d-flex justify-content-center row">
                    <div class="col-md-10">
                        <div class="rounded">
                            <div class="table-responsive table-borderless">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Pedido #</th>
                                            <th>Status</th>
                                            <th>Total</th>
                                            <th>Feito em</th> 
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody class="table-body">
                                        <tr class="cell-1">
                                            <td>#SO-13487</td>
                                            <td><span class="badge badge-warning">Em aberto</span></td>
                                            <td>R$200.00</td>
                                            <td>Hoje, 13:40</td>
                                            <td class="text-center">
                                                <a href="#"><button class="btn btn-success btn-sm">Recolher pedido</button></a> 
                                                <a href="dadosPedidofuncionario.jsp"><button class="btn btn-info btn-sm">Consultar</button></a><br>
                                                <div class="inner-circle"></div>
                                            <td><i class="text-black-50"></i></td>
                                        </tr>

                                        <tr class="cell-1">
                                            <td>#SO-13453</td>
                                            <td><span class="badge badge-warning">Em aberto</span></td>
                                            <td>R$255.50</td>
                                            <td>Ontem, 17:59</td>
                                            <td class="text-center">
                                                <a href="#"><button class="btn btn-success btn-sm">Recolher pedido</button></a> 
                                                <a href="dadosPedidofuncionario.jsp"><button class="btn btn-info btn-sm">Consultar</button></a><br>
                                                <div class="inner-circle"></div>
                                            <td><i class="text-black-50"></i></td>
                                        </tr>

                                        <tr class="cell-1">
                                            <td>#SO-13412</td>
                                            <td><span class="badge badge-warning">Em aberto</span></td>
                                            <td>R$123.50</td>
                                            <td>29/11/2022, 07:45</td>
                                            <td class="text-center">
                                                <a href="#"><button class="btn btn-success btn-sm">Recolher pedido</button></a> 
                                                <a href="dadosPedidofuncionario.jsp"><button class="btn btn-info btn-sm">Consultar</button></a><br>
                                                <div class="inner-circle"></div>
                                            <td><i class="text-black-50"></i></td>
                                        </tr>

                                        <tr class="cell-1">
                                            <td>#SO-13409</td>
                                            <td><span class="badge badge-warning">Em aberto</span></td>
                                            <td>R$99.00</td>
                                            <td>28/11/2022, 17:55</td>
                                            <td class="text-center">
                                                <a href="#"><button class="btn btn-success btn-sm">Recolher pedido</button></a> 
                                                <a href="dadosPedidofuncionario.jsp"><button class="btn btn-info btn-sm">Consultar</button></a><br>
                                                <div class="inner-circle"></div>
                                            <td><i class="text-black-50"></i></td>
                                        </tr>

                                        <tr class="cell-1">
                                            <td>#SO-13405</td>
                                            <td><span class="badge badge-warning">Em aberto</span></td>
                                            <td>R$23.50</td>
                                            <td>28/11/2022, 15:56</td>
                                            <td class="text-center">
                                                   <a href="#"><button class="btn btn-success btn-sm">Recolher pedido</button></a> 
                                                   <a href="dadosPedidofuncionario.jsp"><button class="btn btn-info btn-sm">Consultar</button></a><br>
                                                   <div class="inner-circle"></div>
                                            <td><i class="text-black-50"></i></td>
                                        </tr>

                                        <tr class="cell-1">
                                            <td>#SO-13401</td>
                                            <td><span class="badge badge-warning">Em aberto</span></td>
                                            <td>R$76.00</td>
                                            <td>27/11/2022, 22:17</td>
                                            <td class="text-center">
                                                <a href="#"><button class="btn btn-success btn-sm">Recolher pedido</button></a> 
                                                <a href="dadosPedidofuncionario.jsp"><button class="btn btn-info btn-sm">Consultar</button></a><br>
                                                <div class="inner-circle"></div>
                                            <td><i class="text-black-50"></i></td>
                                        </tr>

                                        <tr class="cell-1">
                                            <td>#SO-13399</td>
                                            <td><span class="badge badge-warning">Em aberto</span></td>
                                            <td>R$34.00</td>
                                            <td>27/11/2022, 17:01</td>
                                            <td class="text-center">
                                                <a href="#"><button class="btn btn-success btn-sm">Recolher pedido</button></a> 
                                                <a href="dadosPedidofuncionario.jsp"><button class="btn btn-info btn-sm">Consultar</button></a> <br>
                                                <div class="inner-circle"></div>
                                            <td><i class="text-black-50"></i></td>
                                        </tr>

                                        <tr class="cell-1">
                                            <td>#SO-13381</td>
                                            <td><span class="badge badge-warning">Em aberto</span></td>
                                            <td>R$44.50</td>
                                            <td>27/11/2022, 13:41</td>
                                            <td class="text-center">
                                                <a href="#"><button class="btn btn-success btn-sm">Recolher pedido</button></a> 
                                                <a href="dadosPedidofuncionario.jsp"><button class="btn btn-info btn-sm">Consultar</button></a> <br>
                                                <div class="inner-circle"></div>
                                            <td><i class="text-black-50"></i></td>
                                        </tr>

                                        <tr class="cell-1">
                                            <td>#SO-13355</td>
                                            <td><span class="badge badge-warning">Em aberto</span></td>
                                            <td>R$189.90</td>
                                            <td>26/11/2022, 18:54</td>
                                            <td class="text-center">
                                                <a href="#"><button class="btn btn-success btn-sm">Recolher pedido</button></a>
                                                <a href="dadosPedidofuncionario.jsp"><button class="btn btn-info btn-sm">Consultar</button></a> <br>
                                                <div class="inner-circle"></div>
                                            <td><i class="text-black-50"></i></td>
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