<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="header" style="z-index: 1;">
    <div class="hamburger-menu">
        <input id="menu__toggle" type="checkbox" />
        <label class="menu__btn" for="menu__toggle">
            <span></span>
        </label>

        <ul class="menu__box">
            <li><a class="menu__item" href="pedido?action=inicio">Home</a></li>
            <li><a class="menu__item" href="pedido?action=listar">Visualizar Pedidos</a></li>
            <li><a class="menu__item" href="relatorios.jsp">Relatórios</a></li>
            <li><a class="menu__item" href="cadastrarRoupa.jsp">Cadastrar Roupas</a></li>
            <li><a class="menu__item" href="listarRoupa.jsp">Lista de Roupas</a></li>
            <li><a class="menu__item" href="cadastrarFuncionario.jsp">Cadastro de Funcionários</a></li>
            <li><a class="menu__item" href="listarFuncionario.jsp">Lista de Funcionários</a></li>
            <a href="logout"><button id="botao-logout" class="btn btn-danger btn-lg" style="margin-top: 130%">Logout</button></a>
        </ul>
    </div>  
    
    <div class="images-header">
        <img class="icone" src="<c:url value='/images/logo-icone.png'/>" alt="Ícone da LOL">
        <img class="nome" src="<c:url value='/images/logo-nome.png'/>" alt="Lavanderia On-Line" title="Lavanderia On-Line">
    </div>

</header>