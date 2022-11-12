<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!--tela de login-->
<% 
    if (session.getAttribute("user") != null) {
        response.sendRedirect("home.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sistema de Login</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
    <link rel="stylesheet" href="css/bulma.min.css" />
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<script type="text/javascript"
    src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
<body>
    <section class="hero is-success is-fullheight">
        <div class="hero-body">
            <div class="container has-text-centered">
                <div class="column is-4 is-offset-4">
                    <h3 class="title has-text-grey">Sistema de Login</h3>
                    <div class="box">
                        <form action="login" method="post" id="loginForm">
                            <div class="field">
                                <div class="control">
                                    <label for="email">Email:</label>
                                    <input type="email" name="email" class="input is-large" placeholder="Seu e-mail" autofocus="">
                                </div>
                            </div>
                            <div class="field">
                                <div class="control">
                                    <label for="password">Password:</label>
                                    <input name="password" class="input is-large" type="password" placeholder="Sua senha">
                                </div>
                            </div>
                            <button type="submit" value="Submit" class="button is-block is-link is-large is-fullwidth">Entrar</button><br/>
                            <b class='inputError'>${message}</b><br/>
                            <a href="registrar.jsp">Não possui uma conta ainda? Registre-se</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
<script type="text/javascript">
 
    $(document).ready(function() {
        $("#loginForm").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                },
         
                password: "required"
            },
             
            messages: {
                email: {
                    required: "<b class='inputError'>Por favor insira um email</b>",
                    email: "<b class='inputError'>Por favor insira um email válido</b>"
                },
                 
                password: "<b class='inputError'>Por favor insira uma senha</b>"
            }
        });
 
    });
</script>
</html>