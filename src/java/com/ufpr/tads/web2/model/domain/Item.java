package com.ufpr.tads.web2.model.domain;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Gian
 */
public class Item implements Serializable {
    
    private int id;
    private String descricao;
    private double preco;
    private int tempo;
    private String imagem;
    private List<PedidoHasItem> pedidoHasItemList;

    
    public Item() {
        
    }
    

    public Item(int id, String descricao, double preco, int tempo, String imagem, List<PedidoHasItem> pedidoHasItemList) {
        this.id = id;
        this.descricao = descricao;
        this.preco = preco;
        this.tempo = tempo;
        this.imagem = imagem;
        this.pedidoHasItemList = pedidoHasItemList;
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

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public int getTempo() {
        return tempo;
    }

    public void setTempo(int tempo) {
        this.tempo = tempo;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public List<PedidoHasItem> getPedidoHasItemList() {
        return pedidoHasItemList;
    }

    public void setPedidoHasItemList(List<PedidoHasItem> pedidoHasItemList) {
        this.pedidoHasItemList = pedidoHasItemList;
    }

}
