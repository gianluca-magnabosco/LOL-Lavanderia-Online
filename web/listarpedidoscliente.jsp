<%-- 
    Document   : listarpedidoscliente
    Created on : 8 de dez. de 2022, 03:44:11
    Author     : Gian
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lista de Pedidos</title>
        <link rel="stylesheet" type="text/css" href="css/clienteinicio.css">
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
        <%@ include file="headercliente.jsp" %>
        
        <div class="content">
            
            <div class="jumbotron">
                <h1 class="display-4">Faça agora mesmo o seu pedido!</h1>
                <button onclick="location.href='realizarpedido.jsp'" id="botao-sucesso" class="btn btn-success btn-lg" role="button">Realizar pedido!</button>
            </div>
            <hr class="gradient">
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

                                        <tr class="cell-1 aguardando">
                                            <td class="text-center">
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-13493</td>
                                            <td><span class="badge badge-info">AGUARDANDO PAGAMENTO</span></td>
                                            <td>R$ 15,34</td>
                                            <td>23/11/2022, 19:33</td>
                                            <td class="text-center">
                                                <a href="#"><button class="btn btn-success btn-sm">Pagar</button></a>
                                                <a href="dadosPedido.jsp"><button class="btn btn-info btn-sm">Consultar</button></a>
                                                <div class="inner-circle"></div>
                                            </td>    
                                        </tr>   
                                        
                                        <tr class="cell-1 recolhido">
                                            <td class="text-center">
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-13491</td>
                                            <td><span class="badge badge-secondary">RECOLHIDO</span></td>
                                            <td>R$ 135,22</td>
                                            <td>23/11/2022, 17:55</td>
                                            <td class="text-center">
                                                <a href="dadosPedido.jsp"><button class="btn btn-info btn-sm">Consultar</button></a>
                                                <div class="inner-circle"></div>
                                            </td>    
                                        </tr>                                        

                                        <tr class="cell-1 pago">
                                            <td class="text-center">
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-13489</td>
                                            <td><span class="badge badge-secondary" style="background-color: #F28C28">PAGO</span></td>
                                            <td>R$ 355,15</td>
                                            <td>22/11/2022, 11:13</td>
                                            <td class="text-center">
                                                <a href="dadosPedido.jsp"><button class="btn btn-info btn-sm">Consultar</button></a>
                                                <div class="inner-circle"></div>
                                            </td>    
                                        </tr>                                         
                                        
                                        <tr class="cell-1 aberto">
                                            <td></td>
                                            <td>#SO-13487</td>
                                            <td><span class="badge badge-warning">EM ABERTO</span></td>
                                            <td>R$ 200,00</td>
                                            <td>21/11/2022, 13:40</td>
                                            <td class="text-center">
                                                <a href="dadosPedido.jsp"><button class="btn btn-info btn-sm">Consultar</button></a>
                                                <a href="#"><button class="btn btn-danger btn-sm">Cancelar</button></a>
                                                <div class="inner-circle"></div>
                                            </td>
                                        </tr>

                                        <tr class="cell-1 aberto">
                                            <td></td>
                                            <td>#SO-13486</td>
                                            <td><span class="badge badge-warning">EM ABERTO</span></td>
                                            <td>R$ 255,50</td>
                                            <td>19/11/2022, 17:59</td>
                                            <td class="text-center">
                                                <a href="dadosPedido.jsp"><button class="btn btn-info btn-sm">Consultar</button></a> 
                                                <a href="#"><button class="btn btn-danger btn-sm">Cancelar</button></a>
                                                <div class="inner-circle"></div>
                                            </td>
                                        </tr>

                                        <tr class="cell-1 aberto">
                                            <td class="text-center">
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-13485</td>
                                            <td><span class="badge badge-warning">EM ABERTO</span></td>
                                            <td>R$ 57,10</td>
                                            <td>16/11/2022, 15:42</td>
                                            <td class="text-center">
                                                <a href="dadosPedido.jsp"><button class="btn btn-info btn-sm">Consultar</button></a>
                                                <a href="#"><button class="btn btn-danger btn-sm">Cancelar</button></a>
                                                <div class="inner-circle"></div>
                                            </td>    
                                        </tr>

                                        <tr class="cell-1 aberto">
                                            <td class="text-center">
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-13478</td>
                                            <td><span class="badge badge-warning">EM ABERTO</span></td>
                                            <td>R$ 560,79</td>
                                            <td>10/11/2022, 20:45</td>
                                            <td class="text-center">
                                                <a href="dadosPedido.jsp"><button class="btn btn-info btn-sm">Consultar</button></a>
                                                <a href="#"><button class="btn btn-danger btn-sm">Cancelar</button></a>
                                                <div class="inner-circle"></div>
                                            </td>    
                                        </tr>
                                        
                                        <tr class="cell-1 rejeitado">
                                            <td class="text-center">
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-13477</td>
                                            <td><span class="badge badge-danger" style="background-color: #8B0000;">REJEITADO</span></td>
                                            <td>R$ 1955,32</td>
                                            <td>05/11/2022, 06:33</td>
                                            <td class="text-center">
                                                <a href="dadosPedido.jsp"><button class="btn btn-info btn-sm">Consultar</button></a>
                                                <div class="inner-circle"></div>
                                            </td>    
                                        </tr>

                                        <tr class="cell-1 cancelado">
                                            <td class="text-center">
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-13475</td>
                                            <td><span class="badge badge-danger">CANCELADO</span></td>
                                            <td>R$ 69,13</td>
                                            <td>03/11/2022, 02:56</td>
                                            <td class="text-center">
                                                <a href="dadosPedido.jsp"><button class="btn btn-info btn-sm">Consultar</button></a>
                                                <div class="inner-circle"></div>
                                            </td>    
                                        </tr>

                                        <tr class="cell-1 finalizado">
                                            <td class="text-center">
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-13473</td>
                                            <td><span class="badge badge-success">FINALIZADO</span></td>
                                            <td>R$ 145,44</td>
                                            <td>02/11/2022, 15:35</td>
                                            <td class="text-center">
                                                <a href="dadosPedido.jsp"><button class="btn btn-info btn-sm">Consultar</button></a>
                                                <div class="inner-circle"></div>
                                            </td>    
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
        
        <script type="text/javascript" src="js/listarpedidoscliente.js"></script>
        
        <%@ include file="footer.jsp" %>
    </body>
    
</html>
