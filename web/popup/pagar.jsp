<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/pagarpopup.css'/>">
<div id="overlay" class="pagarOverlay" style="display: none;">
    <div id="content">
        <center id="centertext">
            <img id="close" src="<c:url value='/images/icons8-close-28.png'/>"/>
            <h2>Pagamento</h2>
            <div id="bottomtext">
                <form class="checkout">
                    <div class="checkout-header"></div>
                    <p>
                        <input type="text" class="checkout-input checkout-name" placeholder="Nome" autofocus>
                        <input type="text" class="checkout-input checkout-exp" placeholder="MM/YY">
                    </p>
                    <p>
                        <input type="text" class="checkout-input checkout-card" placeholder="Número do cartão">
                        <input type="text" class="checkout-input checkout-cvc" placeholder="CVC">
                    </p>
                    <p>
                        <input type="button" value="Pagar" class="checkout-btn pagar pagamento">
                    </p>
                </form>                 
            </div>
        </center>
    </div>
</div>

<script type="text/javascript" src="<c:url value='/js/pagarPopup.js'/>"></script>