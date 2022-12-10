<%-- 
    Document   : roupaConfirmadaPopup
    Created on : 9 de dez. de 2022, 22:37:27
    Author     : penna
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="css/pedidoconfirmadopopup.css">
<div id="overlay" class="roupaOverlay">
    <div id="content">
        <center id="centertext">
            <img id="close" src="images/icons8-close-28.png"/>
            <h2>Roupa cadastrada com sucesso!</h2>
            <img id="checkmark" src="images/icons8-done.gif" alt="Roupa Confirmada"/>
            <div id="bottomtext">
                <p><button class="btn botao acknowledge" id="numeropedido">OK</button></p>
            </div>
        </center>
    </div>
</div>

<script type="text/javascript" src="js/roupaConfirmadaPopup.js"></script>
