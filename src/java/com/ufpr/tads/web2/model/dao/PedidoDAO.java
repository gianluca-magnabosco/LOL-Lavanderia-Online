package com.ufpr.tads.web2.model.dao;

import com.ufpr.tads.web2.exception.DAOException;
import com.ufpr.tads.web2.model.domain.ItemPedido;
import com.ufpr.tads.web2.model.domain.Pedido;
import com.ufpr.tads.web2.model.domain.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class PedidoDAO implements DAO<Pedido> {
    
    private static final String INSERT_QUERY = "INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido, tempo_pedido) VALUES (?, ?, ?);";
    private static final String INSERT_UHP_QUERY = "INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio) VALUES (?, ?, ?, ?);";
    private static final String INSERT_PHI_QUERY = "INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item) VALUES (?, ?, ?);";
    
    private static final String UPDATE_STATUS_QUERY = "UPDATE user_has_pedido SET status = ? WHERE id_pedido = ?;";

    private static final String TERMINAR_PEDIDO_QUERY = "UPDATE user_has_pedido SET status = ?, data_fim = now() WHERE id_pedido = ?;";
    
    private static final String PAGAR_PEDIDO_QUERY = "UPDATE user_has_pedido SET status = 'PAGO', data_pagamento = now() WHERE id_pedido = ?;";
    
    private static final String SEARCH_ID = "SELECT id_pedido FROM tb_pedido ORDER BY id_pedido DESC LIMIT 1;";
    
    private static final String SEARCH_BY_ID_QUERY = "SELECT p.id_pedido, p.descricao_pedido, p.orcamento_pedido, p.tempo_pedido, " + 
                "i.id_item, i.descricao_item, i.preco_uni, i.tempo_item, " + 
                "u.id_user, u.cpf_user, u.nome_user, u.email_user, u.telefone_user, " + 
                "uhp.status, uhp.data_inicio, phi.qtd_item " +
                "FROM tb_pedido p " + 
                "JOIN pedido_has_item phi ON p.id_pedido = phi.id_pedido " + 
                "JOIN tb_item i ON phi.id_item = i.id_item " + 
                "JOIN user_has_pedido uhp ON p.id_pedido = uhp.id_pedido " + 
                "JOIN tb_user u ON uhp.id_user = u.id_user " + 
                "WHERE p.id_pedido = ?;";
    
    private static final String SEARCH_BY_USER_QUERY = "SELECT p.id_pedido, p.descricao_pedido, p.orcamento_pedido, p.tempo_pedido, " + 
                "i.id_item, i.descricao_item, i.preco_uni, i.tempo_item, " + 
                "u.id_user, u.cpf_user, u.nome_user, u.email_user, u.telefone_user, " + 
                "uhp.status, uhp.data_inicio, phi.qtd_item " +
                "FROM tb_pedido p " + 
                "JOIN pedido_has_item phi ON p.id_pedido = phi.id_pedido " + 
                "JOIN tb_item i ON phi.id_item = i.id_item " + 
                "JOIN user_has_pedido uhp ON p.id_pedido = uhp.id_pedido " + 
                "JOIN tb_user u ON uhp.id_user = u.id_user " +
                "WHERE u.id_user = ? " +
                "ORDER BY uhp.data_inicio DESC, p.id_pedido ASC;";
    
    private static final String SEARCH_QUERY = "SELECT p.id_pedido, p.descricao_pedido, p.orcamento_pedido, p.tempo_pedido, " + 
                "i.id_item, i.descricao_item, i.preco_uni, i.tempo_item, " + 
                "u.id_user, u.cpf_user, u.nome_user, u.email_user, u.telefone_user, " + 
                "uhp.status, uhp.data_inicio, phi.qtd_item " +
                "FROM tb_pedido p " + 
                "JOIN pedido_has_item phi ON p.id_pedido = phi.id_pedido " + 
                "JOIN tb_item i ON phi.id_item = i.id_item " + 
                "JOIN user_has_pedido uhp ON p.id_pedido = uhp.id_pedido " + 
                "JOIN tb_user u ON uhp.id_user = u.id_user " +
                "ORDER BY uhp.data_inicio ASC, p.id_pedido ASC;";
    
    private static final String SEARCH_BY_USER_EM_ABERTO_QUERY = "SELECT p.id_pedido, p.descricao_pedido, p.orcamento_pedido, p.tempo_pedido, " + 
                "i.id_item, i.descricao_item, i.preco_uni, i.tempo_item, " + 
                "u.id_user, u.cpf_user, u.nome_user, u.email_user, u.telefone_user, " + 
                "uhp.status, uhp.data_inicio, phi.qtd_item " +
                "FROM tb_pedido p " + 
                "JOIN pedido_has_item phi ON p.id_pedido = phi.id_pedido " + 
                "JOIN tb_item i ON phi.id_item = i.id_item " + 
                "JOIN user_has_pedido uhp ON p.id_pedido = uhp.id_pedido " + 
                "JOIN tb_user u ON uhp.id_user = u.id_user " +
                "WHERE uhp.status = 'EM ABERTO' AND u.id_user = ? " +
                "ORDER BY uhp.data_inicio DESC, p.id_pedido ASC;";
 
    private static final String SEARCH_ALL_EM_ABERTO_QUERY = "SELECT p.id_pedido, p.descricao_pedido, p.orcamento_pedido, p.tempo_pedido, " + 
                "i.id_item, i.descricao_item, i.preco_uni, i.tempo_item, " + 
                "u.id_user, u.cpf_user, u.nome_user, u.email_user, u.telefone_user, " + 
                "uhp.status, uhp.data_inicio, phi.qtd_item " +
                "FROM tb_pedido p " + 
                "JOIN pedido_has_item phi ON p.id_pedido = phi.id_pedido " + 
                "JOIN tb_item i ON phi.id_item = i.id_item " + 
                "JOIN user_has_pedido uhp ON p.id_pedido = uhp.id_pedido " + 
                "JOIN tb_user u ON uhp.id_user = u.id_user " +
                "WHERE uhp.status = 'EM ABERTO' " +
                "ORDER BY uhp.data_inicio ASC, p.id_pedido ASC;";

    

    private Connection con = null;
    
    
    public PedidoDAO(Connection con) throws DAOException {
        if (con == null) {
            throw new DAOException("Conexao nula ao criar PedidoDAO.");
        }
        
        this.con = con;
    }    
    
    
    @Override
    public void insert(Pedido pedido) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(INSERT_QUERY)) {
            st.setString(1, pedido.getDescricao());
            st.setDouble(2, pedido.getOrcamento());
            st.setInt(3, pedido.getTempo());
            
            st.executeUpdate();
            
        } catch (SQLException e) {
            throw new DAOException("Erro ao inserir pedido: " + INSERT_QUERY , e);
        }
        
        
        try (PreparedStatement st = con.prepareStatement(SEARCH_ID);
                ResultSet rs = st.executeQuery()) {  
            
            while (rs.next()) {
                pedido.setId(rs.getInt("id_pedido"));
            }

        } catch (SQLException e) {
            throw new DAOException("Erro ao inserir pedido: " + SEARCH_ID , e);
        }

        try (PreparedStatement st = con.prepareStatement(INSERT_UHP_QUERY)) {
            st.setInt(1, pedido.getUser().getId());
            st.setInt(2, pedido.getId());
            st.setString(3, pedido.getStatus());
            st.setDate(4, new java.sql.Date(pedido.getDataInicio().getTime()));
            
            st.executeUpdate();
            
        } catch (SQLException e) {
            throw new DAOException("Erro ao inserir pedido: " + INSERT_UHP_QUERY , e);
        }
                
        try (PreparedStatement st = con.prepareStatement(INSERT_PHI_QUERY)) {
            for (ItemPedido item : pedido.getItens()) {
                st.setInt(1, pedido.getId());
                st.setInt(2, item.getId());
                st.setInt(3, item.getQuantidade());
                
                st.executeUpdate();
            }
        } catch (SQLException e) {
            throw new DAOException("Erro ao inserir pedido: " + INSERT_PHI_QUERY , e);
        }
    }
 
    
    @Override
    public List<Pedido> searchAll() throws DAOException {
        
        List<Pedido> pedidos = new ArrayList<>();
        
        try (PreparedStatement st = con.prepareStatement(SEARCH_QUERY);
                ResultSet rs = st.executeQuery()) {
            
            Pedido pedido = null;

            while (rs.next()) {
                
                int currentPedidoId = rs.getInt("id_pedido");

                if (pedido == null || pedido.getId() != currentPedidoId) {
                    
                    if (pedido != null) {              
                        pedidos.add(pedido);
                    }
                    
                    pedido = new Pedido();
                    pedido.setId(rs.getInt("id_pedido"));
                    pedido.setDescricao(rs.getString("descricao_pedido"));
                    pedido.setOrcamento(rs.getDouble("orcamento_pedido"));
                    pedido.setTempo(rs.getInt("tempo_pedido"));
                    pedido.setStatus(rs.getString("status"));
                    pedido.setDataInicio(new Date(rs.getDate("data_inicio").getTime()));

                    User user = new User();
                    user.setId(rs.getInt("id_user"));
                    user.setCpf(rs.getString("cpf_user"));
                    user.setFullName(rs.getString("nome_user"));
                    user.setEmail(rs.getString("email_user"));
                    user.setPhoneNumber(rs.getString("telefone_user"));
                    pedido.setUser(user);
                }

                ItemPedido item = new ItemPedido();
                item.setId(rs.getInt("id_item"));
                item.setNome(rs.getString("descricao_item"));
                item.setPreco(rs.getDouble("preco_uni"));
                item.setTempo(rs.getInt("tempo_item"));
                item.setQuantidade(rs.getInt("qtd_item"));
                pedido.addItem(item);
            }
        } catch (SQLException e) {
            throw new DAOException("Erro ao buscar pedidos: " + SEARCH_QUERY , e);
        }

        return pedidos;
    }
    
    
    public List<Pedido> searchAllEmAberto() throws DAOException {
        
        List<Pedido> pedidos = new ArrayList<>();
        
        try (PreparedStatement st = con.prepareStatement(SEARCH_ALL_EM_ABERTO_QUERY);
                ResultSet rs = st.executeQuery()) {
            
            Pedido pedido = null;

            while (rs.next()) {

                int currentPedidoId = rs.getInt("id_pedido");

                if (pedido == null || pedido.getId() != currentPedidoId) {
                    
                    if (pedido != null) {              
                        pedidos.add(pedido);
                    }
                    
                    pedido = new Pedido();
                    pedido.setId(rs.getInt("id_pedido"));
                    pedido.setDescricao(rs.getString("descricao_pedido"));
                    pedido.setOrcamento(rs.getDouble("orcamento_pedido"));
                    pedido.setTempo(rs.getInt("tempo_pedido"));
                    pedido.setStatus(rs.getString("status"));
                    pedido.setDataInicio(new Date(rs.getDate("data_inicio").getTime()));

                    User user = new User();
                    user.setId(rs.getInt("id_user"));
                    user.setCpf(rs.getString("cpf_user"));
                    user.setFullName(rs.getString("nome_user"));
                    user.setEmail(rs.getString("email_user"));
                    user.setPhoneNumber(rs.getString("telefone_user"));
                    pedido.setUser(user);
                }

                ItemPedido item = new ItemPedido();
                item.setId(rs.getInt("id_item"));
                item.setNome(rs.getString("descricao_item"));
                item.setPreco(rs.getDouble("preco_uni"));
                item.setTempo(rs.getInt("tempo_item"));
                item.setQuantidade(rs.getInt("qtd_item"));
                pedido.addItem(item);
            }
            
            pedidos.add(pedido);
            
        } catch (SQLException e) {
            throw new DAOException("Erro ao buscar pedidos em aberto: " + SEARCH_ALL_EM_ABERTO_QUERY , e);
        }

        return pedidos;
    }
    
    
    public List<Pedido> searchByUser(int userId) throws DAOException {
        
        List<Pedido> pedidos = new ArrayList<>();
        
        try (PreparedStatement st = con.prepareStatement(SEARCH_BY_USER_QUERY)) {
            
            Pedido pedido = null;
            
            st.setInt(1, userId);
            
            try (ResultSet rs = st.executeQuery()) {
                
                while (rs.next()) {

                    int currentPedidoId = rs.getInt("id_pedido");

                    if (pedido == null || pedido.getId() != currentPedidoId) {
                                         
                        if (pedido != null) {              
                            pedidos.add(pedido);
                        }
                        
                        pedido = new Pedido();
                        pedido.setId(rs.getInt("id_pedido"));
                        pedido.setDescricao(rs.getString("descricao_pedido"));
                        pedido.setOrcamento(rs.getDouble("orcamento_pedido"));
                        pedido.setTempo(rs.getInt("tempo_pedido"));
                        pedido.setStatus(rs.getString("status"));
                        pedido.setDataInicio(new Date(rs.getDate("data_inicio").getTime()));

                        User user = new User();
                        user.setId(rs.getInt("id_user"));
                        user.setCpf(rs.getString("cpf_user"));
                        user.setFullName(rs.getString("nome_user"));
                        user.setEmail(rs.getString("email_user"));
                        user.setPhoneNumber(rs.getString("telefone_user"));
                        pedido.setUser(user);
                    }

                    ItemPedido item = new ItemPedido();
                    item.setId(rs.getInt("id_item"));
                    item.setNome(rs.getString("descricao_item"));
                    item.setPreco(rs.getDouble("preco_uni"));
                    item.setTempo(rs.getInt("tempo_item"));
                    item.setQuantidade(rs.getInt("qtd_item"));
                    pedido.addItem(item);
                }
                
                pedidos.add(pedido);
            }
            
        } catch (SQLException e) {
            throw new DAOException("Erro ao buscar pedidos do usuario: " + SEARCH_BY_USER_QUERY , e);
        }

        return pedidos;
    }
    
    
    public List<Pedido> searchByUserIdEmAberto(int userId) throws DAOException {
        
        List<Pedido> pedidos = new ArrayList<>();
        
        try (PreparedStatement st = con.prepareStatement(SEARCH_BY_USER_EM_ABERTO_QUERY)) {
            
            Pedido pedido = null;
            
            st.setInt(1, userId);
            
            try (ResultSet rs = st.executeQuery()) {
                
                while (rs.next()) {

                    int currentPedidoId = rs.getInt("id_pedido");

                    if (pedido == null || pedido.getId() != currentPedidoId) {
                                      
                        if (pedido != null) {              
                            pedidos.add(pedido);
                        }
                        
                        pedido = new Pedido();
                        pedido.setId(rs.getInt("id_pedido"));
                        pedido.setDescricao(rs.getString("descricao_pedido"));
                        pedido.setOrcamento(rs.getDouble("orcamento_pedido"));
                        pedido.setTempo(rs.getInt("tempo_pedido"));
                        pedido.setStatus(rs.getString("status"));
                        pedido.setDataInicio(new Date(rs.getDate("data_inicio").getTime()));

                        User user = new User();
                        user.setId(rs.getInt("id_user"));
                        user.setCpf(rs.getString("cpf_user"));
                        user.setFullName(rs.getString("nome_user"));
                        user.setEmail(rs.getString("email_user"));
                        user.setPhoneNumber(rs.getString("telefone_user"));
                        pedido.setUser(user);
                    }

                    ItemPedido item = new ItemPedido();
                    item.setId(rs.getInt("id_item"));
                    item.setNome(rs.getString("descricao_item"));
                    item.setPreco(rs.getDouble("preco_uni"));
                    item.setTempo(rs.getInt("tempo_item"));
                    item.setQuantidade(rs.getInt("qtd_item"));
                    pedido.addItem(item);
                }
                
                pedidos.add(pedido);
            }
            
        } catch (SQLException e) {
            throw new DAOException("Erro ao buscar pedidos em aberto do usuario: " + SEARCH_BY_USER_EM_ABERTO_QUERY , e);
        }

        return pedidos;
    }
    
    
    @Override
    public Pedido searchById(int id) throws DAOException {
        
        Pedido pedido = null;
        
        try (PreparedStatement st = con.prepareStatement(SEARCH_BY_ID_QUERY)) {
            st.setInt(1, id);

            try (ResultSet rs = st.executeQuery()) {

                while (rs.next()) {
                    
                    if (pedido == null) {
                        pedido = new Pedido();
                        pedido.setId(rs.getInt("id_pedido"));
                        pedido.setDescricao(rs.getString("descricao_pedido"));
                        pedido.setOrcamento(rs.getDouble("orcamento_pedido"));
                        pedido.setTempo(rs.getInt("tempo_pedido"));
                        pedido.setStatus(rs.getString("status"));
                        pedido.setDataInicio(new Date(rs.getDate("data_inicio").getTime()));

                        User user = new User();
                        user.setId(rs.getInt("id_user"));
                        user.setCpf(rs.getString("cpf_user"));
                        user.setFullName(rs.getString("nome_user"));
                        user.setEmail(rs.getString("email_user"));
                        user.setPhoneNumber(rs.getString("telefone_user"));
                        pedido.setUser(user);
                    }
                    
                    ItemPedido item = new ItemPedido();
                    item.setId(rs.getInt("id_item"));
                    item.setNome(rs.getString("descricao_item"));
                    item.setPreco(rs.getDouble("preco_uni"));
                    item.setTempo(rs.getInt("tempo_item"));
                    item.setQuantidade(rs.getInt("qtd_item"));
                    pedido.addItem(item);
                }
            }
            
            return pedido;
            
        } catch (SQLException e) {
            throw new DAOException("Erro ao buscar pedido: " + SEARCH_BY_ID_QUERY, e);
        }
    }
    
    
    public void updateStatusPedido(int id, String status) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(UPDATE_STATUS_QUERY)) {
            st.setString(1, status);
            st.setInt(2, id);
            
            st.executeUpdate();
            
        } catch (SQLException e) {
            throw new DAOException("Erro ao atualizar status do pedido: " + UPDATE_STATUS_QUERY , e);
        }
    }

    
    public void terminarPedido(int id, String status) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(TERMINAR_PEDIDO_QUERY)) {
            st.setString(1, status);
            st.setInt(2, id);
            
            st.executeUpdate();
            
        } catch (SQLException e) {
            throw new DAOException("Erro ao terminar pedido: " + TERMINAR_PEDIDO_QUERY , e);
        }
    }    
    
    
    public void pagarPedido(int id) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(PAGAR_PEDIDO_QUERY)) {
            st.setInt(1, id);
            
            st.executeUpdate();
            
        } catch (SQLException e) {
            throw new DAOException("Erro ao pagar pedido: " + PAGAR_PEDIDO_QUERY , e);
        }
    }   

    
    public int getLastInserted() throws DAOException {
        try (PreparedStatement st = con.prepareStatement(SEARCH_ID);
                ResultSet rs = st.executeQuery()) {  
            
            if (rs.next()) {
                return rs.getInt("id_pedido");
            }

        } catch (SQLException e) {
            throw new DAOException("Erro ao inserir pedido: " + SEARCH_ID , e);
        }
        
        throw new DAOException("Erro ao inserir pedido: " + SEARCH_ID);
    }

    @Override
    public Pedido search(String name) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Pedido t) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Pedido t) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}