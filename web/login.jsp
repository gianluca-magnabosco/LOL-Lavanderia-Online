<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
        <link rel="stylesheet" href="<c:url value='/css/bulma.min.css'/>"/>
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/login.css'/>">
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous">
        </script>
        <script type="text/javascript"
            src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js">
        </script>
        <script type="text/javascript" src="<c:url value='/js/login.js'/>"></script>
    </head>
    
    <body>
        
        <c:if test="${not empty sessionScope.login}">
            <c:redirect url="pedido?action=inicio"/>
        </c:if>
        
        <section class="hero is-success is-fullheight">
            <div class="hero-body">
                <div class="container has-text-centered">
                    <div class="column is-4 is-offset-4" style="padding-top: 0px;">
                        <img src="<c:url value='/images/logo-icone.png'/>"/>
                        <h3 class="title has-text-grey">Login</h3>
                        <div class="box">
                            <form action="<c:url value='/login'/>" method="post" id="loginForm">
                                <div class="field">
                                    <div class="control">
                                        <label for="email">Email:</label>
                                        <input type="email" name="email" class="input is-large" placeholder="Seu e-mail" autofocus="">
                                    </div>
                                </div>
                                <div class="field">
                                    <div class="control">
                                        <label for="password">Senha:</label>
                                        <input name="password" class="input is-large" type="password" placeholder="Sua senha">
                                    </div>
                                </div>
                                <button type="submit" value="Submit" class="button is-block is-link is-large is-fullwidth">Entrar</button><br/>
                                
                                <b class="inputError">${param.message}</b><br/>
                                <b class="inputError">${message}</b><br/>
                                
                                Não possui uma conta ainda? <a href="<c:url value='/registrar'/>" style="color: #3273DC;">Registre-se</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
    
    <script type="text/javascript">
        $(document).ready(validateForm());
    </script>
    
</html>