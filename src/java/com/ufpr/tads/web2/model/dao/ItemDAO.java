package com.ufpr.tads.web2.model.dao;

import com.ufpr.tads.web2.model.domain.Item;
import com.ufpr.tads.web2.exception.DAOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ItemDAO implements DAO<Item> {
    private static final String INSERT_QUERY = "INSERT INTO tb_item (descricao_item, preco_uni, tempo_item, imagem_item) VALUES (?, ?, ?, ?)";
    private static final String UPDATE_QUERY = "UPDATE tb_item SET descricao_item = ?, preco_uni = ?, tempo_item = ?, imagem_item = ? WHERE id_item = ?";
    private static final String DELETE_QUERY = "DELETE FROM tb_item WHERE id_item = ?";
    private static final String SEARCH_ONE_BY_ID_QUERY = "SELECT descricao_item, preco_uni FROM tb_item WHERE id_item = ?";
    private static final String LIST_QUERY = "SELECT descricao_item, preco_uni FROM tb_item";

    private Connection connection = null;

    public ItemDAO(Connection connection) throws DAOException{
        if (connection == null){
            throw new DAOException("Conexão nula ao criar ItemDAO");
        }
        this.connection = connection;
    }

    @Override
    public void inserir(Item item) throws DAOException {
        try (PreparedStatement statement = connection.prepareStatement(INSERT_QUERY)) {
            statement.setString(1, item.getTempoItem());
            statement.setString(2, item.getDescricaoItem());
            statement.setDouble(3, item.getPrecoItem());
            statement.setDouble(4, item.getImagemItem());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new DAOException("Erro ao inserir item " + INSERT_QUERY, e);
        }
    }

public void atualizar(Item item) throws DAOException {
    try (PreparedStatement statement = connection.prepareStatement(UPDATE_QUERY)) {
      statement.setString(1, item.getTempoItem());
      statement.setString(2, item.getDescricaoItem());
      statement.setDouble(3, item.getPrecoItem());
      statement.setDouble(4, item.getImagemItem());
      statement.setInt(5, item.getIdItem());
      statement.executeUpdate();
    } catch (SQLException e) {
      throw new DAOException("Erro ao atualizar item" + UPDATE_QUERY, e);
    }
  }

  public void remover(int id) throws DAOException {
    try (PreparedStatement statement = connection.prepareStatement(DELETE_QUERY)) {
      statement.setInt(1, id);
      statement.executeUpdate();
    } catch (SQLException e) {
      throw new DAOException("Erro ao remover item" + DELETE_QUERY, e);
    }
  }

  public Item buscarPorId(int id) throws DAOException {
    Item item = null;
    try (PreparedStatement statement = connection.prepareStatement(SEARCH_ONE_BY_ID_QUERY)) {
      statement.setInt(1, id);
      ResultSet resultSet = statement.executeQuery();
      if (resultSet.next()) {
        item = new Item();
        item.setId(resultSet.getInt("id_item"));
        item.setDescricao(resultSet.getString("descricao_item"));
        item.setPreco(resultSet.getDouble("preco_item"));
      }
    } catch (SQLException e) {
      throw new DAOException("Erro ao buscar item por ID" + SEARCH_ONE_BY_ID_QUERY, e);
    }
    return item;
  }

  public List<Item> listar() throws DAOException {
    List<Item> itens = new ArrayList<>();
    try (PreparedStatement statement = connection.prepareStatement(LIST_QUERY)) {
      ResultSet resultSet = statement.executeQuery();
      while (resultSet.next()) {
        Item item = new Item();
        item.setId(resultSet.getInt("id_item"));
        item.setDescricao(resultSet.getString("descricao_item"));
        item.setPreco(resultSet.getDouble("preco_item"));
        itens.add(item);
      }
    } catch (SQLException e) {
      throw new DAOException("Erro ao listar itens" + LIST_QUERY, e);
    }
    return itens;
  }
}
