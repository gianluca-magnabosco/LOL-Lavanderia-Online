<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="../css/cancelarpopup.css">
<div id="overlay" class="consultarOverlay">
    <div id="content">
        <center id="centertext" style="padding-top: 0px;">
            <img id="close" src="../images/icons8-close-28.png"/>
            <h2>Pedido #LOL-${param.id}</h2>
            <div id="bottomtext">
                <div class="table-wrap border">
                    <table class="table justify-content-center">
                        <thead>
                            <th>Itens</th>
                            <th>Preço Indv.</th>
                            <th>Preço Total</th>
                            <th>Prazo</th>
                            <th>Situação</th>
                        </thead>
                        
                        <tbody>
                            <c:forEach var="pedido" items="${pedido}">
                                <c:if test="${pedido.id == param.id}">
                                    <c:forEach var="item" items="${pedido.itens}">
                                        <tr>
                                            <td>${item.descricao}</td>
                                            <td>R$ ${item.preco}</td>
                                            <td>R$ ${item.preco * pedido.quantidade}</td>
                                            <td>${item.tempo} dias</td>
                                            <td>${pedido.status}</td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>
                    
                    <div class="border">
                        <h5 class="mt-2">Total: R$ ${pedido.orcamento}</h5>
                    </div>
                    <div class="border">
                        <h5 class="mt-2">Prazo: ${pedido.tempo} dias</h5>
                    </div>
                </div>
            </div>
        </center>
    </div>
</div>

<script type="text/javascript" src="../js/consultarPopup.js"></script>
