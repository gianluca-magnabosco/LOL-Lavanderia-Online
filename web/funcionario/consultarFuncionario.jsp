<%-- 
    Document   : consultarFuncionario
    Created on : 9 de dez. de 2022, 21:24:24
    Author     : gealb
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Consultar Funcionario</title>
        <link rel="stylesheet" type="text/css" href="../css/consultarpedido.css">
        <link rel="stylesheet" href="../css/bulma.min.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    
    <body>
        <%@ include file="header.jsp" %>
            
        <div class="content">
           
            <div class="container mt-3">

                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title">Consultar dados do Funcionário</h3>
                            <a href="listarFuncionario.jsp"><button class="btn btn-danger btn-sm">Voltar</button></a>
                        </div>

                        <div class="modal-body">
                            <div class="table-wrap">
                                <table class="table justify-content-center"">
                                    <thead>
                                        <th>Nome Completo</th>
                                        <th>Email</th>
                                        <th>Data de Nascimento</th>
                                    </thead>

                                    <tbody>
                                        <tr>
                                            <td>Geovanna Alberti Correia de Freitas</td>
                                            <td>geovanna.alberti@ufpr.br</td>
                                            <td>20/11/2002</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>  
                </div>
            </div>    
        </div>
  
        <%@ include file="../footer.jsp" %>
              
    </body>
</html>
