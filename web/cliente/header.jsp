<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="header" style="z-index: 1;">
    <div class="hamburger-menu">
        <input id="menu__toggle" type="checkbox" />
        <label class="menu__btn" for="menu__toggle">
            <span></span>
        </label>

        <ul class="menu__box">
            <li><a class="menu__item" href="<c:url value='/pedido?action=inicio'/>">Home</a></li>
            <li><a class="menu__item" href="<c:url value='/pedido?action=listar'/>">Visualizar Pedidos</a></li>
            <li><a class="menu__item" href="<c:url value='/pedido?action=pesquisar'/>">Consulte seu Pedido</a></li>
            <a class="menu__item" href="<c:url value='/pedido?action=formPedido'/>"><button id="btn-pedido" class="btn btn-lg">Fazer um Pedido</button></a>
            <a href="<c:url value='/logout'/>"><button id="botao-logout" class="btn btn-danger btn-lg">Logout</button></a>
        </ul>
    </div>  
    <div class="images-header">
        <img class="icone" src="<c:url value='/images/logo-icone.png'/>" alt="Ícone da LOL">
        <img class="nome" src="<c:url value='/images/logo-nome.png'/>" alt="Lavanderia On-Line" title="Lavanderia On-Line">
    </div>
</header>