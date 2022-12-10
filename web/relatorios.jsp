<%-- 
    Document   : relatorios
    Created on : 30 de nov. de 2022, 20:54:52
    Author     : gealb
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Relatórios em PDF</title>
        <link rel="stylesheet" type="text/css" href="css/relatorios.css">
        <link rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        >   
    </head>
    
    <body>
        <%@ include file="headerFuncionario.jsp" %>
        
        <div class="content">
            <div class="container mt-5">
                <h2 class="pedidos-aberto">Área de Geração de Relatórios</h2>
                <h4 class="pedidos-aberto">Clique no relatório que deseja baixar!</h4><br/>
                <div class="botoesRelatorio">
                    <a href="#"><button class="btn btn-info btn-sm botao">Gerar relatório de receitas em PDF</button></a><br/><br/>
                    <a href="#"><button class="btn btn-info btn-sm botao">Gerar relatório de clientes em PDF</button></a><br/><br/>
                    <a href="#"><button id="botaoS" class="btn btn-info btn-sm">Gerar relatório de clientes fiéis em PDF</button></a><br/><br/>
                    <a href="#"><button class="btn btn-info btn-sm botao">Gerar relatório de pedidos em PDF</button></a><br/><br/>

                    <style>
                        .botao {
                            padding: 50px 110px 50px 110px;
                        }
                        
                        #botaoS {
                            padding: 50px 110px 50px 80px;
                        }
                    </style>

                </div>                         
            </div>

            <div class="clear"></div>
            <br/>
        </div>
        
        <%@ include file="footer.jsp" %>
  
    </body>
</html>