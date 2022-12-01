<%-- 
    Document   : relatorios
    Created on : 30 de nov. de 2022, 20:54:52
    Author     : gealb
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Relatórios em PDF</title>
        <link rel="stylesheet" type="text/css" href="css/relatorios.css">
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

 

    <div class="container mt-5">
        
        <h2 class="pedidos-aberto">Área de Geração de Relatórios</h2>
        <h4 class="pedidos-aberto">Clique no relatório que deseja baixar!</h4><br>
        <div class="botoesRelatorio">
          <a href="#"><button id="botao" class="btn btn-info btn-sm">Gerar relatório de receitas em PDF</button></a><br><br>
          <a href="#"><button id="botao" class="btn btn-info btn-sm">Gerar relatório de clientes em PDF</button></a><br><br>
          <a href="#"><button id="botaoS" class="btn btn-info btn-sm">Gerar relatório de clientes fiéis em PDF</button></a><br><br>
          <a href="#"><button id="botao" class="btn btn-info btn-sm">Gerar relatório de pedidos em PDF</button></a><br><br>
        
          <style>
              #botao{
                  padding: 50px 110px 50px 110px;
              }
              #botaoS{
                  padding: 50px 110px 50px 80px;
              }
          </style>
        
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