package com.ufpr.tads.web2.model.facade;

import com.ufpr.tads.web2.exception.DAOException;
import com.ufpr.tads.web2.exception.DadoInvalidoException;
import com.ufpr.tads.web2.exception.StatusIncompativelException;
import com.ufpr.tads.web2.model.dao.ConnectionFactory;
import com.ufpr.tads.web2.model.dao.ItemDAO;
import com.ufpr.tads.web2.model.dao.PedidoDAO;
import com.ufpr.tads.web2.model.domain.Item;
import com.ufpr.tads.web2.model.domain.Pedido;
import com.ufpr.tads.web2.model.domain.User;
import com.ufpr.tads.web2.util.Validacao;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Gian
 */
public class PedidoFacade {

    
    public static List<Pedido> listByUserIdEmAberto(int userId) throws DAOException {
        try (ConnectionFactory factory = new ConnectionFactory()) {
            PedidoDAO dao = new PedidoDAO(factory.getConnection());
            return dao.searchByUserIdEmAberto(userId);
        } 
    }

    
    public static List<Pedido> listAllEmAberto() throws DAOException {
        try (ConnectionFactory factory = new ConnectionFactory()) {
            PedidoDAO dao = new PedidoDAO(factory.getConnection());
            return dao.searchAllEmAberto();
        }        
    }

    
    public static List<Pedido> listAllByUser(int userId) throws DAOException {
        try (ConnectionFactory factory = new ConnectionFactory()) {
            PedidoDAO dao = new PedidoDAO(factory.getConnection());
            return dao.searchByUser(userId);
        }  
    }

    
    public static List<Pedido> listAll() throws DAOException {
        try (ConnectionFactory factory = new ConnectionFactory()) {
            PedidoDAO dao = new PedidoDAO(factory.getConnection());
            return dao.searchAll();
        }          
    }

    
    public static Pedido listById(String id) throws DAOException, DadoInvalidoException {
        
        Validacao.validarInteiro(id, "Id de pedido inserido é inválido");
        
        Pedido pedido = null;
        
        try (ConnectionFactory factory = new ConnectionFactory()) {
            PedidoDAO dao = new PedidoDAO(factory.getConnection());
            
            pedido = dao.searchById(Integer.parseInt(id));
        }    
        
                    
        if (pedido == null) {
            throw new DadoInvalidoException("Id inserido não encontrado!");
        }

        return pedido;
    }
    
    
    public static void insert(String descricao, String orcamento, String tempo, List<ItemPedido> itens, int idUser) throws DAOException { 
        // fazer validações
        Pedido pedido = new Pedido();
        pedido.setDescricao(descricao);
        pedido.setOrcamento(Double.parseDouble(orcamento));
        pedido.setTempo(Integer.parseInt(tempo));
        pedido.setUser(new User(idUser));
        pedido.setDataInicio(new Date());
        pedido.setItens(itens);
        pedido.setStatus("EM ABERTO");
        
        // RECEBER ITENS E ADICIONAR 
        
        try (ConnectionFactory factory = new ConnectionFactory()) {
            PedidoDAO dao = new PedidoDAO(factory.getConnection());
            dao.insert(pedido);
        }  
    }
    
    public static void cancelar(String id) throws DadoInvalidoException, DAOException, StatusIncompativelException {
        
        Validacao.validarInteiro(id, "Id de pedido inserido é inválido");
        
        try (ConnectionFactory factory = new ConnectionFactory()) {
            PedidoDAO dao = new PedidoDAO(factory.getConnection());
            
            Pedido pedido = dao.searchById(Integer.parseInt(id));
            
            if (!pedido.getStatus().equals("EM ABERTO")) {
                throw new StatusIncompativelException("O pedido só pode ser cancelado se ainda não tiver sido recolhido!");
            }
            
            dao.terminarPedido(Integer.parseInt(id), "CANCELADO");
        }           
    }

    
    public static void pagar(String id) throws DadoInvalidoException, DAOException, StatusIncompativelException {
        
        Validacao.validarInteiro(id, "Id de pedido inserido é inválido");
        
        try (ConnectionFactory factory = new ConnectionFactory()) {
            PedidoDAO dao = new PedidoDAO(factory.getConnection());
            
            Pedido pedido = dao.searchById(Integer.parseInt(id));
            
            if (!pedido.getStatus().equals("AGUARDANDO PAGAMENTO")) {
                throw new StatusIncompativelException("O pedido só pode ser pago se estiver aguardando pagamento!");
            }
            
            dao.pagarPedido(Integer.parseInt(id));
        }  
    }

    
    public static void recolher(String id) throws DadoInvalidoException, DAOException, StatusIncompativelException {

        Validacao.validarInteiro(id, "Id de pedido inserido é inválido");
        
        try (ConnectionFactory factory = new ConnectionFactory()) {
            PedidoDAO dao = new PedidoDAO(factory.getConnection());
            
            Pedido pedido = dao.searchById(Integer.parseInt(id));
            
            if (!pedido.getStatus().equals("EM ABERTO")) {
                throw new StatusIncompativelException("O pedido só pode ser recolhido se estiver em aberto!");
            }
            
            dao.updateStatusPedido(Integer.parseInt(id), "RECOLHIDO");
        } 
    }

    
    public static void confirmar(String id) throws DadoInvalidoException, DAOException, StatusIncompativelException {

        Validacao.validarInteiro(id, "Id de pedido inserido é inválido");
        
        try (ConnectionFactory factory = new ConnectionFactory()) {
            PedidoDAO dao = new PedidoDAO(factory.getConnection());
            
            Pedido pedido = dao.searchById(Integer.parseInt(id));
            
            if (!pedido.getStatus().equals("RECOLHIDO")) {
                throw new StatusIncompativelException("O pedido só pode ser confirmado se tiver sido recolhido!");
            }
            
            dao.updateStatusPedido(Integer.parseInt(id), "AGUARDANDO PAGAMENTO");
        } 
    }

    
    public static void finalizar(String id) throws DadoInvalidoException, DAOException, StatusIncompativelException {

        Validacao.validarInteiro(id, "Id de pedido inserido é inválido");
        
        try (ConnectionFactory factory = new ConnectionFactory()) {
            PedidoDAO dao = new PedidoDAO(factory.getConnection());
            
            Pedido pedido = dao.searchById(Integer.parseInt(id));
            
            if (!pedido.getStatus().equals("PAGO")) {
                throw new StatusIncompativelException("O pedido só pode ser finalizado se já tiver sido pago!");
            }
            
            dao.terminarPedido(Integer.parseInt(id), "FINALIZADO");
        }
    }

    
    public static List<Item> formPedido() throws DAOException {
        try (ConnectionFactory factory = new ConnectionFactory()) {
            ItemDAO dao = new ItemDAO(factory.getConnection());
            
            return dao.searchAll();
        }
    }


}
