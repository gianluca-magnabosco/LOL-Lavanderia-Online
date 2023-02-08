package com.ufpr.tads.web2.model.domain;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Gian
 */

public class Pedido implements Serializable {
    
    private int id;
    private String descricao;
    private double orcamento;
    private int tempo;
    private List<UserHasPedido> userHasPedidoList;
    private List<PedidoHasItem> pedidoHasItemList;
    private List<Item> itens;
    private User user;

    
    public Pedido() {
        
    }

    
    public Pedido(int id, String descricao, double orcamento, int tempo, List<UserHasPedido> userHasPedidoList, List<PedidoHasItem> pedidoHasItemList, List<Item> itens, User user) {
        this.id = id;
        this.descricao = descricao;
        this.orcamento = orcamento;
        this.tempo = tempo;
        this.userHasPedidoList = userHasPedidoList;
        this.pedidoHasItemList = pedidoHasItemList;
        this.itens = itens;
        this.user = user;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
    
    

    
    public void addItem(Item item) {
        this.itens.add(item);
    }
    
    public List<Item> getItens() {
        return itens;
    }

    public void setItens(List<Item> itens) {
        this.itens = itens;
    }

    
    
    public int getId() {
        return id;
    }

    public void setId(int idPedido) {
        this.id = idPedido;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public double getOrcamento() {
        return orcamento;
    }

    public void setOrcamento(double orcamento) {
        this.orcamento = orcamento;
    }

    public int getTempo() {
        return tempo;
    }

    public void setTempo(int tempo) {
        this.tempo = tempo;
    }

    public List<UserHasPedido> getUserHasPedidoList() {
        return userHasPedidoList;
    }

    public void setUserHasPedidoList(List<UserHasPedido> userHasPedidoList) {
        this.userHasPedidoList = userHasPedidoList;
    }

    public List<PedidoHasItem> getPedidoHasItemList() {
        return pedidoHasItemList;
    }

    public void setPedidoHasItemList(List<PedidoHasItem> pedidoHasItemList) {
        this.pedidoHasItemList = pedidoHasItemList;
    }
  
    
}



