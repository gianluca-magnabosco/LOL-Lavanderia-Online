package com.ufpr.tads.web2.model.domain;

/**
 *
 * @author Gian
 */
public class ItemPedido {
    private int id;
    private String nome;
    private double preco;
    private int tempo;
    private int quantidade;
    
    
    public ItemPedido() {
        
    }

    public ItemPedido(int id, String nome, double preco, int tempo, int quantidade) {
        this.id = id;
        this.nome = nome;
        this.preco = preco;
        this.tempo = tempo;
        this.quantidade = quantidade;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
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

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
    
}
