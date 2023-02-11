<%-- 
    Document   : manutencaoFuncionario
    Created on : 09 de dez. de 2022, 21:02:12
    Author     : gealb
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cadastrar Funcionário</title>
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/funcionarioinicio.css'/>">
        <link rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        >
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>        
        <script type="text/javascript"
            src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js">
        </script> 
    </head>
    
    <body>
        <fmt:setLocale value="pt_BR"/>
        
        <c:if test="${empty sessionScope.login or login.role == \"Cliente\"}">
            <c:redirect url="/login">
                <c:param name="message" value="Voce precisa estar logado em uma conta de funcionario para acessar esta pagina!"/>
            </c:redirect>
        </c:if>
        
        <c:import url="header.jsp"/>
        
        <div class="content">
            
            <h3 class="pedidos-aberto">Cadastro de funcionário</h3>
            
            <div class="container mt-5">
                <div class="d-flex justify-content-center row">
                    <div class="col-md-10">
                        <div class="container">
                            <form id="formulario" class="border rounded p-3" action="funcionarioController?action=update&id=${param.id}" method="post">
                                <div class="mb-2">
                                    <label for="nome" class="form-label">Nome Completo</label>
                                    <input type="text" class="form-control" placeholder="Insira o nome" name="nome" id="nome"
                                                <c:if test="${not empty funcionario}">
                                                    <c:out value="value=${funcionario.nome}"/>
                                                </c:if>
                                                >
                                </div>

                                <div class="mb-2"> 
                                    <label for="email" class="form-label">E-mail de login</label>
                                    <input type="text" placeholder="Insira o e-mail para login" class="form-control" name="email" id="email"
                                                <c:if test="${not empty funcionario}">
                                                    <c:out value="value=${funcionario.email}"/>
                                                </c:if>
                                                >
                                </div>

                                <div class="mb-2">
                                    <label for="senha" class="form-label">Senha</label>
                                    <input type="password" placeholder="Insira uma senha" class="form-control" id="senha" name="senha">
                                </div>

                                <div class="mb-2">
                                    <label for="dataNascimento" class="form-label">Data de nascimento</label>
                                    <input type="text" placeholder="Insira a data de nascimento" class="form-control" id="dataNascimento" name="dataNascimento">
                                    
                                    <c:if test="${not empty funcionario}">
                                        <script>
                                            $("#dataNascimento").val("<fmt:formatDate value="${funcionario.dataNascimento}" pattern="dd/MM/yyyy"/>");
                                        </script>
                                    </c:if>
                                </div>
                                <div class="field is-grouped justify-content-center text-center mt-3"> 
                                    <div class="control">
                                        <c:choose>
                                            <c:when test="${not empty funcionario}">
                                                <button class="btn btn-warning text-light btn-lg" type="submit" id="atualizar">Atualizar</button>
                                            </c:when>
                                            <c:otherwise>
                                                <button class="btn btn-success btn-lg" type="submit">Cadastrar</button>
                                            </c:otherwise>
                                        </c:choose>
                                        <button class="btn btn-danger btn-lg cancelar" type="button">Cancelar</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clear"></div>
            <br/>
        </div>     
        
        <c:import url="/footer.jsp"/>  
        
        <script>
            <c:import url="/js/cadastrarFuncionario.js"/>
        </script>
  
    </body>
    
    
</html>