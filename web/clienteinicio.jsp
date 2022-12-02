<%-- 
    Document   : clienteinicio
    Created on : 16 de nov. de 2022, 21:33:43
    Author     : gfbat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Área do Cliente</title>
        <link rel="stylesheet" type="text/css" href="css/clienteinicio.css">
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
             >
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js">      
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
                    <li><a class="menu__item" href="consultarpedido.jsp">Consulte seu pedido</a></li>
                    <a class="menu__item" href="realizarpedido.jsp"><button id="btn-pedido" class="btn btn-lg">Fazer um pedido</button></a>
                    <a href="logout"><button id="botao-logout" class="btn btn-danger btn-lg">Logout</button></a>

                </ul>
            </div>  
            <div class="images-header">
                <img class="icone" src="images/logo-icone.png" alt="Ícone da LOL">
                <img class="nome" src="images/logo-nome.png" alt="Lavanderia On-Line" title="Lavanderia On-Line">
            </div>
         
        </header>
        <div class="content">

        <div class="jumbotron">
            <h1 class="display-4">Faça agora mesmo o seu pedido!</h1>
            <a href="realizarpedido.jsp"><button id="botao-sucesso" class="btn btn-success btn-lg" role="button">Realizar pedido!</button></a>
        </div>
        <hr class="gradient">
        <h3 class="pedidos-aberto">Pedidos em aberto:</h3>

    <div class="container mt-5">
        <div class="d-flex justify-content-center row">
            <div class="col-md-10">
                <div class="rounded">
                    <div class="table-responsive table-borderless">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th class="text-center">
                                            <div class="inner-circle"></div>
                                        </div>
                                    </th>
                                    <th>Pedido #</th>
                                    <th>Status</th>
                                    <th>Total</th>
                                    <th>Feito em</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody class="table-body">
                                <tr class="cell-1">
                                    <td class="text-center">
                                            <a href="logout"><button class="btn btn-danger btn-sm">Cancelar</button></a>
                                            <div class="inner-circle"></div>
                                        </div>
                                    </td>
                                    <td>#SO-13487</td>
                                    <td><span class="badge badge-danger">Aguardando retirada</span></td>
                                    <td>$200.00</td>
                                    <td>Hoje, 13:40</td>
                                    <td><i class="fa fa-ellipsis-h text-black-50"></i></td>
                                </tr>
                                <tr class="cell-1">
                                    <td class="text-center">
                                           <a href="logout"><button class="btn btn-danger btn-sm">Cancelar</button></a>
                                            <div class="inner-circle"></div>
                                        </div>
                                    </td>
                                    <td>#SO-13453</td>
                                    <td><span class="badge badge-danger">Aguardando retirada</span></td>
                                    <td>$255.50</td>
                                    <td>Ontem, 17:59</td>
                                    <td><i class="fa fa-ellipsis-h text-black-50"></i></td>
                                </tr>
                                <tr class="cell-1">
                                    <td class="text-center">
                                            <div class="inner-circle"></div>
                                        </div>
                                    </td>
                                    <td>#SO-13498</td>
                                    <td><span class="badge badge-warning">Roupas na lavanderia</span></td>
                                    <td>$57.10</td>
                                    <td>16/11/2022, 15:42</td>
                                    <td><i class="fa fa-ellipsis-h text-black-50"></i></td>
                                </tr>
                                <tr class="cell-1">
                                    <td class="text-center">
                                            <div class="inner-circle"></div>
                                        </div>
                                    </td>
                                    <td>#SO-16499</td>
                                    <td><span class="badge badge-info">Em processo de entrega</span></td>
                                    <td>$560.79</td>
                                    <td>17/11/2022, 20:45</td>
                                    <td><i class="fa fa-ellipsis-h text-black-50"></i></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
        
   

        <div class="clear"></div>
        
        <br>
        
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
<!-- #9EE8F0, #55DEED, #43AEBA, #486A6E -->
<!-- #2548B0,#0088F0,#77C3FF, #2FED2F, #4DFF52 -->
