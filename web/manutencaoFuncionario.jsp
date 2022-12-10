<%-- 
    Document   : manutencaoFuncionario
    Created on : 09 de dez. de 2022, 21:02:12
    Author     : gealb
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Área do Funcionario</title>
        <link rel="stylesheet" type="text/css" href="css/funcionarioinicio.css">
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
             >
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js">      
    </head>
    
    <body>
        <%@ include file="headerfuncionario.jsp" %>
        
        <div class="content">

            <h3 class="pedidos-aberto">Manutenção de funcionário</h3>

            <div class="container mt-5">
                <div class="d-flex justify-content-center row">
                    <div class="col-md-10">
      
                                 <div class="container">
                            <form class="border rounded p-3">
                                <h4>Cadastrar novo Funcionário</h4>
                                <div class="mb-2">
                                    <label for="nomeFuncionario" class="form-label">Nome Completo</label>
                                    <input type="text" class="form-control" placeholder="Insira o nome" id="nomeFuncionario">
                                </div>

                                <label for="emailFuncionario" class="form-label">E-mail de login;</label>
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
                                        <button class="btn btn-danger btn-lg">Cancelar</button>
                                        <button class="btn btn-success btn-lg" type="submit">Cadastrar</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                              
                        
                        <h3 class="pedidos-aberto">Funcionários já cadastrados:</h3>
                           <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Nome</th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody class="table-body">
                                        <tr class="cell-1">
                                            <td>Geovanna Alberti Correia de Freitas</td>
                                            <td class="text-center">
                                                <a href="#"><button class="btn btn-danger btn-sm">Excluir</button></a> 
                                                <a href="consultarFuncionario.jsp"><button class="btn btn-info btn-sm">Consultar</button></a><br>
                                                <div class="inner-circle"></div>
                                            <td><i class="text-black-50"></i></td>
                                        </tr>

                                    </tbody>
                                </table>      
                                
                                
                                
                                
                            </div>
                        </div>
                    </div>
        
           
        
            <div class="clear"></div>

            <br/>
        
        </div>
        
        <%@ include file="footer.jsp" %>
        
    </body>
</html>