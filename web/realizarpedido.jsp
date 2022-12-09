<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Realizar Pedido</title>
        <link rel="stylesheet" type="text/css" href="css/realizarpedido.css">
        <link rel="stylesheet" href="css/bulma.min.css" />
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
        <%@ include file="headercliente.jsp" %>
        
        <% if (request.getParameter("aceitar") != null) { %>
            <%@ include file="aceitarpopup.jsp" %>
        <% } %>  
        
        <% if (request.getParameter("recusar") != null) { %>
            <%@ include file="cancelarpopup.jsp" %>
        <% } %>         
        
        <div class="content">

            <div class="jumbotron">
                <h1 class="display-4">Realize Seu Pedido!</h1>
            </div>
            <hr class="gradient">

            <div id="app">
                <div class="section">
                    <div class="container">
                        <div class="media is-pulled-right">
                            <div class="media-content">
                                <div class="field is-grouped">
                                    <div class="control"></div>
                                    <div class="control">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="container">
                            <div class="table-wrap">
                                <table class="table justify-content-center"">
                                    <thead>
                                        <th>&nbsp;</th>
                                        <th>&nbsp;</th>
                                        <th>Peça</th>
                                        <th>Preço</th>
                                        <th>Quantidade</th>
                                        <th>Prazo</th>
                                        <th>Total</th>
                                        <th>&nbsp;</th>
                                    </thead>

                                    <tbody>
                                        <tr class="align-middle alert border-bottom" role="alert">
                                            <td>
                                                <div class="alinhamento">
                                                <input type="checkbox" id="check">
                                                </div>
                                            </td>
                                            <td class="text-center">
                                                
                                                <img class="pic"
                                                    src="images/item-1.png"
                                                    alt="">
                                            </td>
                                            <td>
                                                <div class="alinhamento">
                                                    <p class="m-0 fw-bold">Tênis</p>
                                                    <p class="m-0 text-muted">Modelos cano baixo</p>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="alinhamento">
                                                    <div class="fw-600"><span class="preco">R$20,99</span></div>
                                                </div>
                                            </td>
                                            <td class="d-">
                                                <input class="input" value="0" type="number" placeholder="Insira a quantidade" min="0" oninput="this.value = Math.abs(this.value)">
                                            </td>
                                            <td>
                                                <div class="alinhamento">
                                                    <div class="fw-600"><span class="prazo">3 dia(s)</span></div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="alinhamento">
                                                    <div class="fw-600"><span class="result">R$ 0,00</span></div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="align-middle alert border-bottom" role="alert">
                                            <td>
                                                <div class="alinhamento">
                                                <input type="checkbox" id="check">
                                                </div>
                                            </td>
                                            <td class="text-center">
                                           
                                                <img class="pic"
                                                    src="images/item-2.png"
                                                    alt="">
                                          
                                            </td>
                                            <td>
                                                <div class="alinhamento">
                                                    <p class="m-0 fw-bold">Moletom</p>
                                                    <p class="m-0 text-muted">Lavagem especial para algodão</p>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="alinhamento">
                                                    <div class="fw-600" class="preco"><span class="preco">R$16,99</span></div>
                                                </div>
                                            </td>
                                            <td class="d-">
                                                <input class="input" value="0" type="number" placeholder="Insira a quantidade" min="0" oninput="this.value = Math.abs(this.value)">
                                            </td>
                                            <td>
                                                <div class="alinhamento">
                                                    <div class="fw-600"><span class="prazo">2 dia(s)</span></div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="alinhamento">
                                                    <div class="fw-600"><span class="result">R$ 0,00</span></div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="align-middle alert border-bottom" role="alert">
                                       
                                            <td>
                                                <div class="alinhamento">
                                                <input type="checkbox" id="check">
                                                   </div>
                                            </td>
                                         
                                            <td class="text-center">
                                                <div class="alinhamento">
                                                    
                                                <img class="pic"
                                                    src="images/item-3.png"
                                                    alt="">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="alinhamento">
                                                    <p class="m-0 fw-bold">Calça</p>
                                                    <p class="m-0 text-muted">Calças jeans</p>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="alinhamento">
                                                    <div class="fw-600" class="preco"><span class="preco">R$10,99</span></div>
                                                </div>
                                            </td>
                                            <td class="d-">
                                                <input class="input" value="0" type="number" placeholder="Insira a quantidade" min="0" oninput="this.value = Math.abs(this.value)">
                                            </td>
                                            <td>
                                                <div class="alinhamento">
                                                    <div class="fw-600"><span class="prazo">1 dia(s)</span></div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="alinhamento">
                                                    <div class="fw-600"><span class="result">R$ 0,00</span></div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="align-middle alert border-bottom" role="alert">
                                            <td>
                                               
                                                <div class="alinhamento">
                                                <input type="checkbox" id="check">
                                                 </div>
                                            </td>
                                           
                                            <td class="text-center">
                                                <div class="reversoali">
                                                <img class="pic"
                                                    src="images/item-4.png"
                                                    alt="">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="alinhamento">
                                                    <p class="m-0 fw-bold">Camiseta</p>
                                                    <p class="m-0 text-muted">Camisetas comuns</p>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="alinhamento">
                                                    <div class="fw-600" class="preco"><span class="preco">R$6,99</span></div>
                                                </div>
                                            </td>
                                            <td>
                                                <input class="input" value="0" type="number" placeholder="Insira a quantidade" min="0" oninput="this.value = Math.abs(this.value)">
                                            </td>
                                            <td>
                                                <div class="alinhamento">
                                                    <div class="fw-600"><span class="prazo">1 dia(s)</span></div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="alinhamento">
                                                    <div class="fw-600"><span class="result">R$ 0,00</span></div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="resultado" style="margin-bottom: 35px">
                            <h1 class="display-3">Seu pedido deu um total de: <span id="totalAmount"></span></h1>
                            <h1 class="display-3">O prazo estimado é de: <span id="finalDeadLine"></span></h1>
                        </div>
                        
                        <div class="field is-grouped justify-content-center">
                            <p id="errormsg" style="color: red;"></p>
                        </div>
                        
                        <div class="field is-grouped justify-content-center">
                            <div class="control">
                                <button class="btn btn-success btn-lg" id="aceitar" type="button">Aceitar</button>
                            </div>
                            <div class="control">
                                <button class="btn btn-danger btn-lg" id="recusar">Rejeitar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <%@ include file="footer.jsp" %>
        
        <script type="text/javascript">
            $("#aceitar").on("click", function() {
                $("#errormsg").text("");
                var check = 0;
                if ($("input:checkbox:checked").length > 0) {
                    $("input:checkbox:checked").each(function() {
                        currentAmount = $(this).closest('tr').find('input[type=number]').val();
                        if (currentAmount == 0) {
                            check++;
                            return;
                        }
                    });
                    
                    if (check > 0) {
                        $("#errormsg").text("Algum item selecionado está com quantidade 0!");
                        return;
                    }
                    
                    location.href = "realizarpedido.jsp?aceitar=true";
                    return;
                }
                
                $("#errormsg").text("Selecione ao menos um item!");
            });
        </script>
        
        <script type="text/javascript">
            $("#recusar").on("click", function() {               
                    location.href = "realizarpedido.jsp?recusar=true";
                    return;
                }
                
            );
        </script>        
        
        <script type="text/javascript" src="js/realizarpedido.js"></script>
    </body>
</html>
