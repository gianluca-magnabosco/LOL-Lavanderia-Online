package com.ufpr.tads.web2.model.beans;

import java.io.Serializable;


public class ConfigBean implements Serializable {
    private String email;
    
    public ConfigBean() {
        
    }
    
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
}
