package com.ufpr.tads.web2.model.dao;

import com.ufpr.tads.web2.model.domain.Funcionario;
import com.ufpr.tads.web2.exception.DAOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class FuncionarioDAO implements DAO<Funcionario> {
    private static final String INSERT_QUERY = "INSERT INTO tb_funcionario (nome_funcionario, data_nascimento, email_funcionario, senha_funcionario) VALUES (?, ?, ?, ?);";
    private static final String UPDATE_QUERY = "UPDATE tb_funcionario SET nome_funcionario = ?, data_nascimento = ?, email_funcionario = ?, senha_funcionario = ? WHERE id_funcionario = ?;";
    private static final String DELETE_QUERY = "DELETE FROM tb_funcionario WHERE id_funcionario = ?;";
    private static final String SEARCH_ONE_BY_ID_QUERY = "SELECT id_funcionario, nome_funcionario, data_nascimento, email_funcionario, senha_funcionario FROM tb_funcionario WHERE id_funcionario = ?;";
    private static final String SEARCH_QUERY = "SELECT id_funcionario, nome_funcionario, data_nascimento, email_funcionario, senha_funcionario FROM tb_funcionario;";
    private static final String VALIDATE_LOGIN_QUERY = "SELECT id_funcionario, nome_funcionario, data_nascimento, email_funcionario, senha_funcionario FROM tb_funcionario WHERE email_funcionario = ? AND senha_funcionario = ?;";
    
    private Connection connection = null;

    
    public FuncionarioDAO(Connection connection) throws DAOException {
        if (connection == null) {
            throw new DAOException("Conexão nula ao criar FuncionarioDAO");
        }

        this.connection = connection;
    }
    
    
    public Funcionario validateLogin(String email, String hashedPassword) throws DAOException {
        Funcionario funcionario = null;
        
        try (PreparedStatement statement = connection.prepareStatement(VALIDATE_LOGIN_QUERY)) {
            statement.setString(1, email);
            statement.setString(2, hashedPassword);
            
            try (ResultSet resultSet = statement.executeQuery()) {
                
                if (resultSet.next()) {
                    funcionario = new Funcionario();
                    funcionario.setId(resultSet.getInt("id_funcionario"));
                    funcionario.setNome(resultSet.getString("nome_funcionario"));
                    funcionario.setDataNascimento(new Date(resultSet.getDate("data_nascimento").getTime()));
                    funcionario.setEmail(resultSet.getString("email_funcionario"));
                    funcionario.setSenha(resultSet.getString("senha_funcionario"));                   
                }
                
            }
        } catch(SQLException e) {
            throw new DAOException("Erro ao buscar funcionário: " + VALIDATE_LOGIN_QUERY, e);
        }
        
        return funcionario;
    }
    
    
    @Override
    public void insert(Funcionario funcionario) throws DAOException {
        try (PreparedStatement statement = connection.prepareStatement(INSERT_QUERY)) {
            statement.setString(1, funcionario.getNome());
            statement.setDate(2, new java.sql.Date(funcionario.getDataNascimento().getTime()));
            statement.setString(3, funcionario.getEmail());
            statement.setString(4, funcionario.getSenha());
            
            statement.executeUpdate();
            
        } catch (SQLException e) {
            throw new DAOException("Erro ao inserir funcionário: " + INSERT_QUERY , e);
        }
    }

    
    @Override
    public List<Funcionario> searchAll() throws DAOException {
        List<Funcionario> funcionarios = new ArrayList<>();
        
        try (PreparedStatement statement = connection.prepareStatement(SEARCH_QUERY);
                ResultSet resultSet = statement.executeQuery()) {
            
            while (resultSet.next()) {
                Funcionario funcionario = new Funcionario();
                funcionario.setId(resultSet.getInt("id_funcionario"));
                funcionario.setNome(resultSet.getString("nome_funcionario"));
                funcionario.setDataNascimento(new Date(resultSet.getDate("data_nascimento").getTime()));
                funcionario.setEmail(resultSet.getString("email_funcionario"));
                funcionario.setSenha(resultSet.getString("senha_funcionario"));
                
                funcionarios.add(funcionario);
            }
            
        } catch (SQLException e) {
            throw new DAOException("Erro ao listar funcionários: " + SEARCH_QUERY , e);
        }
        
        return funcionarios;
    }
    
    
    @Override
    public Funcionario searchById(int id) throws DAOException {
        Funcionario funcionario = null;
        
        try (PreparedStatement statement = connection.prepareStatement(SEARCH_ONE_BY_ID_QUERY)) {
            statement.setInt(1, id);
            
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    funcionario = new Funcionario();
                    funcionario.setId(resultSet.getInt("id_funcionario"));
                    funcionario.setNome(resultSet.getString("nome_funcionario"));
                    funcionario.setDataNascimento(new Date(resultSet.getDate("data_nascimento").getTime()));
                    funcionario.setEmail(resultSet.getString("email_funcionario"));
                    funcionario.setSenha(resultSet.getString("senha_funcionario"));
                }
            }
            
        } catch (SQLException e) {
            throw new DAOException("Erro ao buscar funcionário: " + SEARCH_ONE_BY_ID_QUERY, e);
        } 
        
        return funcionario;
    }
    
    
    @Override
    public void update(Funcionario funcionario) throws DAOException {
        try (PreparedStatement statement = connection.prepareStatement(UPDATE_QUERY)) {
            statement.setString(1, funcionario.getNome());
            statement.setDate(2, new java.sql.Date(funcionario.getDataNascimento().getTime()));
            statement.setString(3, funcionario.getEmail());
            statement.setString(4, funcionario.getSenha());

            statement.setInt(5, funcionario.getId());

            statement.executeUpdate();

        } catch (SQLException e) {
            throw new DAOException("Erro ao atualizar funcionário: " + UPDATE_QUERY , e);
        }
    }
    
    
    public void deleteById(int id) throws DAOException {
        try (PreparedStatement statement = connection.prepareStatement(DELETE_QUERY)) {
            statement.setInt(1, id);
            
            statement.executeUpdate();
            
        } catch (SQLException e) {
            throw new DAOException("Erro ao excluir funcionário: " + DELETE_QUERY , e);
        }
    }

    
    @Override
    public Funcionario search(String name) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Funcionario funcionario) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}