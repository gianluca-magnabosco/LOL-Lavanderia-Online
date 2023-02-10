<%-- 
    Document   : consultarpedido
    Created on : 1 de dez. de 2022, 19:06:43
    Author     : gfbat
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Consultar Pedido</title>
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/clienteinicio.css'/>"/>
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/consultarpedido.css'/>"/>
        <link rel="stylesheet" href="<c:url value='/css/bulma.min.css'/>"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
        <script type="text/javascript"
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous">
        </script> 
    </head>
    
    <body>
        
        <c:if test="${empty sessionScope.login or login.role == \"Funcionario\"}">
            <c:redirect url="/login">
                <c:param name="message" value="Voce precisa estar logado em uma conta de cliente para acessar esta pagina!"/>
            </c:redirect>
        </c:if>
        
        
        <c:import url="header.jsp"/>
        
        <div class="content">

            <p class="titulo">Digite aqui o número <br/> do seu pedido!</p>
           
            <div class="container mt-3">
                <div class="input-group">
                    <input type="search" class="form-control rounded searchbar" placeholder="Ex: #LOL-32269"/>
                    <button type="button" class="btn btn-outline-primary consultar">Pesquisar</button>
                </div> 
                
                <b id="errorMsg" style="color: red;"></b>
                <b id="message" style="color: red;">${message}</b>
            </div>
        </div>    

        
        <div class="section1">
            <div class="center">
                <h2>Ainda não fez um pedido? Veja os principais motivos <br/> para pedir com a gente!</h2>

                <div class="section">

                    <div class="single">
                        <div>
                            <img src="<c:url value='/images/entregador.png'/>" alt="Entregador">
                        </div>
                        
                        <div class="text-single">
                            <h3>Busca e leva!</h3>
                            <p>
                                Ao realizar o seu pedido, nós enviamos um motoboy até você, ele vai recolher as roupas e no fim do processo
                                levar até você no conforto da sua casa!
                            </p>	
                        </div>
                    </div>

                    <div class="single">
                        <div>
                            <img src="<c:url value='/images/wash.png'/>" alt="Máquina de lavar">
                        </div>
                        
                        <div class="text-single">
                            <h3>Qualidade!</h3>
                            <p>
                                Nossa empresa trabalha apenas com as melhores máquinas com a melhor da tecnologia
                                disponível no mercado, nós garantimos a sua satisfação!
                            </p>	
                        </div>
                    </div>

                    <div class="single">
                        <div>
                            <img src="<c:url value='/images/desconto.png'/>" alt="Desconto">
                        </div>
                        
                        <div class="text-single">
                            <h3>Preço justo!</h3>
                            <p>
                                Antes de realizar seu pedido você vai 
                                recebe o orçamento de maneira instantânea por um preço justo e que cabe no seu bolso!
                            </p>	
                        </div>
                    </div>
                    
                    <div class="clear"></div>
                    
                </div>
            </div>
        </div>
              
        <c:import url="/footer.jsp"/>
           
    </body>
    
    <script type="text/javascript" defer src="<c:url value='/js/consultarPedido.js'/>"></script>
    
</html>
