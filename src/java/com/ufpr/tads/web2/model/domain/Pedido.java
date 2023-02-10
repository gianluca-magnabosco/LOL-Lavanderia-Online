package com.ufpr.tads.web2.model.domain;

import java.io.Serializable;
import java.util.Date;
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
    private List<ItemPedido> itens;
    private User user;
    private String status;
    private Date dataInicio;

    
    public Pedido() {
        
    }

    public Pedido(int id, String descricao, double orcamento, int tempo, List<ItemPedido> itens, User user, String status, Date dataInicio) {
        this.id = id;
        this.descricao = descricao;
        this.orcamento = orcamento;
        this.tempo = tempo;
        this.itens = itens;
        this.user = user;
        this.status = status;
        this.dataInicio = dataInicio;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public List<ItemPedido> getItens() {
        return itens;
    }

    public void setItens(List<ItemPedido> itens) {
        this.itens = itens;
    }
    
    public void addItem(ItemPedido item) {
        this.itens.add(item);
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getDataInicio() {
        return dataInicio;
    }

    public void setDataInicio(Date dataInicio) {
        this.dataInicio = dataInicio;
    }
    
  
    
}



