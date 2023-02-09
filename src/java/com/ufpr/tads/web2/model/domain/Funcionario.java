package com.ufpr.tads.web2.model.domain;

import java.io.Serializable;

    public class Funcionario implements Serializable {
        private int idUser;
        private String nomeUser;
        private String emailUser;
        private String senhaUser;
        private Date dataNascimento;
    
    public Funcionario(){

    }

    public Funcionario(Integer idUser, String nomeUser, String emailUser, String senhaUser, Date dataNascimento){
        this.idUser = idUser;
        this.nomeUser = nomeUser;
        this.emailUser = emailUser;
        this.senhaUser = senhaUser;
        this.dataNascimento = dataNascimento;
    }
        

        public class Funcionario {
  
            private Integer idUser;
            private String nomeUser;
            private String emailUser;
            private String senhaUser;
            private Date dataNascimento;
            
            public Funcionario() {}
            
            public Integer getIdUser() {
              return idUser;
            }
            
            public void setIdUser(Integer idUser) {
              this.idUser = idUser;
            }
            
            public String getNomeUser() {
              return nomeUser;
            }
            
            public void setNomeUser(String nomeUser) {
              this.nomeUser = nomeUser;
            }
            
            public String getEmailUser() {
              return emailUser;
            }
            
            public void setEmailUser(String emailUser) {
              this.emailUser = emailUser;
            }
            
            public String getSenhaUser() {
              return senhaUser;
            }
            
            public void setSenhaUser(String senhaUser) {
              this.senhaUser = senhaUser;
            }

            public Date getDataNascimento(){
                return dataNascimento;
            }

            public void setDataNascimento(Date dataNascimento){
                this.dataNascimento = dataNascimento;
            }
          }
          