<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
        <link rel="stylesheet" href="<c:url value='/css/bulma.min.css'/>"/>
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous">
        </script>
        <script type="text/javascript"
            src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js">
        </script>
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/registrar.css'/>">
        <script type="text/javascript" src="<c:url value='/js/registrar.js'/>"></script>
    </head>
    
    
    <body>
        
        <c:if test="${not empty sessionScope.login}">
            <c:redirect url="pedido?action=inicio"/>
        </c:if>
        
        <section class="hero is-sucess is-fullheight">
            <div class="hero-body">
                <div class="container has-text-centered">
                    <div class="column is-4 is-offset-4">
                        <div class="notification is-info">
                            <p>Cadastre-se</p>
                        </div>
                        <div class="box">
                            <form action="<c:url value='/registrar'/>" method="post" id="registerForm">
                                <div class="field">
                                    <div class="control">
                                        <input type="text" name="nome" class="input is-large" placeholder="Nome" autofocus/><br/><br/>
                                        <input oninput="cpfMask(this)" type="text" class="input is-large" placeholder="CPF" name="cpf"><br/><br/> 
                                        <input type="email" name="email" class="input is-large" placeholder="E-mail"><br/><br/>
                                        <input oninput="phoneNumberMask(this)" type="text" class="input is-large" placeholder="Telefone" name="telefone"><br/><br/>
                                        <input oninput="cepMask(this)" type="text" class="input is-large" placeholder="CEP" name="cep" id="cep">
                                    </div>
                                </div>                  

                                <div class="field-group">
                                    <div class="field is-inline-block-desktop">
                                        <div class="control">
                                            <input class="input" type="text" placeholder="Rua" name="logradouro" id="logradouro"> 
                                        </div>
                                    </div>

                                    <div class="field is-inline-block-desktop">
                                        <div class="control">
                                            <input class="input" type="text" placeholder="Número" name="numero" id="numero">
                                        </div>
                                    </div>
                                </div> 

                                <div class="field-group">
                                    <div class="field is-inline-block-desktop">
                                        <div class="control">
                                            <input class="input" type="text" placeholder="Cidade" id="localidade" name="localidade" readonly> 
                                        </div>
                                    </div>


                                    <div class="field is-inline-block-desktop">
                                        <div class="control">
                                            <input class="input" type="text" placeholder="Estado" name="uf" id="uf" readonly> 
                                        </div>
                                    </div>
                                </div>

                                <div class="field-group">
                                    <div class="field is-inline-block-desktop">
                                        <div class="control">
                                            <input class="input" type="text" placeholder="Bairro" name="bairro" id="bairro">
                                        </div>
                                    </div>


                                    <div class="field is-inline-block-desktop">
                                        <div class="control">
                                            <input class="input" type="text" placeholder="Complemento" id="complemento" name="complemento">
                                        </div>
                                    </div>
                                </div>
                                <br/>
                                <button type="submit" class="button is-block is-link is-large is-fullwidth">Registrar</button><br/>
                                
                                <b style="color: red"><c:out value="${param.message}"/></b><br/>

                                Já possui uma conta? <a href="<c:url value='/login'/>">Faça login</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
  
    <script>
        <c:import url='/js/registrarValidacao.js'/>
    </script>

</html>