package com.ufpr.tads.web2.model.beans;

import java.io.Serializable;


public class LoginBean implements Serializable {
    private int id;
    private String nome;
    private String email;
    
    public LoginBean() {
        
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
    
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
}
