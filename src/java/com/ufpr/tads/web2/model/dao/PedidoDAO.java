package com.ufpr.tads.web2.model.dao;

import com.ufpr.tads.web2.exception.DAOException;
import com.ufpr.tads.web2.model.domain.Item;
import com.ufpr.tads.web2.model.domain.Pedido;
import com.ufpr.tads.web2.model.domain.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class PedidoDAO implements DAO<Pedido> {
    
    private static final String SEARCH_BY_ID_QUERY = "SELECT p.id_pedido, p.descricao_pedido, p.orcamento_pedido, p.tempo_pedido, " + 
                "i.id_item, i.descricao_item, i.preco_uni, i.tempo_item, i.imagem_item, " + 
                "u.id_user, u.cpf_user, u.nome_user, u.email_user, u.telefone_user, " + 
                "FROM tb_pedido p " + 
                "INNER JOIN pedido_has_item phi ON p.id_pedido = phi.id_pedido " + 
                "INNER JOIN tb_item i ON phi.id_item = i.id_item " + 
                "INNER JOIN user_has_pedido uhp ON p.id_pedido = uhp.id_pedido " + 
                "INNER JOIN tb_user u ON uhp.id_user = u.id_user " + 
                "WHERE p.id_pedido = ?";
    
    
    // ^^^^^tinha que pegar os valores das relacoes (pedidohasitem e userhaspedido)
    // ai adicionar no pedido
    // precisa testar
    
    
    private Connection con = null;
    
    
    public PedidoDAO(Connection con) throws DAOException {
        if (con == null) {
            throw new DAOException("Conexão nula ao criar PedidoDAO.");
        }
        
        this.con = con;
    }    
 
    
    @Override
    public Pedido searchById(int id) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(SEARCH_BY_ID_QUERY)) {
            st.setInt(1, id);

            try (ResultSet rs = st.executeQuery()) {

                while (rs.next()) {
                    Pedido pedido = new Pedido();
                    pedido.setId(rs.getInt("id_pedido"));
                    pedido.setDescricao(rs.getString("descricao_pedido"));
                    pedido.setOrcamento(rs.getDouble("orcamento_pedido"));
                    pedido.setTempo(rs.getInt("tempo_pedido"));
                    
                    Item item = new Item();
                    item.setId(rs.getInt("id_item"));
                    item.setDescricao(rs.getString("descricao_item"));
                    item.setPreco(rs.getDouble("preco_uni"));
                    item.setTempo(rs.getInt("tempo_item"));
                    item.setImagem(rs.getString("imagem_item"));
                    pedido.addItem(item);
                    
                    
                    User user = new User();
                    user.setId(rs.getInt("id_user"));
                    user.setCpf(rs.getString("cpf_user"));
                    user.setFullName(rs.getString("nome_user"));
                    user.setEmail(rs.getString("email_user"));
                    user.setPhoneNumber(rs.getString("telefone_user"));
                    user.setPassword(rs.getString("senha_user"));
                    user.setRole(rs.getString("tipo_user"));
                    pedido.setUser(user);
                    
                    return pedido;
                }
            }
            return null;
        } catch (SQLException e) {
            throw new DAOException("Erro ao buscar pedido: " + SEARCH_BY_ID_QUERY, e);
        }
    }

}
