<%-- 
    Document   : listarpedidosfuncionario
    Created on : 8 de dez. de 2022, 06:31:06
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
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    </head>
    
    <body>
        <%@ include file="headerfuncionario.jsp" %>
        
        <div class="content">
            
            <h2 class="pedidos-aberto" style="margin-top: 50px;">Histórico de pedidos:</h2>

            <div class="container mt-5">

                <div class="row" style="margin: -10px 0px 10px 46px;  width: 1000px;">
                    <div class="col-sm-2" style="padding: 0px; z-index: 0;"><h4>Filtrar por: </h4></div>
                    <form>
                        <div>
                            <ul class="nav nav-stacked">
                                <li style="margin-left: 600px;">
                                    <div class="input-group date">
                                        <label for="dateRange" style="display: flex;">
                                            <h5 style="margin-top: 5px; margin-right: 8px;">Período: </h5>
                                            <input type="text" class="form-control" id="dateRange"/>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </label>
                                    </div>
                                </li>
                                
                                <li style="margin-left: 20px;">
                                    <button class="btn btn-primary" type="button" id="filtrar">Filtrar</button>
                                </li>                                
                            </ul>
                        </div>
                    </form>
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

                                        <tr class="cell-1 finalizado">
                                            <td class="text-center">
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-13472</td>
                                            <td><span class="badge badge-success">FINALIZADO</span></td>
                                            <td>R$ 83,49</td>
                                            <td>01/11/2022, 22:55</td>
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

                                        <tr class="cell-1 cancelado">
                                            <td class="text-center">
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-13474</td>
                                            <td><span class="badge badge-danger">CANCELADO</span></td>
                                            <td>R$ 153,25</td>
                                            <td>03/11/2022, 01:35</td>
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

                                        <tr class="cell-1 rejeitado">
                                            <td class="text-center">
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-13476</td>
                                            <td><span class="badge badge-danger" style="background-color: #8B0000;">REJEITADO</span></td>
                                            <td>R$ 12,50</td>
                                            <td>04/11/2022, 03:17</td>
                                            <td class="text-center">
                                                <a href="dadosPedido.jsp"><button class="btn btn-info btn-sm">Consultar</button></a>
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
                                        
                                        <tr class="cell-1 aberto">
                                            <td class="text-center">
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-13478</td>
                                            <td><span class="badge badge-warning">EM ABERTO</span></td>
                                            <td>R$ 560,79</td>
                                            <td>10/11/2022, 20:45</td>
                                            <td class="text-center">
                                                <a href="#"><button class="btn btn-success btn-sm">Confirmar recolhimento</button></a>
                                                <a href="dadosPedido.jsp"><button class="btn btn-info btn-sm">Consultar</button></a>
                                                <div class="inner-circle"></div>
                                            </td>    
                                        </tr>                                       

                                        <tr class="cell-1 aberto">
                                            <td class="text-center">
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-13479</td>
                                            <td><span class="badge badge-warning">EM ABERTO</span></td>
                                            <td>R$ 478,36</td>
                                            <td>12/11/2022, 08:55</td>
                                            <td class="text-center">
                                                <a href="#"><button class="btn btn-success btn-sm">Confirmar recolhimento</button></a>
                                                <a href="dadosPedido.jsp"><button class="btn btn-info btn-sm">Consultar</button></a>
                                                <div class="inner-circle"></div>
                                            </td>    
                                        </tr>                                         
                                        
                                        <tr class="cell-1 aberto">
                                            <td class="text-center">
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-13480</td>
                                            <td><span class="badge badge-warning">EM ABERTO</span></td>
                                            <td>R$ 32,78</td>
                                            <td>13/11/2022, 19:55</td>
                                            <td class="text-center">
                                                <a href="#"><button class="btn btn-success btn-sm">Confirmar recolhimento</button></a>
                                                <a href="dadosPedido.jsp"><button class="btn btn-info btn-sm">Consultar</button></a>
                                                <div class="inner-circle"></div>
                                            </td>    
                                        </tr>                                         
                                        
                                        <tr class="cell-1 aberto">
                                            <td class="text-center">
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-13481</td>
                                            <td><span class="badge badge-warning">EM ABERTO</span></td>
                                            <td>R$ 24,35</td>
                                            <td>14/11/2022, 11:37</td>
                                            <td class="text-center">
                                                <a href="#"><button class="btn btn-success btn-sm">Confirmar recolhimento</button></a>
                                                <a href="dadosPedido.jsp"><button class="btn btn-info btn-sm">Consultar</button></a>
                                                <div class="inner-circle"></div>
                                            </td>    
                                        </tr>                                         
                                        
                                        <tr class="cell-1 aberto">
                                            <td class="text-center">
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-13482</td>
                                            <td><span class="badge badge-warning">EM ABERTO</span></td>
                                            <td>R$ 15,90</td>
                                            <td>14/11/2022, 14:15</td>
                                            <td class="text-center">
                                                <a href="#"><button class="btn btn-success btn-sm">Confirmar recolhimento</button></a>
                                                <a href="dadosPedido.jsp"><button class="btn btn-info btn-sm">Consultar</button></a>
                                                <div class="inner-circle"></div>
                                            </td>    
                                        </tr>                                         
                                        
                                        <tr class="cell-1 aberto">
                                            <td class="text-center">
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-13483</td>
                                            <td><span class="badge badge-warning">EM ABERTO</span></td>
                                            <td>R$ 312,66</td>
                                            <td>15/11/2022, 12:25</td>
                                            <td class="text-center">
                                                <a href="#"><button class="btn btn-success btn-sm">Confirmar recolhimento</button></a>
                                                <a href="dadosPedido.jsp"><button class="btn btn-info btn-sm">Consultar</button></a>
                                                <div class="inner-circle"></div>
                                            </td>    
                                        </tr>                                           
                                        
                                        <tr class="cell-1 aberto">
                                            <td class="text-center">
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-13484</td>
                                            <td><span class="badge badge-warning">EM ABERTO</span></td>
                                            <td>R$ 74,01</td>
                                            <td>15/11/2022, 18:32</td>
                                            <td class="text-center">
                                                <a href="#"><button class="btn btn-success btn-sm">Confirmar recolhimento</button></a>
                                                <a href="dadosPedido.jsp"><button class="btn btn-info btn-sm">Consultar</button></a>
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
                                                <a href="#"><button class="btn btn-success btn-sm">Confirmar recolhimento</button></a>
                                                <a href="dadosPedido.jsp"><button class="btn btn-info btn-sm">Consultar</button></a>
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
                                                <a href="#"><button class="btn btn-success btn-sm">Confirmar recolhimento</button></a>
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
                                                <a href="#"><button class="btn btn-success btn-sm">Confirmar recolhimento</button></a>
                                                <a href="dadosPedido.jsp"><button class="btn btn-info btn-sm">Consultar</button></a>
                                                <div class="inner-circle"></div>
                                            </td>
                                        </tr>

                                        <tr class="cell-1 pago">
                                            <td class="text-center">
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-13488</td>
                                            <td><span class="badge badge-secondary" style="background-color: #F28C28">PAGO</span></td>
                                            <td>R$ 283,50</td>
                                            <td>21/11/2022, 16:20</td>
                                            <td class="text-center">
                                                <a href="#"><button class="btn btn-success btn-sm">Finalizar pedido</button></a>
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
                                                <a href="#"><button class="btn btn-success btn-sm">Finalizar pedido</button></a>
                                                <a href="dadosPedido.jsp"><button class="btn btn-info btn-sm">Consultar</button></a>
                                                <div class="inner-circle"></div>
                                            </td>    
                                        </tr>  

                                        <tr class="cell-1 recolhido">
                                            <td class="text-center">
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-13490</td>
                                            <td><span class="badge badge-secondary">RECOLHIDO</span></td>
                                            <td>R$ 28,00</td>
                                            <td>22/11/2022, 13:37</td>
                                            <td class="text-center">
                                                <a href="#"><button class="btn btn-success btn-sm">Confirmar lavagem</button></a>
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
                                                <a href="#"><button class="btn btn-success btn-sm">Confirmar lavagem</button></a>
                                                <a href="dadosPedido.jsp"><button class="btn btn-info btn-sm">Consultar</button></a>
                                                <div class="inner-circle"></div>
                                            </td>    
                                        </tr> 

                                        <tr class="cell-1 aguardando">
                                            <td class="text-center">
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-13492</td>
                                            <td><span class="badge badge-info">AGUARDANDO PAGAMENTO</span></td>
                                            <td>R$ 87,84</td>
                                            <td>23/11/2022, 18:21</td>
                                            <td class="text-center">
                                                <a href="dadosPedido.jsp"><button class="btn btn-info btn-sm">Consultar</button></a>
                                                <div class="inner-circle"></div>
                                            </td>    
                                        </tr>  

                                        <tr class="cell-1 aguardando">
                                            <td class="text-center">
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-13493</td>
                                            <td><span class="badge badge-info">AGUARDANDO PAGAMENTO</span></td>
                                            <td>R$ 15,34</td>
                                            <td>23/11/2022, 19:33</td>
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
        
        <script type="text/javascript" src="js/listarpedidosfuncionario.js"></script>
        
        <script type="text/javascript">
            $(function() {
                $('#dateRange').daterangepicker({locale: {format: "DD/MM/YYYY"}});
            });
            $('#dateRange').on("keypress paste", function() {
                return false;
            });
        </script>
        <%@ include file="footer.jsp" %>
    </body>
    
</html>
