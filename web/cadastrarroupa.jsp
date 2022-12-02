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
        <%@ include file="headerfuncionario.jsp" %>
        
        <div class="content">
            <hr class="gradient">

            <div id="app">
                <div class="section">
                    <div class="container">
                        <div class="media is-pulled-right">
                            <div class="media-content">
                                <div class="field is-grouped">
                                    <div class="control"></div>
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
                </div>
            </div>
        </div>
        
        <%@ include file="footer.jsp" %>
  
    </body>
</html>