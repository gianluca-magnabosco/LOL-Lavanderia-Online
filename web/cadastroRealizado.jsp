<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cadastro realizado com sucesso!</title>
        <link rel="stylesheet" type="text/css" href="css/cadastrorealizado.css">
    </head>

    <body>
        <center id="maincenter">
            <div id="maindiv">
                <table id="maintable" align="center" cellpadding="0">
                    <tbody>
                        
                        <tr>
                            <td align="center" id="logo">
                                <a href="index.html">
                                    <img id="logoimg" alt="Lavanderia On-Line" src="images/logo-icone.png">
                                </a>
                            </td>
                        </tr>

                        <tr>
                            <td id="centerbox">
                                <table id="boxcontent">
                                    <tbody>
                                        <tr>
                                            <td align="center" id="emailsentimg">
                                                <img id="emailimg" alt="Cadastro confirmado" src="images/email-sent.png">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td id="textbox">
                                                <center>
                                                    <p id="toptext">
                                                        Cadastro realizado com sucesso!
                                                    </p>

                                                    <p id="bottomtext">
                                                        Um e-mail com sua senha foi enviado para 
                                                        <% if (request.getParameter("email") != null) { %>
                                                            <jsp:useBean id="e" class="domain.User">
                                                                <jsp:setProperty name="e" property="email"/>
                                                                <b>
                                                                    <jsp:getProperty name="e" property="email"/>
                                                                </b><br/>
                                                            </jsp:useBean>
                                                        <% } %>
                                                        Certifique-se de checar sua pasta de spam.
                                                    </p>
                                                    
                                                    <a href="login.jsp">
                                                        <img id="buttonimg" alt="Fa??a login" src="images/login-button.png">
                                                    </a>
                                                </center>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        
                        <tr>
                            <td style="height: 25px;">
                                <p style="line-height: 25px; padding: 0 0 0 0; margin: 0 0 0 0;">
                                    &nbsp;
                                </p>

                                <p>
                                    &nbsp;
                                </p>
                            </td>
                        </tr>
                        
                        <tr>
                            <td id="pagefooter">
                                <center>
                                    <p id="emailfooter">
                                        Caso tenha alguma d??vida ou problema, envie um e-mail para:
                                        <jsp:useBean id="configuracao" class="beans.ConfigBean" scope="application"/>
                                        <a href="mailto:<jsp:getProperty name="configuracao" property="email"/>" target="_blank">
                                            <jsp:getProperty name="configuracao" property="email"/>
                                        </a>
                                    </p>

                                    <p id="addressfooter">
                                        ?? LOL - Lavanderia Online - <span class="address">Rua dos Bobos, n?? 0???</span>, <span class="address">Curitiba,</span> <span class="address">PR</span>
                                    </p>
                                </center>
                            </td>
                        </tr>
                        
                        <tr>
                            <td height="40">
                                <p style="line-height: 40px; padding: 0 0 0 0; margin: 0 0 0 0;">
                                    &nbsp;
                                </p>

                                <p>
                                    &nbsp;
                                </p>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </center>

    </body>
    
</html>

