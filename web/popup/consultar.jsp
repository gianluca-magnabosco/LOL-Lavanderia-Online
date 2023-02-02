<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="../css/cancelarpopup.css">
<div id="overlay" class="consultarOverlay" style="display: none;">
    <div id="content">
        <center id="centertext" style="padding-top: 0px;">
            <img id="close" src="../images/icons8-close-28.png"/>
            <h2>Pedido #SO-32269</h2>
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
                    
                    <div class="border">
                        <h5 class="mt-2">Total: R$ 49,96</h5>
                    </div>
                    <div class="border">
                        <h5 class="mt-2">Prazo: 3 dias</h5>
                    </div>
                </div>
            </div>
        </center>
    </div>
</div>

<script type="text/javascript" src="../js/consultarPopup.js"></script>
