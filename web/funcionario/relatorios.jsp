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
        <script type="text/javascript"
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
    </head>
    
    <body>
        
        <c:if test="${empty sessionScope.login or login.role == \"Cliente\"}">
            <c:redirect url="/login">
                <c:param name="message" value="Voce precisa estar logado em uma conta de funcionário para acessar esta pagina!"/>
            </c:redirect>
        </c:if>

        <c:if test="${not empty tipo and not empty dataInicio and not empty dataFim}">
            <c:redirect url="/relatorio">
                <c:param name="action" value="${tipo}"/>
                <c:param name="dataInicio" value="${dataInicio}"/>
                <c:param name="dataFim" value="${dataFim}"/>
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
                    <div>
                        <button class="btn btn-info btn-sm botao receitas">Gerar relatório de receitas em PDF</button><br/><br/>

                        <div class="mb-2" style="margin-inline: 20%">
                            <input type="checkbox" id="checkBoxReceitas" name="checkBoxReceitas"/>
                            <span class="mb-2">Filtrar por data</span>
                        </div>

                        
                        <label for="dateRange" style="display: flex;">
                            <h5 class="mt-1 mr-2 al">Período: </h5>
                            <input type="text" class="form-control" style="width: 40%;" id="dateRange"/>
                            <div class="input-group-text">
                                <i class="fa fa-calendar-alt"></i>
                            </div>
                        </label>

                        <br/><br/>
                        <script>
                            $(".receitas").on("click", () => {
                                if ($("#checkBoxReceitas").prop("checked")) {
                                    return;
                                }
                                
                                location.href="<c:url value='/relatorio?action=receitas'/>";
                            });
                        </script>
                    </div>
                    <a href="<c:url value='/relatorio?action=clientes'/>"><button class="btn btn-info btn-sm botao">Gerar relatório de clientes em PDF</button></a><br/><br/>
                    <a href="<c:url value='/relatorio?action=clientesFieis'/>"><button id="botaoS" class="btn btn-info btn-sm">Gerar relatório de clientes fiéis em PDF</button></a><br/><br/>
                    
                    
                    <div>
                        <button class="btn btn-info btn-sm botao pedidos">Gerar relatório de pedidos em PDF</button><br/><br/>
                        <div class="mb-2" style="margin-inline: 20%">
                            <input type="checkbox" id="checkBoxPedidos" name="checkBoxPedidos"/>
                            <span>Filtrar por data</span>
                        </div>
                        
                        <label for="dateRange2" style="display: flex;">
                            <h5 class="mt-1 mr-2">Período: </h5>
                            <input type="text" style="width: 40%;" class="form-control" id="dateRange2"/>
                            <div class="input-group-text">
                                <i class="fa fa-calendar-alt"></i>
                            </div>
                        </label>

                        <br/><br/>
                        <script>
                            $(".pedidos").on("click", () => {
                                if ($("#checkBoxPedidos").prop("checked")) {
                                    return;
                                }
                                
                                location.href="<c:url value='/relatorio?action=pedidos'/>";
                            });
                        </script>
                    </div>
                    
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
        
        <script type="text/javascript" src="<c:url value='/js/relatorios.js'/>"></script>
        
    </body>
</html>