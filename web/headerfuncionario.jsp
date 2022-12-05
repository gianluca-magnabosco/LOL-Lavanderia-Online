<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header class="header">
    <div class="hamburger-menu">
        <input id="menu__toggle" type="checkbox" />
        <label class="menu__btn" for="menu__toggle">
            <span></span>
        </label>

        <ul class="menu__box">
            <li><a class="menu__item" href="funcionarioinicio.jsp">Home</a></li>
            <li><a class="menu__item" href="#">Visualizar Pedidos</a></li>
            <li><a class="menu__item" href="relatorios.jsp">Relatórios</a></li>
            <li><a class="menu__item" href="cadastrarroupa.jsp">Manutenção de Roupa</a></li>
            <li><a class="menu__item" href="#">Manutenção de Funcionários</a></li>
            <a href="logout"><button id="botao-logout" class="btn btn-danger btn-lg" style="margin-top: 130%">Logout</button></a>
        </ul>
    </div>  
    
    <div class="images-header">
        <img class="icone" src="images/logo-icone.png" alt="Ícone da LOL">
        <img class="nome" src="images/logo-nome.png" alt="Lavanderia On-Line" title="Lavanderia On-Line">
    </div>

</header>