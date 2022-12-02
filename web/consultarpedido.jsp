<%-- 
    Document   : consultarpedido
    Created on : 1 de dez. de 2022, 19:06:43
    Author     : gfbat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Realizar Pedido</title>
        <link rel="stylesheet" type="text/css" href="css/consultarpedido.css">
        <link rel="stylesheet" href="css/bulma.min.css" />
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        
    </head>
    <body>
        <header class="header">
            <div class="hamburger-menu">
                <input id="menu__toggle" type="checkbox" />
                <label class="menu__btn" for="menu__toggle">
                    <span></span>
                </label>

                <ul class="menu__box">
                    <li><a class="menu__item" href="clienteinicio.jsp">Home</a></li>
                    <li><a class="menu__item" href="#">Lista de pedidos</a></li>
                    <li><a class="menu__item" href="#">Consulte seu pedido</a></li>
                    <a class="menu__item" href="#"><button id="btn-pedido" class="btn btn-lg">Fazer um pedido</button></a>
                    <a href="logout"><button id="botao-logout" class="btn btn-danger btn-lg">Logout</button></a>

                </ul>
            </div>  
            <div class="images-header">
                <img class="icone" src="images/logo-icone.png" alt="Ícone da LOL">
                <img class="nome" src="images/logo-nome.png" alt="Lavanderia On-Line" title="Lavanderia On-Line">
            </div>
            
        </header>
            
        <div class="content">

            <P class="titulo">Digite aqui o número <br> do seu pedido!</P>
           
        <div class="container mt-3">
            
      <div class="input-group">
  <input type="search" class="form-control rounded" placeholder="Ex: #921999" aria-label="Search" aria-describedby="search-addon" />
  <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#myModal">Pesquisar</button>
</div> 

<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h3 class="modal-title">Pedido #1234</h3>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
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
                <td>$7.99</td>
                <td>$24.98</td>
                <td>3 dias</td>
                <td>Aguardando retirada</td>
                </tr>
                <tr>
                <td>Tênis</td>
                <td>$16.99</td>
                <td>$24.98</td>
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
                <h2>Ainda não fez um pedido? Veja os principais motivos <br> para pedir com a gente!</h2>

                <div class="section">

                    <div class="single">

                        <div><img src="images/entregador.png" alt="Entregador"></div>
                        <div class="text-single">
                            <h3>Busca e leva!</h3>
                            <p>Ao realizar o seu pedido, nós enviamos um motoboy até você, ele vai recolher as roupas e no fim do processo
                                levar até você no conforto da sua casa!</p>	
                        </div>
                    </div>

                    <div class="single">
                        <div><img src="images/wash.png" alt="Máquina de lavar"></div>
                        <div class="text-single">
                            <h3>Qualidade!</h3>
                            <p>Nossa empresa trabalha apenas com as melhores máquinas com a melhor da tecnologia
                                disponível no mercado, nós garantimos a sua satisfação!</p>	
                        </div>
                    </div>

                    <div class="single">
                        <div><img src="images/desconto.png" alt="Desconto"></div>
                        <div class="text-single">
                            <h3>Preço justo!</h3>
                            <p>Antes de realizar seu pedido você vai 
                                recebe o orçamento de maneira instantânea por um preço justo e que cabe no seu bolso!</p>	
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
              
      <footer id="footerzera" class="bg-light text-center text-white">
  <!-- Grid container -->
  <div class="container p-4 pb-0">
    <!-- Section: Social media -->
    <section class="mb-4">
      <!-- Facebook -->
      <a
        class="btn btn-primary btn-floating m-1"
        style="background-color: #3b5998;"
        href="#!"
        role="button"
        ><i class="fab fa-facebook-f"></i
      ></a>

      <!-- Twitter -->
      <a
        class="btn btn-primary btn-floating m-1"
        style="background-color: #55acee;"
        href="#!"
        role="button"
        ><i class="fab fa-twitter"></i
      ></a>

      <!-- Google -->
      <a
        class="btn btn-primary btn-floating m-1"
        style="background-color: #dd4b39;"
        href="#!"
        role="button"
        ><i class="fab fa-google"></i
      ></a>

      <!-- Instagram -->
      <a
        class="btn btn-primary btn-floating m-1"
        style="background-color: #ac2bac;"
        href="#!"
        role="button"
        ><i class="fab fa-instagram"></i
      ></a>

      <!-- Linkedin -->
      <a
        class="btn btn-primary btn-floating m-1"
        style="background-color: #0082ca;"
        href="#!"
        role="button"
        ><i class="fab fa-linkedin-in"></i
      ></a>
      <!-- Github -->
      <a
        class="btn btn-primary btn-floating m-1"
        style="background-color: #333333;"
        href="https://github.com/gianluca-magnabosco/LOL-Lavanderia-Online/"
        target="_blank"
        role="button"
        ><i class="fab fa-github"></i
      ></a>
    </section>
    <!-- Section: Social media -->
  </div>
  <!-- Grid container -->

  <!-- Copyright -->
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
    © 2022 Copyright:
    <a class="text-white" href="#">LOL - Lavanderia On-line</a>
  </div>
  <!-- Copyright -->
</footer>       
              
    </body>
</html>
