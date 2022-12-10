<%-- 
    Document   : aceitarRoupaPopup
    Created on : 9 de dez. de 2022, 22:31:36
    Author     : penna
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% if (request.getParameter("roupa") != null) { %>
   <%@ include file="roupaConfirmadaPopup.jsp" %>
 <% } %> 
 
<link rel="stylesheet" type="text/css" href="css/cancelarpopup.css">
<div id="overlay">
    <div id="content">
        <center id="centertext">
            <img id="close" src="images/icons8-close-28.png"/>
            <h2>Tem certeza que deseja confirmar?</h2>
            <div id="bottomtext">
                <img id="checkmark" src="images/aceitar.gif" alt="Roupa Cadastrada"/>
                <p><button class="btn btn-success btn-sm" id="numeropedido">Sim</button></p>
                <p><button class="btn btn-danger btn-sm" id="numeropedido" type="button">Voltar</button></p>
            </div>
        </center>
    </div>
</div>
        <script type="text/javascript">
          var buttons = document.getElementsByClassName('btn btn-success btn-sm');
          for(var i=0; i<buttons.length; i++){
              buttons[i].addEventListener("click", function(){ location.href="listarRoupa.jsp?roupa=true"; return;})
                                             }
                                             
            
        </script>
<script type="text/javascript" src="js/popuphandler.js"></script>