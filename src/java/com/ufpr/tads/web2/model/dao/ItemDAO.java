package com.ufpr.tads.web2.dao;

import com.ufpr.tads.web2.model.domain.Item;
import com.ufpr.tads.web2.exception.DAOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ItemDAO {
    private Connection connection;
  
    public ItemDAO(Connection connection) {
      this.connection = connection;
    }

    public List<Item> listarItems() throws DAOException{
       List<Item> itens = new ArrayList<>();
    String sql = "SELECT * FROM item";
    try (PreparedStatement statement = connection.prepareStatement(sql);
         ResultSet resultSet = statement.executeQuery()) {
      while (resultSet.next()) {
        Item item = new Item();
        item.setId(resultSet.getInt("id"));
        item.setDescricao(resultSet.getString("descricao"));
        item.setPreco(resultSet.getDouble("preco"));
        item.setTempo(resultSet.getInt("tempo"));
        item.setImagem(resultSet.getString("imagem"));
        itens.add(item);
      }
    }
    return itens;
  }

    public void inserirItem(Item Item) throws DAOException{
        String sql = "INSERT INTO item (descricao, preco, tempo, imagem) values (?,?,?,?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
          statement.setString(1, item.getDescricao());
          statement.setDouble(2, item.getPreco());
          statement.setInt(3, item.getTempo());
          statement.setString(4, item.getImagem());
          statement.execute();
        }
      }

    public void atualizarItem(Item Item) throws DAOException{
        String sql = "UPDATE item SET descricao = ?, preco = ?, tempo = ?, imagem = ? WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
          statement.setString(1, item.getDescricao());
          statement.setDouble(2, item.getPreco());
          statement.setInt(3, item.getTempo());
          statement.setString(4, item.getImagem());
          statement.setInt(5, item.getId());
          statement.execute();
        }
      }

    public void deletarItem(int id)  throws DAOException{
        String sql = "DELETE FROM item WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
          statement.setInt(1, id);
          statement.execute();
        }
      }
    
}