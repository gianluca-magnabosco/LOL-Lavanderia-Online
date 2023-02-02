package com.ufpr.tads.web2.model.domain;

import java.io.Serializable;


public class Estado implements Serializable {
    private int id;
    private String nome;
    private String uf;
    
    
    public Estado() {
        
    }
    
    
    public Estado(int id, String nome, String uf) {
        this.id = id;
        this.nome = nome;
        this.uf = uf;
    }
    
    
    public Estado(String nome, String uf) {
        this.nome = nome;
        this.uf = uf;
    }
    
    
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getNome() {
        return this.nome;
    }
    
    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public String getUf() {
        return this.uf;
    }
    
    public void setUf(String uf) {
        this.uf = uf;
    }
}
