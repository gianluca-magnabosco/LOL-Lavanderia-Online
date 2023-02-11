<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>LOL - Lavanderia On-line</title>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link rel="stylesheet" type="text/css" href="<c:url value='css/landing.css'/>">
        <link rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
            crossorigin="anonymous"
        >
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous">
        </script>
    </head> 
    
    <body>
        <div class="header">
            <div class="center">
                <img class="icone" src="<c:url value='images/logo-icone.png'/>" alt="Ícone da LOL">
                <img class="nome" src="<c:url value='images/logo-nome.png'/>" alt="Lavanderia On-Line" title="Lavanderia On-Line">
            </div>
        </div>

        <div class="container-banner" id="container-banner">
            <div class="center"></div>
            <div class="fakeform">
                <h2>Faça o seu login:</h2>
                <a href="<c:url value='/login'/>">
                    <button type="button" class="btn btn-info btn-lg">Login!</button>
                </a>
                <h2>Faça o seu cadastro:</h2>
                <a href="<c:url value='/registrar'/>">
                    <button type="button" class="btn btn-info btn-lg">Cadastro!</button>
                </a>
            </div>
        </div>	

        <div class="container2">
            <div class="center">
                <h2 class="boldasso">Um novo jeito de lavar suas roupas!</h2>
                <p>
                    A LOL cuida das suas roupas com aquele carinho de mãe sem você precisar pagar a mais por isso, 
                    juntando a qualidade com inovação para fornecer um serviço que ninguém faz igual! Qual o
                    motivo de sair da sua casa ou pior: lavar própria roupa quando de maneira fácil, rápida e prática
                    você pode fazer isso sem sair do seu conforto! A LOL busca e entrega suas roupas diretamente em sua casa, vem com a LOL!
                </p>
            </div>

            <div class="arrow"></div>
        </div>

        <div class="section1">
            <div class="center">
                <h2>Inovação + Facilidade</h2>

                <div class="section">
                    <div class="single">
                        <div>
                            <img src="<c:url value='images/entregador.png'/>" alt="Entregador">
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
                            <img src="<c:url value='images/wash.png'/>" alt="Máquina de lavar">
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
                            <img src="<c:url value='images/desconto.png'/>" alt="Desconto">
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
            
        <footer id="footerzera" class="bg-light text-center text-white">
            <div class="container p-4 pb-0">

                <section class="mb-4">
                    <a class="btn btn-primary btn-floating m-1" style="background-color: #3b5998;" href="#" role="button">
                        <i class="fab fa-facebook-f"></i>
                    </a>

                    <a class="btn btn-primary btn-floating m-1" style="background-color: #55acee;" href="#" role="button">
                        <i class="fab fa-twitter"></i>
                    </a>

                    <a class="btn btn-primary btn-floating m-1" style="background-color: #ac2bac;" href="#" role="button">
                        <i class="fab fa-instagram"></i>
                    </a>

                    <a class="btn btn-primary btn-floating m-1" style="background-color: #0082ca;" href="#" role="button">
                        <i class="fab fa-linkedin-in"></i>
                    </a>

                    <a class="btn btn-primary btn-floating m-1" style="background-color: #333333;" href="https://github.com/gianluca-magnabosco/LOL-Lavanderia-Online/" target="_blank" role="button">
                        <i class="fab fa-github"></i>
                    </a>
                </section>
            </div>

            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                © 2023 Copyright:
                <a class="text-white" href="<c:url value='/index'/>">LOL - Lavanderia On-line</a>
                <br/>
                <p>
                    Em caso de problemas contactar o administrador: <a href="mailto:${configuracao.email}">${configuracao.email}</a>
                </p>
            </div>
        </footer>
        
        <script>
            <c:import url='js/landingPage.js'/>
        </script>

    </body>
</html>
