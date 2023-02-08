package com.ufpr.tads.web2.model.domain;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author Gian
 */
public class UserHasPedido implements Serializable {
    
    private int userId;
    private int pedidoId;
    private String status;
    private Date dataInicio;
    private Date dataFim;
    private User user;
    private Pedido pedido;

    
    public UserHasPedido() {
        
    }
    
    public UserHasPedido(int idUser, int idPedido, String status, Date dataInicio, Date dataFim, User user, Pedido pedido) {
        this.userId = idUser;
        this.pedidoId = idPedido;
        this.status = status;
        this.dataInicio = dataInicio;
        this.dataFim = dataFim;
        this.user = user;
        this.pedido = pedido;
    }
    

    public int getIdUser() {
        return userId;
    }

    public void setIdUser(int idUser) {
        this.userId = idUser;
    }

    public int getIdPedido() {
        return pedidoId;
    }

    public void setIdPedido(int idPedido) {
        this.pedidoId = idPedido;
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

    public Date getDataFim() {
        return dataFim;
    }

    public void setDataFim(Date dataFim) {
        this.dataFim = dataFim;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Pedido getPedido() {
        return pedido;
    }

    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    }

    
}
