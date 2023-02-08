package com.ufpr.tads.web2.model.domain;

import java.io.Serializable;

/**
 *
 * @author Gian
 */
public class PedidoHasItem implements Serializable {
    
    private int pedidoId;
    private int itemId;
    private int quantidade;
    private Pedido pedido;
    private Item item;
    
    
    public PedidoHasItem() {
        
    }

    public PedidoHasItem(int idPedido, int idItem, int quantidade, Pedido pedido, Item item) {
        this.pedidoId = idPedido;
        this.itemId = idItem;
        this.quantidade = quantidade;
        this.pedido = pedido;
        this.item = item;
    }

    

    public int getIdPedido() {
        return pedidoId;
    }

    public void setIdPedido(int idPedido) {
        this.pedidoId = idPedido;
    }

    public int getIdItem() {
        return itemId;
    }

    public void setIdItem(int idItem) {
        this.itemId = idItem;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public Pedido getPedido() {
        return pedido;
    }

    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    
}