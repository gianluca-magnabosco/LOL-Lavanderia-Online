<%-- 
    Document   : consultarFuncionario
    Created on : 9 de dez. de 2022, 21:24:24
    Author     : gealb
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Consultar Funcionario</title>
        <link rel="stylesheet" type="text/css" href="css/consultarpedido.css">
        <link rel="stylesheet" href="css/bulma.min.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    
    <body>
        <%@ include file="headerFuncionario.jsp" %>
            
        <div class="content">
           
            <div class="container mt-3">

                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title">Consultar/Alterar dados do Funcionário</h3>
                            <a href="manutencaoFuncionario.jsp"><button class="btn btn-danger btn-sm">Voltar</button></a>
                        </div>

                        <div class="modal-body">
                            <div class="table-wrap">
                                <table class="table justify-content-center"">
                                    <thead>
                                        <th>Nome Completo</th>
                                        <th>Email</th>
                                        <th>Data de Nascimento</th>
                                    </thead>

                                    <tbody>
                                        <tr>
                                            <td>Geovanna Alberti Correia de Freitas</td>
                                            <td>geovanna.alberti@ufpr.br</td>
                                            <td>20/11/2002</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <form class="border rounded p-3">
                            <h4>Alterar dados</h4>
                            <div class="mb-2">
                                <label for="nomeFuncionario" class="form-label">Nome Completo</label>
                                <input type="text" class="form-control" placeholder="Insira o nome" id="nomeFuncionario">
                            </div>

                            <label for="emailFuncionario" class="form-label">E-mail de login</label>
                            <div class="input-group mb-3"> 
                                <input type="text" placeholder="Insira o e-mail para login" class="form-control" id="emailFuncionario" aria-describedby="basic-addon3">
                            </div>

                            <div class="mb-2">
                                <label for="senhaFuncionario" class="form-label">Senha</label>
                                <input type="password" placeholder="Insira uma senha" class="form-control" id="senhaFuncionario">
                            </div>

                            <div class="mb-2">
                                <label for="nascFuncionario" class="form-label">Data de nascimento</label>
                                <input type="text" placeholder="Insira a data de nascimento" class="form-control p-1" id="nascuncionario">
                            </div>

                            <div class="field is-grouped justify-content-center""> 
                                <div class="control">
                                    <button class="btn btn-success btn-lg" type="submit">Salvar</button>
                                </div>
                            </div>
                        </form>

                    </div>  
                </div>
            </div>    
        </div>
  
        <%@ include file="footer.jsp" %>
              
    </body>
</html>
