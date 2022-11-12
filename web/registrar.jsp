<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <title>Cadastro</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
    <link rel="stylesheet" href="css/bulma.min.css" />
    <link rel="stylesheet" type="text/css" href="css/registrar.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/check_form.js"></script>
    <script type="text/javascript"> 
        function mascara(i){
            var v = i.value;
            if(isNaN(v[v.length-1])){
                i.value = v.substring(0, v.length-1);
                return;
            }
            
            i.setAttribute("maxlength", "14");
            if (v.length === 3 || v.length === 7) i.value += ".";
            if (v.length === 11) i.value += "-";
            
        }
    </script>
    <script type="text/javascript"> 
        function mascara2(i){
            var v = i.value;
            if(isNaN(v[v.length-1])){
                i.value = v.substring(0, v.length-1);
                return;
            }
            
            i.setAttribute("maxlength", "14");
            if (v.length === 9) i.value += "-";
            if (v.length === 3) i.value += ")";
            
        }
    </script>
    <script type="text/javascript"> 
        function mascara3(i){
            var v = i.value;
            if(isNaN(v[v.length-1])){
                i.value = v.substring(0, v.length-1);
                return;
            }
            
            i.setAttribute("maxlength", "9");
            if (v.length === 5) i.value += "-";
            if (v.length === 9) endereco();

            
        }
    </script>
    <script>
     function myFunction() {
       if ($("input[name='telefone']").val() === '' || $("input[name='telefone']").val() === null){
          $("input[name='telefone']").val("(");
           
           
       }
       
    }
</script>

<script type="text/javascript"> 
   function endereco() {
       
   
    
    var cep = document.getElementById("cep");
    var url = "http://viacep.com.br/ws/" + cep.value + "/json/";
    
    var logradouro = document.getElementById("logradouro");
    var bairro = document.getElementById("bairro");
    var localidade = document.getElementById("localidade");
    var uf = document.getElementById("uf");
    
    fetch(url, {method: 'GET'})
            .then(response => {
                response.json()
                 .then(data => {
                     logradouro.value = data.logradouro;
                     bairro.value = data.bairro;
                     uf.value = data.uf;
                     localidade.value = data.localidade;

                     

                    });
                
           })
                   .catch(err => {
                      logradouro.value = "";
                      bairro.value = "";
                      localidade.value = "";
                      uf.value = "";
                      //alert("CEP inexistente"); <-- Esse alert foi pra testar se tava indo e tava, alert é um negocio mto feio pqp
                   

                   
                   
                 
           });
                   
   }
    
    
    

</script> 

<script type="text/javascript">
    
    function erroCEP(){ //tentei fazer pegando o "error" = "true" que tava no site usando getElement na funcao de cima ali porem nao deu certo, esse é o unico jeito q achei pra verificar se ta undefined
        var erroLogradouro = document.getElementById("logradouro").value;       
        if (erroLogradouro === "undefined") {
            return;
   
        }
        
    }
    


</script>
   
  </head>
  <script
   src="https://code.jquery.com/jquery-3.4.1.min.js"
   integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
   crossorigin="anonymous"></script>
  <script type="text/javascript"
    src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
  <body>
    <section class="hero is-sucess is-fullheight">
      <div class="hero-body">
        <div class="container has-text-centered">
          <div class="column is-4 is-offset-4">
              <div class="notification is-danger">
                <p>Cadastre-se</p>
              </div>
              <div class="box">
                <form method="post" id="registerForm">
                  <div class="field">
                    <div class="control">
                      <input oninput="mascara(this)" type="text" class="input is-large" placeholder="CPF" name="cpf"><br><br> 
                      <input type="text" name="nome" class="input is-large"  placeholder="Nome"/><br><br>
                      <input type="email" name="email" class="input is-large" placeholder="E-mail" autofocus=""><br><br>
                      <input oninput="mascara2(this)" onfocus="myFunction()" type="text" class="input is-large" placeholder="Telefone" name="telefone"><br><br>
                      <input oninput="mascara3(this)" type="text" class="input is-large" placeholder="CEP" name="cep" id="cep">
                    </div>
                  </div>                  
                      
                    <div class="field-group">
                        <div class="field is-inline-block-desktop">
                            <div class="control">
                                <input class="input" type="text" placeholder="Rua" name="logradouro" id="logradouro" disabled> 
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
                            <input class="input" type="text" placeholder="Estado" name="uf" id="uf" disabled> 
                            </div>
                        </div>
                        
                    
                    <div class="field is-inline-block-desktop">
                        <div class="control">
                            <input class="input" type="text" placeholder="Bairro" name="bairro" id="bairro" disabled>
                        </div>
                    </div>
                    </div>
                    
                    <div class="field-group">
                        <div class="field is-inline-block-desktop">
                            <div class="control">
                            <input class="input" type="text" placeholder="Cidade" id="localidade" name="localidade" disabled> 
                            </div>
                        </div>
                        
                    
                    <div class="field is-inline-block-desktop">
                        <div class="control">
                            <input class="input" type="text" placeholder="Complemento" id="complemento" name="complemento">
                        </div>
                    </div>
                    </div>
                    
                    <button type="submit" class="button is-block is-link is-large is-fullwidth">Registrar</button><br>
                    <a href="login.jsp">Voltar à tela de login</a>
                    
                </form>
              </div>
            </div>
          </div>
        </div>
      </section>
  </body>
  <script type="text/javascript">
 
    $(document).ready(function() {
        $("#registerForm").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                },
         
                cpf: "required",
                nome: "required",
                cep: "required",
                telefone: "required"
                
            },
             
            messages: {
                email: {
                    required: "Por favor insira um email",
                    email: "Por favor insira um email válido"
                },
                 
                cpf: "Por favor insira um CPF",
                nome: "Por favor insira um Nome",
                cep: "Por favor insira um CEP",
                telefone: "Por favor insira um Telefone"
                    
            }
        });
 
    });
 </script>
</html>