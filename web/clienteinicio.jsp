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
        <script type="text/javascript"
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous">
        </script>
    </head>
    
    <body>
        <%@ include file="headercliente.jsp" %>
        <% if (request.getParameter("cancelar") != null) { %>
            <%@ include file="cancelarpopup.jsp" %>
        <% } %>
        
        <% if (request.getParameter("pedido") != null) { %>
            <%@ include file="pedidoconfirmadopopup.jsp" %>
        <% } %>
        
        <% if (request.getParameter("consultar") != null) { %>
            <%@ include file="consultarpopup.jsp" %>
        <% } %>        
     
        
        <div class="content">
            
            <div class="jumbotron">
                <h1 class="display-4">Faça agora mesmo o seu pedido!</h1>
                <button onclick="location.href='realizarpedido.jsp'" id="botao-sucesso" class="btn btn-success btn-lg" role="button">Realizar pedido!</button>
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
                                        <tr class="cell-1">
                                            <td></td>
                                            <td>#SO-13487</td>
                                            <td><span class="badge badge-warning">EM ABERTO</span></td>
                                            <td>R$ 200,00</td>
                                            <td>21/11/2022, 13:40</td>
                                            <td class="text-center">
                                                <button class="btn btn-info btn-sm" id="bt1" type="button" value="button1">Consultar</button></a>
                                                <button class="btn btn-danger btn-sm" id="btn1" type="button" value="button1">Cancelar</button>
                                                <div class="inner-circle"></div>
                                            </td>
                                        </tr>

                                        <tr class="cell-1">
                                            <td></td>
                                            <td>#SO-13486</td>
                                            <td><span class="badge badge-warning">EM ABERTO</span></td>
                                            <td>R$ 255,50</td>
                                            <td>19/11/2022, 17:59</td>
                                            <td class="text-center">
                                                <button class="btn btn-info btn-sm" id="bt2" type="button" value="button2">Consultar</button></a> 
                                                <button class="btn btn-danger btn-sm" id="btn2" type="button" value="button2">Cancelar</button>
                                                <div class="inner-circle"></div>
                                            </td>
                                        </tr>

                                        <tr class="cell-1">
                                            <td class="text-center">
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-13485</td>
                                            <td><span class="badge badge-warning">EM ABERTO</span></td>
                                            <td>R$ 57,10</td>
                                            <td>16/11/2022, 15:42</td>
                                            <td class="text-center">
                                                <button class="btn btn-info btn-sm" id="bt3" type="button" value="button3">Consultar</button></a>
                                                <button class="btn btn-danger btn-sm" id="btn3" type="button" value="button3">Cancelar</button>
                                                <div class="inner-circle"></div>
                                            </td>    
                                        </tr>

                                        <tr class="cell-1">
                                            <td class="text-center">
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-13478</td>
                                            <td><span class="badge badge-warning">EM ABERTO</span></td>
                                            <td>R$ 560,79</td>
                                            <td>10/11/2022, 20:45</td>
                                            <td class="text-center">
                                                <button class="btn btn-info btn-sm" id="bt4" type="button" value="button4">Consultar</button></a>
                                                <button class="btn btn-danger btn-sm" id="btn4" type="button" value="button4">Cancelar</button>
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
        
        <%@ include file="footer.jsp" %>
        
        <script type="text/javascript">
          var buttons = document.getElementsByClassName('btn btn-danger btn-sm');
          for(var i=0; i<buttons.length; i++){
              buttons[i].addEventListener("click", function(){ location.href="clienteinicio.jsp?cancelar=true"; return;})
                                             }
                                             
            
        </script>
        
        
        <script type="text/javascript">
          var buttons = document.getElementsByClassName('btn btn-info btn-sm');
          for(var i=0; i<buttons.length; i++){
              buttons[i].addEventListener("click", function(){ location.href="clienteinicio.jsp?consultar=true"; return;})
                                             }
                                             
            
        </script>
        

    </body>     
  
    
</html>

