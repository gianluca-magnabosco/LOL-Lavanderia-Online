<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="css/cancelarpopup.css">
<div id="overlay">
    <div id="content">
        <center id="centertext">
            <img id="close" src="images/icons8-close-28.png"/>
            <h2>Pedido #1234</h2>
            <div id="bottomtext">
                                <div class="table-wrap">
                                    <table class="table justify-content-center"">
                                        <thead>
                                            <th>Itens</th>
                                            <th>Preço Indv.</th>
                                            <th>Preço Total</th>
                                            <th>Prazo</th>
                                            <th>Situação</th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Camisa</td>
                                                <td>R$ 7,99</td>
                                                <td>R$ 24,98</td>
                                                <td>3 dias</td>
                                                <td>Aguardando retirada</td>
                                            </tr>
                                            <tr>
                                                <td>Tênis</td>
                                                <td>R$ 16,99</td>
                                                <td>R$ 24,98</td>
                                                <td>3 dias</td>
                                                <td>Aguardando retirada</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

            </div>
        </center>
    </div>
</div>
<script type="text/javascript" src="js/popuphandler.js"></script>
