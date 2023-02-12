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
    private static final String INSERT_QUERY = "INSERT INTO tb_item (descricao_item, preco_uni, tempo_item, imagem_item) VALUES (?, ?, ?, ?);";
    private static final String UPDATE_QUERY = "UPDATE tb_item SET descricao_item = ?, preco_uni = ?, tempo_item = ?, imagem_item = ? WHERE id_item = ?;";
    private static final String DELETE_QUERY = "DELETE FROM tb_item WHERE id_item = ?;";
    private static final String SEARCH_ONE_BY_ID_QUERY = "SELECT id_item, descricao_item, preco_uni, tempo_item, imagem_item FROM tb_item WHERE id_item = ?;";
    private static final String SEARCH_QUERY = "SELECT id_item, id_item, descricao_item, preco_uni, tempo_item, imagem_item FROM tb_item;";

    private Connection connection = null;

    
    public ItemDAO(Connection connection) throws DAOException{
        if (connection == null){
            throw new DAOException("Conexao nula ao criar ItemDAO");
        }
        
        this.connection = connection;
    }

    
    @Override
    public void insert(Item item) throws DAOException {
        try (PreparedStatement statement = connection.prepareStatement(INSERT_QUERY)) {
            statement.setString(1, item.getNome());
            statement.setDouble(2, item.getPreco());
            statement.setInt(3, item.getTempo());
            statement.setString(4, item.getImagem());
            
            statement.executeUpdate();
            
        } catch (SQLException e) {
            throw new DAOException("Erro ao inserir item: " + INSERT_QUERY, e);
        }
    }
    
    
    @Override
    public void update(Item item) throws DAOException {
        try (PreparedStatement statement = connection.prepareStatement(UPDATE_QUERY)) {
            statement.setString(1, item.getNome());
            statement.setDouble(2, item.getPreco());
            statement.setInt(3, item.getTempo());
            statement.setString(4, item.getImagem());
            
            statement.setInt(5, item.getId());
            
            statement.executeUpdate();
            
        } catch (SQLException e) {
            throw new DAOException("Erro ao atualizar item: " + UPDATE_QUERY, e);
        }
    }

    
    public void deleteById(int id) throws DAOException {
        try (PreparedStatement statement = connection.prepareStatement(DELETE_QUERY)) {
            statement.setInt(1, id);
            
            statement.executeUpdate();
            
        } catch (SQLException e) {
            throw new DAOException("Voce nao pode remover este item pois ele faz parte de um pedido!", e);
        }
    }
    

    @Override
    public Item searchById(int id) throws DAOException {
        Item item = null;
        
        try (PreparedStatement statement = connection.prepareStatement(SEARCH_ONE_BY_ID_QUERY)) {
            statement.setInt(1, id);
            
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    item = new Item();
                    item.setId(resultSet.getInt("id_item"));
                    item.setNome(resultSet.getString("descricao_item"));
                    item.setPreco(resultSet.getDouble("preco_uni"));
                    item.setTempo(resultSet.getInt("tempo_item"));
                    item.setImagem(resultSet.getString("imagem_item"));
                }
            }
            
        } catch (SQLException e) {
            throw new DAOException("Erro ao buscar item por ID: " + SEARCH_ONE_BY_ID_QUERY, e);
        }
        
        return item;
    }

    
    @Override
    public List<Item> searchAll() throws DAOException {
        List<Item> itens = new ArrayList<>();
        
        try (PreparedStatement statement = connection.prepareStatement(SEARCH_QUERY); 
                ResultSet resultSet = statement.executeQuery()) {
            
            
            while (resultSet.next()) {
                Item item = new Item();
                item.setId(resultSet.getInt("id_item"));
                item.setNome(resultSet.getString("descricao_item"));
                item.setPreco(resultSet.getDouble("preco_uni"));
                item.setTempo(resultSet.getInt("tempo_item"));
                item.setImagem(resultSet.getString("imagem_item"));
                itens.add(item);
            }
            
        } catch (SQLException e) {
            throw new DAOException("Erro ao buscar itens: " + SEARCH_QUERY, e);
        }
        
        return itens;
    }

    
    @Override
    public Item search(String name) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    
    @Override
    public void delete(Item item) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
