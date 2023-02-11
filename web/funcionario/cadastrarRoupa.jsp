<%-- 
    Document   : cadastraroupa
    Created on : 30 de dez. de 2022, 20:12:31
    Author     : penna
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
        <title>Cadastro de Peça de Roupa</title>
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/funcionarioinicio.css'/>">
        <link rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        >
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous">
        </script>
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

            <h3 class="pedidos-aberto">Cadastro de Peça de Roupa</h3>

            <div class="container mt-5">
                <div class="d-flex justify-content-center row">
                    <div class="col-md-10">
                        <div class="container">
                            <form class="border rounded p-3" action="roupa?action=update&id=${param.id}" method="post" id="formulario" enctype="multipart/form-data">
                                <div class="mb-2">
                                    <label for="nomeRoupa" class="form-label">Nome da Roupa</label>
                                    <div class="control">
                                        <input autofocus type="text" class="form-control input" placeholder="Insira o nome da peça de roupa" name="nome" id="nome"
                                                <c:if test="${not empty roupa}">
                                                    <c:out value="value=${roupa.nome}"/>
                                                </c:if>
                                                >
                                    </div>
                                </div>

                                <div class="mb-2">
                                    <label for="precoRoupa" class="form-label">Preço</label>
                                    <div class="control">
                                        <input type="text" oninput="precoMask(this)" name="preco" placeholder="Insira o custo da lavagem da peça" class="form-control input" id="preco">
                                        <c:if test="${not empty roupa}">
                                            <script>
                                                const preco = "${roupa.preco}";
                                                const formattedPreco = "R$ " + parseFloat(preco).toFixed(2).replace(".", ",");
                                                $("#preco").val(formattedPreco);
                                            </script>
                                        </c:if>
                                    </div>
                                </div>    

                                <div class="mb-2">
                                    <label for="prazoRoupa" class="form-label">Prazo de Entrega Estimado</label>
                                    <div class="control">
                                        <input type="text" name="tempo" placeholder="Insira o prazo estimado para lavagem" class="form-control input" id="prazo" value="">
                                            <c:if test="${not empty roupa}">
                                                <script>
                                                    $("#prazo").val("${roupa.tempo} dia(s)");
                                                </script>
                                            </c:if>
                                    </div>
                                </div>

                                <div class="input-group mb-4" style="margin-top: 20px;">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Foto</span>
                                    </div>

                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input input" id="foto" name="imagem" accept="image/*">
                                        <label class="custom-file-label" for="fotoRoupa">Insira uma foto da peça de roupa</label>
                                    </div>
                                </div>

                                <div class="field is-grouped justify-content-center text-center"> 
                                    <div class="control">
                                        <c:choose>
                                            <c:when test="${not empty roupa}">
                                                <button class="btn btn-warning text-light btn-lg" type="submit" id="atualizar">Atualizar</button>
                                            </c:when>
                                            <c:otherwise>
                                                <button class="btn btn-success btn-lg" type="submit" id="cadastrar">Cadastrar</button>
                                            </c:otherwise>
                                        </c:choose>
                                        <button class="btn btn-danger btn-lg" id="cancelar" type="button">Cancelar</button>
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
        
    </body>

    <script>
        <c:import url="/js/cadastrarRoupa.js" charEncoding="UTF-8"/>
    </script>

</html>