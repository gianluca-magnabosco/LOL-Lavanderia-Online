<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="../css/cancelarpopup.css">
<div id="overlay" class="cancelarOverlay">
    <div id="content">
        <center id="centertext">
            <img id="close" src="../images/icons8-close-28.png"/>
            <h2>Tem certeza que deseja cancelar?</h2>
            <div id="bottomtext">
                <img id="checkmark" src="../images/cancelar.gif" alt="Pedido confirmado"/>
                <p><button class="btn btn-success btn-sm botao confirmar" id="numeropedido">Sim</button></p>
                <p><button class="btn btn-danger btn-sm botao cancelar" id="numeropedido" type="button">Voltar</button></p>
                <script>
                    <c:if test"${not empty param.id}>
                        $(".confirmar").on("click", () => {
                            location.href="<c:url value='/pedido?action=cancelar$id=${pedido.id}'/>";
                        });
                    </c:if>
                </script>
            </div>
        </center>
    </div>
</div>

<script type="text/javascript" src="../js/cancelarPopup.js"></script>