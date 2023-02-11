<%-- 
    Document   : relatorios
    Created on : 30 de nov. de 2022, 20:54:52
    Author     : gealb
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Relatórios em PDF</title>
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/relatorios.css'/>">
        <link rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        >   
    </head>
    
    <body>
        
        <c:if test="${empty sessionScope.login or login.role == \"Cliente\"}">
            <c:redirect url="/login">
                <c:param name="message" value="Voce precisa estar logado em uma conta de funcionário para acessar esta pagina!"/>
            </c:redirect>
        </c:if>
        
        <c:import url="header.jsp"/>
        
        
        <div class="content">
            
            <c:if test="${not empty param.message}">
                <div class="d-flex align-items-center">
                    <h4 class="mx-auto mt-5" style="color: red; font-weight: 1000">${param.message}</h4>
                </div>
            </c:if>
            
            <div class="container mt-5">
                <h2 class="pedidos-aberto">Área de Geração de Relatórios</h2>
                <h4 class="pedidos-aberto">Clique no relatório que deseja baixar!</h4><br/>
                <div class="botoesRelatorio">
                    <a href="<c:url value='/relatorio?action=receitas'/>"><button class="btn btn-info btn-sm botao">Gerar relatório de receitas em PDF</button></a><br/><br/>
                    <a href="<c:url value='/relatorio?action=clientes'/>"><button class="btn btn-info btn-sm botao">Gerar relatório de clientes em PDF</button></a><br/><br/>
                    <a href="<c:url value='/relatorio?action=clientesFieis'/>"><button id="botaoS" class="btn btn-info btn-sm">Gerar relatório de clientes fiéis em PDF</button></a><br/><br/>
                    <a href="<c:url value='/relatorio?action=pedidos'/>"><button class="btn btn-info btn-sm botao">Gerar relatório de pedidos em PDF</button></a><br/><br/>

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
        
        <c:import url="/footer.jsp"/>
  
    </body>
</html>