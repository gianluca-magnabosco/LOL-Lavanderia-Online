<%-- 
    Document   : consultarpedido
    Created on : 1 de dez. de 2022, 19:06:43
    Author     : gfbat
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Consultar Pedido</title>
        <link rel="stylesheet" type="text/css" href="css/consultarpedido.css"/>
        <link rel="stylesheet" href="css/bulma.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    
    <body>
        <%@ include file="headercliente.jsp" %>
            
        <div class="content">

            <P class="titulo">Digite aqui o número <br/> do seu pedido!</P>
           
            <div class="container mt-3">

                <div class="input-group">
                    <input type="search" class="form-control rounded" placeholder="Ex: #921999" aria-label="Search" aria-describedby="search-addon" />
                    <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#myModal">Pesquisar</button>
                </div> 

                <div class="modal" id="myModal">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="modal-title">Pedido #1234</h3>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
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
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>  
                    </div> 
                </div>
            </div>
        </div>    

        
        <div class="section1">
            <div class="center">
                <h2>Ainda não fez um pedido? Veja os principais motivos <br/> para pedir com a gente!</h2>

                <div class="section">

                    <div class="single">

                        <div><img src="images/entregador.png" alt="Entregador"></div>
                        <div class="text-single">
                            <h3>Busca e leva!</h3>
                            <p>Ao realizar o seu pedido, nós enviamos um motoboy até você, ele vai recolher as roupas e no fim do processo
                                levar até você no conforto da sua casa!
                            </p>	
                        </div>
                    </div>

                    <div class="single">
                        <div><img src="images/wash.png" alt="Máquina de lavar"></div>
                        <div class="text-single">
                            <h3>Qualidade!</h3>
                            <p>Nossa empresa trabalha apenas com as melhores máquinas com a melhor da tecnologia
                                disponível no mercado, nós garantimos a sua satisfação!
                            </p>	
                        </div>
                    </div>

                    <div class="single">
                        <div><img src="images/desconto.png" alt="Desconto"></div>
                        <div class="text-single">
                            <h3>Preço justo!</h3>
                            <p>Antes de realizar seu pedido você vai 
                                recebe o orçamento de maneira instantânea por um preço justo e que cabe no seu bolso!
                            </p>	
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
              
        <%@ include file="footer.jsp" %>
              
    </body>
</html>
