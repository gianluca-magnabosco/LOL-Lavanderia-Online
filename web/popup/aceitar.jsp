<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="../css/cancelarpopup.css">
<div id="overlay" class="aceitarOverlay" style="display: none;">
    <div id="content">
        <center id="centertext">
            <img id="close" src="../images/icons8-close-28.png"/>
            <h2>Tem certeza que deseja confirmar?</h2>
            <div id="bottomtext">
                <img id="checkmark" src="../images/aceitar.gif" alt="Pedido confirmado"/>
                <p><button class="btn btn-success btn-sm botao aceitar" id="numeropedido">Sim</button></p>
                <p><button class="btn btn-danger btn-sm botao voltar" id="numeropedido" type="button">Voltar</button></p>
            </div>
        </center>
    </div>
</div>

<script type="text/javascript" src="../js/aceitarPopup.js"></script>