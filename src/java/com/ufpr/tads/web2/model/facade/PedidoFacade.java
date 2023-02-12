package com.ufpr.tads.web2.model.facade;

import com.ufpr.tads.web2.exception.DAOException;
import com.ufpr.tads.web2.exception.DadoInvalidoException;
import com.ufpr.tads.web2.exception.StatusIncompativelException;
import com.ufpr.tads.web2.model.dao.ConnectionFactory;
import com.ufpr.tads.web2.model.dao.ItemDAO;
import com.ufpr.tads.web2.model.dao.PedidoDAO;
import com.ufpr.tads.web2.model.domain.Item;
import com.ufpr.tads.web2.model.domain.ItemPedido;
import com.ufpr.tads.web2.model.domain.Pedido;
import com.ufpr.tads.web2.model.domain.User;
import com.ufpr.tads.web2.util.Validacao;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import org.json.JSONArray;
import org.json.JSONObject;

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
        
        Validacao.validarInteiro(id, "Id de pedido inserido eh invalido");
        
        Pedido pedido = null;
        
        try (ConnectionFactory factory = new ConnectionFactory()) {
            PedidoDAO dao = new PedidoDAO(factory.getConnection());
            
            pedido = dao.searchById(Integer.parseInt(id));
        }    
        
                    
        if (pedido == null) {
            throw new DadoInvalidoException("Id inserido nao encontrado!");
        }

        return pedido;
    }
    
    
    public static void insert(String body, int idUser, String status) throws DAOException, DadoInvalidoException { 
        
        Validacao.validarVazio(status, "O status deve ser inserido!");
        
        if (!(status.equals("confirmado") || status.equals("rejeitado"))) {
            throw new DadoInvalidoException("O status deve ser inserido!");
        }
        
        Pedido pedido = null;
        
        try {
            JSONObject json = new JSONObject(body);
            JSONArray selectedRows = json.getJSONArray("itens");
            String total = json.getString("total");
            String prazo = json.getString("prazo");

            List<ItemPedido> itens = new ArrayList<>();

            for (int i = 0; i < selectedRows.length(); i++) {
                JSONObject selectedRow = selectedRows.getJSONObject(i);
                int id = selectedRow.getInt("id");
                String nome = selectedRow.getString("nome");
                Validacao.validarVazio(nome, "Item inserido eh invalido!");
                int quantidade = selectedRow.getInt("quantidade");
                ItemPedido item = new ItemPedido();
                item.setId(id);
                item.setNome(nome);
                item.setQuantidade(quantidade);
                itens.add(item);
            }

            List<String> descricaoIterator = itens.stream()
                .map(item -> item.getQuantidade() + " " + item.getNome())
                .collect(Collectors.toList());
            
            String descricao = String.join(", ", descricaoIterator);
            
            double orcamento = Validacao.validarConverterPreco(total, "O orcamento inserido eh invalido!");
            int prazoTotal = validarTempo(prazo);

            pedido = new Pedido();
            pedido.setDescricao(descricao);
            pedido.setOrcamento(orcamento);
            pedido.setTempo(prazoTotal);
            pedido.setUser(new User(idUser));
            pedido.setDataInicio(new Date());
            pedido.setItens(itens);
            
            pedido.setStatus(status.equals("confirmado") ? "EM ABERTO" : "REJEITADO");
        } catch (Exception e) {
            throw new DadoInvalidoException("Algum dado do pedido ta incorreto!");
        }
        
        try (ConnectionFactory factory = new ConnectionFactory()) {
            PedidoDAO dao = new PedidoDAO(factory.getConnection());
            dao.insert(pedido);
        }  
    }
    
 
    public static int getLastInserted() throws DAOException {
        try (ConnectionFactory factory = new ConnectionFactory()) {
            PedidoDAO dao = new PedidoDAO(factory.getConnection());
            return dao.getLastInserted();
        }  
    }
    
    
    public static void cancelar(String id) throws DadoInvalidoException, DAOException, StatusIncompativelException {
        
        Validacao.validarInteiro(id, "Id de pedido inserido eh invalido");
        
        try (ConnectionFactory factory = new ConnectionFactory()) {
            PedidoDAO dao = new PedidoDAO(factory.getConnection());
            
            Pedido pedido = dao.searchById(Integer.parseInt(id));
            
            if (!pedido.getStatus().equals("EM ABERTO")) {
                throw new StatusIncompativelException("O pedido so pode ser cancelado se ainda nao tiver sido recolhido!");
            }
            
            dao.terminarPedido(Integer.parseInt(id), "CANCELADO");
        }           
    }

    
    public static void pagar(String id) throws DadoInvalidoException, DAOException, StatusIncompativelException {
        
        Validacao.validarInteiro(id, "Id de pedido inserido eh inválido");
        
        try (ConnectionFactory factory = new ConnectionFactory()) {
            PedidoDAO dao = new PedidoDAO(factory.getConnection());
            
            Pedido pedido = dao.searchById(Integer.parseInt(id));
            
            if (!pedido.getStatus().equals("AGUARDANDO PAGAMENTO")) {
                throw new StatusIncompativelException("O pedido so pode ser pago se estiver aguardando pagamento!");
            }
            
            dao.pagarPedido(Integer.parseInt(id));
        }  
    }

    
    public static void recolher(String id) throws DadoInvalidoException, DAOException, StatusIncompativelException {

        Validacao.validarInteiro(id, "Id de pedido inserido eh invalido");
        
        try (ConnectionFactory factory = new ConnectionFactory()) {
            PedidoDAO dao = new PedidoDAO(factory.getConnection());
            
            Pedido pedido = dao.searchById(Integer.parseInt(id));
            
            if (!pedido.getStatus().equals("EM ABERTO")) {
                throw new StatusIncompativelException("O pedido so pode ser recolhido se estiver em aberto!");
            }
            
            dao.updateStatusPedido(Integer.parseInt(id), "RECOLHIDO");
        } 
    }

    
    public static void confirmar(String id) throws DadoInvalidoException, DAOException, StatusIncompativelException {

        Validacao.validarInteiro(id, "Id de pedido inserido eh invalido");
        
        try (ConnectionFactory factory = new ConnectionFactory()) {
            PedidoDAO dao = new PedidoDAO(factory.getConnection());
            
            Pedido pedido = dao.searchById(Integer.parseInt(id));
            
            if (!pedido.getStatus().equals("RECOLHIDO")) {
                throw new StatusIncompativelException("O pedido so pode ser confirmado se tiver sido recolhido!");
            }
            
            dao.updateStatusPedido(Integer.parseInt(id), "AGUARDANDO PAGAMENTO");
        } 
    }

    
    public static void finalizar(String id) throws DadoInvalidoException, DAOException, StatusIncompativelException {

        Validacao.validarInteiro(id, "Id de pedido inserido eh invalido");
        
        try (ConnectionFactory factory = new ConnectionFactory()) {
            PedidoDAO dao = new PedidoDAO(factory.getConnection());
            
            Pedido pedido = dao.searchById(Integer.parseInt(id));
            
            if (!pedido.getStatus().equals("PAGO")) {
                throw new StatusIncompativelException("O pedido so pode ser finalizado se ja tiver sido pago!");
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
    
    
    private static int validarTempo(String tempo) throws DadoInvalidoException {
        if (!tempo.matches("\\d+\\sdia\\(s\\)")) {
            throw new DadoInvalidoException("O tempo inserido eh invalido!");
        }

        tempo = tempo.replace(" dia(s)", "");

        Validacao.validarInteiro(tempo, "O tempo inserido eh invalido!");
        
        return Integer.parseInt(tempo);
    }



}
