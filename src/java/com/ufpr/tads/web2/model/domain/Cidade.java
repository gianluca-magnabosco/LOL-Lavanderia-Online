package com.ufpr.tads.web2.model.domain;

import java.io.Serializable;

public class Cidade implements Serializable {
    private int id;
    private Estado estado;
    private String nome;
    
    
    public Cidade() {
        
    }
    
    public Cidade(int id, Estado estado, String nome) {
        this.id = id;
        this.estado = estado;
        this.nome = nome;
    }
    
    public Cidade(Estado estado, String nome) {
        this.estado = estado;
        this.nome = nome;
    }
    
    public Cidade(String nome) {
        this.nome = nome;
    }
    
    
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public Estado getEstado() {
        return this.estado;
    }
    
    public void setEstado(Estado estado) {
        this.estado = estado;
    }
    
    public String getNome() {
        return this.nome;
    }
    
    public void setNome(String nome) {
        this.nome = nome;
    }
    
}
