<%-- 
    Document   : dadosPedido
    Created on : 6 de dez. de 2022, 21:43:12
    Author     : gealb
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Dados do Pedido</title>
        <link rel="stylesheet" type="text/css" href="css/consultarpedido.css">
        <link rel="stylesheet" href="css/bulma.min.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    
    <body>
        <%@ include file="headerCliente.jsp" %>
            
        <div class="content">

            <div class="container mt-3">

                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title">Pedido #1234</h3>
                        </div>

                        <div class="modal-body">
                            <div class="table-wrap">
                                <table class="table justify-content-center"">
                                    <thead>
                                        <th>Itens</th>
                                        <th>Preço Indv.</th>
                                        <th>Preço Total</th>
                                        <th>Prazo</th>
                                        <th>Situação</th>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Camisa</td>
                                            <td>R$ 7,99</td>
                                            <td>R$ 24,98</td>
                                            <td>3 dias</td>
                                            <td>Aguardando retirada</td>
                                        </tr>
                                        <tr>
                                            <td>Tênis</td>
                                            <td>R$ 16,99</td>
                                            <td>R$ 24,98</td>
                                            <td>3 dias</td>
                                            <td>Aguardando retirada</td>
                                        </tr>

                                     <a href="clienteInicio.jsp"><button class="btn btn-danger btn-sm">Voltar</button></a>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>  
                </div>
            </div>    
        </div>
  
        <%@ include file="footer.jsp" %>
              
    </body>
</html>
