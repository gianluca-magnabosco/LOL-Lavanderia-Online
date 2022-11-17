package domain;

import java.io.Serializable;


public class Endereco implements Serializable {
    private int id;
    private Cidade cidade;
    private String cep;
    private String logradouro;
    private int numero;
    private String complemento;
    private String bairro;
    
    
    public Endereco() {
        
    }
    
    
    public Endereco(int id, Cidade cidade, String cep, String logradouro, int numero, String complemento, String bairro) {
        this.id = id; 
        this.cidade = cidade;
        this.cep = cep;
        this.logradouro = logradouro;
        this.numero = numero;
        this.complemento = complemento;
        this.bairro = bairro;
    }
    
    
    public Endereco(Cidade cidade, String cep, String logradouro, int numero, String complemento, String bairro) {
        this.cidade = cidade;
        this.cep = cep;
        this.logradouro = logradouro;
        this.numero = numero;
        this.complemento = complemento;
        this.bairro = bairro;
    }
    
    
    public Endereco(String cep, String logradouro, int numero, String complemento, String bairro) {
        this.cep = cep;
        this.logradouro = logradouro;
        this.numero = numero;
        this.complemento = complemento;
        this.bairro = bairro;
    }
    
    
    public Endereco(int id) {
        this.id = id;
    }
    
    
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) { 
        this.id = id;
    }
    
    public Cidade getCidade() {
        return this.cidade;
    }
    
    public void setCidade(Cidade cidade) {
        this.cidade = cidade;
    }
    
    public String getCep() {
        return this.cep;
    }
    
    public void setCep(String cep) {
        this.cep = cep;
    }
    
    public String getLogradouro() {
        return this.logradouro;
    }
    
    public void setLogradouro(String logradouro) {
        this.logradouro = logradouro;
    }
    
    public int getNumero() {
        return this.numero;
    }
    
    public void setNumero(int numero) {
        this.numero = numero;
    }
    
    public String getComplemento() {
        return this.complemento;
    }
    
    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getBairro() {
        return this.bairro;
    }
    
    public void setBairro(String bairro) {
        this.bairro = bairro;
    }
    
}
