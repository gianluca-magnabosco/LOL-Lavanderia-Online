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
        <title>Área do Funcionario</title>
        <link rel="stylesheet" type="text/css" href="css/funcionarioinicio.css">
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
                    <li><a class="menu__item" href="funcionarioinicio.jsp">Visualizar Pedidos</a></li>
                    <li><a class="menu__item" href="#">Relatórios</a></li> <%-- nao consegui fazer dropdown com o menu box (sou burro) --%>
                    <li><a class="menu__item" href="#">Manutenção de Roupa</a></li>
                    <li><a class="menu__item" href="#">Manutenção de Funcionários</a></li>
                    <a href="logout"><button id="botao-logout" class="btn btn-danger btn-lg">Logout</button></a>

                </ul>
            </div>  
            <div class="images-header">
                <img class="icone" src="images/logo-icone.png" alt="Ícone da LOL">
                <img class="nome" src="images/logo-nome.png" alt="Lavanderia On-Line" title="Lavanderia On-Line">
            </div>
         
        </header>
        <div class="content">

 
        <h3 class="pedidos-aberto">Pedidos em aberto:</h3>

    <div class="container mt-5">
        <div class="d-flex justify-content-center row">
            <div class="col-md-10">
                <div class="rounded">
                    <div class="table-responsive table-borderless">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Pedido #</th>
                                    <th>Status</th>
                                    <th>Total</th>
                                    <th>Feito em &darr;</th> 
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody class="table-body">
                                <tr class="cell-1">
                                    <td>#SO-13487</td>
                                    <td><span class="badge badge-warning">Em aberto</span></td>
                                    <td>R$200.00</td>
                                    <td>Hoje, 13:40</td>
                                    <td class="text-center">
                                           <a href="#"><button class="btn btn-success btn-sm">Recolher pedido</button></a>
                                            <div class="inner-circle"></div>
                                        </div>
                                    <td><i class="text-black-50"></i></td>
                                </tr>
                                
                                <tr class="cell-1">
                                    <td>#SO-13453</td>
                                    <td><span class="badge badge-warning">Em aberto</span></td>
                                    <td>R$255.50</td>
                                    <td>Ontem, 17:59</td>
                                    <td class="text-center">
                                           <a href="#"><button class="btn btn-success btn-sm">Recolher pedido</button></a>
                                            <div class="inner-circle"></div>
                                        </div>
                                    <td><i class="text-black-50"></i></td>
                                </tr>
                                
                                <tr class="cell-1">
                                    <td>#SO-13412</td>
                                    <td><span class="badge badge-warning">Em aberto</span></td>
                                    <td>R$123.50</td>
                                    <td>29/11/2022, 07:45</td>
                                    <td class="text-center">
                                           <a href="#"><button class="btn btn-success btn-sm">Recolher pedido</button></a>
                                            <div class="inner-circle"></div>
                                        </div>
                                    <td><i class="text-black-50"></i></td>
                                </tr>
                                
                                <tr class="cell-1">
                                    <td>#SO-13409</td>
                                    <td><span class="badge badge-warning">Em aberto</span></td>
                                    <td>R$99.00</td>
                                    <td>28/11/2022, 17:55</td>
                                    <td class="text-center">
                                           <a href="#"><button class="btn btn-success btn-sm">Recolher pedido</button></a>
                                            <div class="inner-circle"></div>
                                        </div>
                                    <td><i class="text-black-50"></i></td>
                                </tr>
                                
                                <tr class="cell-1">
                                    <td>#SO-13405</td>
                                    <td><span class="badge badge-warning">Em aberto</span></td>
                                    <td>R$23.50</td>
                                    <td>28/11/2022, 15:56</td>
                                    <td class="text-center">
                                           <a href="#"><button class="btn btn-success btn-sm">Recolher pedido</button></a>
                                            <div class="inner-circle"></div>
                                        </div>
                                    <td><i class="text-black-50"></i></td>
                                </tr>
                                
                                <tr class="cell-1">
                                    <td>#SO-13401</td>
                                    <td><span class="badge badge-warning">Em aberto</span></td>
                                    <td>R$76.00</td>
                                    <td>27/11/2022, 22:17</td>
                                    <td class="text-center">
                                           <a href="#"><button class="btn btn-success btn-sm">Recolher pedido</button></a>
                                            <div class="inner-circle"></div>
                                        </div>
                                    <td><i class="text-black-50"></i></td>
                                </tr>
                                
                                <tr class="cell-1">
                                    <td>#SO-13399</td>
                                    <td><span class="badge badge-warning">Em aberto</span></td>
                                    <td>R$34.00</td>
                                    <td>27/11/2022, 17:01</td>
                                    <td class="text-center">
                                           <a href="#"><button class="btn btn-success btn-sm">Recolher pedido</button></a>
                                            <div class="inner-circle"></div>
                                        </div>
                                    <td><i class="text-black-50"></i></td>
                                </tr>
                                
                                <tr class="cell-1">
                                    <td>#SO-13381</td>
                                    <td><span class="badge badge-warning">Em aberto</span></td>
                                    <td>R$44.50</td>
                                    <td>27/11/2022, 13:41</td>
                                    <td class="text-center">
                                           <a href="#"><button class="btn btn-success btn-sm">Recolher pedido</button></a>
                                            <div class="inner-circle"></div>
                                        </div>
                                    <td><i class="text-black-50"></i></td>
                                </tr>
                                
                                <tr class="cell-1">
                                    <td>#SO-13355</td>
                                    <td><span class="badge badge-warning">Em aberto</span></td>
                                    <td>R$189.90</td>
                                    <td>26/11/2022, 18:54</td>
                                    <td class="text-center">
                                           <a href="#"><button class="btn btn-success btn-sm">Recolher pedido</button></a>
                                            <div class="inner-circle"></div>
                                        </div>
                                    <td><i class="text-black-50"></i></td>
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