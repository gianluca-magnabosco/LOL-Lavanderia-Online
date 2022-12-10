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
        <title>Área do Funcionário</title>
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
        <%@ include file="headerFuncionario.jsp" %>
        
        <%@ include file="consultarPopup.jsp" %>

        <%@ include file="aceitarPopup.jsp" %>

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
                                        
                                        <tr class="cell-1 aberto">
                                            <td class="text-center">
                                                <div class="inner-circle"></div>
                                            </td>
                                            <td>#SO-13478</td>
                                            <td><span class="badge badge-warning">EM ABERTO</span></td>
                                            <td>R$ 560,79</td>
                                            <td>10/11/2022, 20:45</td>
                                            <td class="text-center">
                                                <button class="btn btn-success btn-sm confirmar">Confirmar recolhimento</button>
                                                <button class="btn btn-info btn-sm consultar" type="button">Consultar</button>
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
                                                <button class="btn btn-success btn-sm confirmar">Confirmar recolhimento</button>
                                                <button class="btn btn-info btn-sm consultar" type="button">Consultar</button>
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
                                                <button class="btn btn-success btn-sm confirmar">Confirmar recolhimento</button>
                                                <button class="btn btn-info btn-sm consultar" type="button">Consultar</button>
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
                                                <button class="btn btn-success btn-sm confirmar">Confirmar recolhimento</button>
                                                <button class="btn btn-info btn-sm consultar" type="button">Consultar</button>
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
                                                <button class="btn btn-success btn-sm confirmar">Confirmar recolhimento</button>
                                                <button class="btn btn-info btn-sm consultar" type="button">Consultar</button>
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
                                                <button class="btn btn-success btn-sm confirmar">Confirmar recolhimento</button>
                                                <button class="btn btn-info btn-sm consultar" type="button">Consultar</button>
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
                                                <button class="btn btn-success btn-sm confirmar">Confirmar recolhimento</button>
                                                <button class="btn btn-info btn-sm consultar" type="button">Consultar</button>
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
                                                <button class="btn btn-success btn-sm confirmar">Confirmar recolhimento</button>
                                                <button class="btn btn-info btn-sm consultar" type="button">Consultar</button>
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
                                                <button class="btn btn-success btn-sm confirmar">Confirmar recolhimento</button>
                                                <button class="btn btn-info btn-sm consultar" type="button">Consultar</button>
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
                                                <button class="btn btn-success btn-sm confirmar">Confirmar recolhimento</button>
                                                <button class="btn btn-info btn-sm consultar" type="button">Consultar</button>
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
        
        <script type="text/javascript" src="js/funcionarioInicio.js"></script>          
        
        <script type="text/javascript">
            $(".aceitar").on("click", function() {
                $("#overlay.aceitarOverlay").toggle();
            });
        </script>        
        
    </body>
</html>