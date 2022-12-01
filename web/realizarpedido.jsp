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
        <title>Realizar Pedido</title>
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
            <div class="control">
            </div>
            <div class="control">
              </button>
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
                            <input type="checkbox" id="check">
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
                            <div class="fw-600">$20.99</div>
                            </div>
                        </td>
                        <td class="d-">
                            <input class="input" type="text" placeholder="2">
                        </td>
                        <td>
                            <div class="alinhamento">
                            <div class="fw-600">3 dias</div>
                            </div>
                        </td>
                        <td>
                            <div class="alinhamento">
                            <div class="fw-600">A calcular</div>
                            </div>
                        </td>
                    </tr>
                    <tr class="align-middle alert border-bottom" role="alert">
                        <td>
                            <input type="checkbox" id="check">
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
                            <div class="fw-600">$16.99</div>
                            </div>
                        </td>
                        <td class="d-">
                            <input class="input" type="text" placeholder="2">
                        </td>
                        <td>
                            <div class="alinhamento">
                            <div class="fw-600">2 dias</div>
                            </div>
                        </td>
                        <td>
                            <div class="alinhamento">
                            <div class="fw-600">A calcular</div>
                            </div>
                        </td>
                    </tr>
                    <tr class="align-middle alert border-bottom" role="alert">
                        <td>
                            <input type="checkbox" id="check">
                        </td>
                        <td class="text-center">
                            <img class="pic"
                                src="images/item-3.png"
                                alt="">
                        </td>
                        <td>
                            <div class="alinhamento">
                                <p class="m-0 fw-bold">Calça</p>
                                <p class="m-0 text-muted">Calças jeans</p>
                            </div>
                        </td>
                        <td>
                            <div class="alinhamento">
                            <div class="fw-600">$10.99</div>
                            </div>
                        </td>
                        <td class="d-">
                            <input class="input" type="text" placeholder="2">
                        </td>
                        <td>
                            <div class="alinhamento">
                            <div class="fw-600">1 dia</div>
                            </div>
                        </td>
                        <td>
                            <div class="alinhamento">
                            <div class="fw-600">A calcular</div>
                            </div>
                        </td>
                    </tr>
                    <tr class="align-middle alert border-bottom" role="alert">
                        <td>
                            <input type="checkbox" id="check">
                        </td>
                        <td class="text-center">
                            <img class="pic"
                                src="images/item-4.png"
                                alt="">
                        </td>
                        <td>
                            <div class="alinhamento">
                                <p class="m-0 fw-bold">Camiseta</p>
                                <p class="m-0 text-muted">Camisetas comuns</p>
                            </div>
                        </td>
                        <td>
                            <div class="alinhamento">
                            <div class="fw-600">$6.99</div>
                            </div>
                        </td>
                        <td>
                            <input class="input" type="text" placeholder="2">
                        </td>
                        <td>
                            <div class="alinhamento">
                            <div class="fw-600">1 dias</div>
                            </div>
                        </td>
                        <td>
                            <div class="alinhamento">
                            <div class="fw-600">A calcular</div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
          
        <div class="resultado">
            <h1 class="display-3">Seu pedido deu um total de: R$ </h1>
        </div>
          
          <div class="field is-grouped justify-content-center"">
            <div class="control">
              <button class="btn btn-danger btn-lg">Recusar</button>
            </div>
            <div class="control">
              <button class="btn btn-success btn-lg" type="submit">Aceitar</button>
            </div>
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