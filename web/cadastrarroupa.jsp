<%-- 
    Document   : cadastraroupa
    Created on : 30 de dez. de 2022, 20:12:31
    Author     : penna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cadastrar Peça de Roupa</title>
        <link rel="stylesheet" type="text/css" href="css/realizarpedido.css">
        <link rel="stylesheet" href="css/bulma.min.css" />
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
        <hr class="gradient">

<div id="app">
  <div class="section">
    <div class="container">
      <div class="media is-pulled-right">
        <div class="media-content">
          <div class="field is-grouped">
            <div class="control">
            </div>
            <div class="control">
              </button>
            </div>
          </div>
        </div>
      </div>
        
      <div class="container">
        <form class="border rounded p-3">
            
            <div class="mb-2">
              <label for="nomeRoupa" class="form-label">Nome da Roupa</label>
              <input type="text" class="form-control" id="nomeRoupa">
            </div>
            
            <label for="precoRoupa" class="form-label">Preço</label>
            <div class="input-group mb-3">
              <span class="input-group-text" id="basic-addon3">R$</span>
              <input type="number" class="form-control" id="precoRoupa" aria-describedby="basic-addon3">
            </div>

            <div class="mb-2">
              <label for="prazoRoupa" class="form-label">Prazo de Entrega Estimado</label>
              <input type="number" class="form-control" id="prazoRoupa">
            </div>
            
            <div class="mb-2">
              <label for="fotoRoupa" class="form-label">Foto</label>
              <input type="file" class="form-control p-1" id="fotoRoupa">
            </div>
            
            <div class="field is-grouped justify-content-center""> 
            <div class="control">
              <button class="btn btn-danger btn-lg">Cancelar</button>
            </div>
            <div class="control">
              <button class="btn btn-success btn-lg" type="submit">Cadastrar</button>
            </div>
                
          </div>
        </form>
    </div>
        </div>
      </form>
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
<!-- #9EE8F0, #55DEED, #43AEBA, #486A6E -->
<!-- #2548B0,#0088F0,#77C3FF, #2FED2F, #4DFF52 -->