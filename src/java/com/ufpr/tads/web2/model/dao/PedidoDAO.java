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

  public void adicionarPedido(Pedido pedido) throws DAOException {
    String sql = "INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido, tempo_pedido) VALUES (?, ?, ?)";

    try (PreparedStatement stmt = connection.prepareStatement(sql)) {
      stmt.setString(1, pedido.getDescricaoPedido());
      stmt.setDouble(2, pedido.getOrcamentoPedido());
      stmt.setInt(3, pedido.getTempoPedido());
      stmt.execute();
    }
  }

  public void adicionarItemPedido(PedidoHasItem phi) throws DAOException {
    String sql = "INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item) VALUES (?, ?, ?)";

    try (PreparedStatement stmt = connection.prepareStatement(sql)) {
      stmt.setInt(1, phi.getIdPedido());
      stmt.setInt(2, phi.getIdItem());
      stmt.setInt(3, phi.getQtdItem());
      stmt.execute();
    }
  }

  public void adicionarUsuarioPedido(UserHasPedido uhp) throws DAOException {
    String sql = "INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim) VALUES (?, ?, ?, ?, ?)";

    try (PreparedStatement stmt = connection.prepareStatement(sql)) {
      stmt.setInt(1, uhp.getIdUser());
      stmt.setInt(2, uhp.getIdPedido());
      stmt.setString(3, uhp.getStatus());
      stmt.setDate(4, new java.sql.Date(uhp.getDataInicio().getTime()));
      stmt.setDate(5, new java.sql.Date(uhp.getDataFim().getTime()));
      stmt.execute();
    }
  }

public List<Pedido> listarPedidos() throws DAOException {
    List<Pedido> pedidos = new ArrayList<>();

    String sql = "SELECT * FROM tb_pedido " +
                 "INNER JOIN tb_user_has_pedido ON tb_pedido.id_pedido = tb_user_has_pedido.id_pedido " +
                 "INNER JOIN tb_user ON tb_user_has_pedido.id_user = tb_user.id_user";

    try (PreparedStatement statement = connection.prepareStatement(sql)) {
      ResultSet resultSet = statement.executeQuery();
      while (resultSet.next()) {
        Pedido pedido = new Pedido();
        pedido.setIdPedido(resultSet.getInt("id_pedido"));
        pedido.setDescricaoPedido(resultSet.getString("descricao_pedido"));
        pedido.setOrcamentoPedido(resultSet.getDouble("orcamento_pedido"));
        pedido.setTempoPedido(resultSet.getInt("tempo_pedido"));

        User user = new User();
        user.setIdUser(resultSet.getInt("id_user"));
        user.setNomeUser(resultSet.getString("nome_user"));
        user.setEmailUser(resultSet.getString("email_user"));
        user.setTelefoneUser(resultSet.getString("telefone_user"));

        UserHasPedido userHasPedido = new UserHasPedido();
        userHasPedido.setStatus(resultSet.getString("status"));
        userHasPedido.setDataInicio(resultSet.getDate("data_inicio"));
        userHasPedido.setDataFim(resultSet.getDate("data_fim"));

        pedido.setUser(user);
        pedido.setUserHasPedido(userHasPedido);

        pedidos.add(pedido);
      }
      return pedidos;
    } catch (SQLException e) {
      throw new DAOException("Falha ao listar pedidos", e);
    }
  }

  public List<Item> listarItensPedido(int idPedido) throws DAOException {
    List<Item> itens = new ArrayList<>();

    try {
        stmt = con.prepareStatement(
            "SELECT i.id_item, i.descricao_item, i.preco_uni, i.tempo, i.imagem_item " +
            "FROM tb_item i " +
            "INNER JOIN pedido_has_item phi ON i.id_item = phi.id_item " +
            "WHERE phi.id_pedido = ?"
        );
        stmt.setInt(1, idPedido);
        rs = stmt.executeQuery();

        while (rs.next()) {
            Item item = new Item();
            item.setId(rs.getInt("id_item"));
            item.setDescricao(rs.getString("descricao_item"));
            item.setPrecoUni(rs.getDouble("preco_uni"));
            item.setTempo(rs.getInt("tempo"));
            item.setImagem(rs.getString("imagem_item"));
            itens.add(item);
        }
    } catch (SQLException e) {
        throw new DAOException(e);
    } 
    return itens;
}

@Override
public void insert(Pedido pedido) throws DAOException {
    String sql = "INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido, tempo_pedido) VALUES (?, ?, ?)";
    try (PreparedStatement stmt = connection.prepareStatement(sql)) {
      stmt.setString(1, pedido.getDescricao());
      stmt.setDouble(2, pedido.getOrcamento());
      stmt.setInt(3, pedido.getTempo());
      stmt.execute();
    } catch (SQLException e) {
      throw new DAOException(e);
    }
  }

@Override
public void update(Pedido pedido) throws DAOException {
    String sql = "UPDATE tb_pedido SET descricao_pedido = ?, orcamento_pedido = ?, tempo_pedido = ? WHERE id_pedido = ?";
    try (PreparedStatement stmt = connection.prepareStatement(sql)) {
      stmt.setString(1, pedido.getDescricao());
      stmt.setDouble(2, pedido.getOrcamento());
      stmt.setInt(3, pedido.getTempo());
      stmt.setInt(4, pedido.getId());
      stmt.execute();
    } catch (SQLException e) {
      throw new DAOException(e);
    }
  }

@Override
 public void delete(int id) throws DAOException {
    String sql = "DELETE FROM tb_pedido WHERE id_pedido = ?";
    try (PreparedStatement stmt = connection.prepareStatement(sql)) {
      stmt.setInt(1, id);
      stmt.execute();
    } catch (SQLException e) {
      throw new DAOException(e);
    }
  }

}



/* DEIXEI COMENTADO PARA QUALQUER COISA VOLTAR AO PONTO INICIAL */

/* 
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


*/