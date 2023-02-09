package com.ufpr.tads.web2.model.dao;

import com.ufpr.tads.web2.model.domain.Funcionario;
import com.ufpr.tads.web2.exception.DAOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FuncionarioDAO implements DAO<Funcionario> {
    private static final String INSERT_QUERY = "INSERT INTO tb_funcionario (nome_user, data_nascimento, email_user, senha_user) VALUES (?, ?, ?, ?)";
    private static final String UPDATE_QUERY = "UPDATE tb_funcionario SET nome_user = ?, email_user = ?, senha_user = ? WHERE id_user = ?";
    private static final String DELETE_QUERY = "DELETE FROM tb_funcionario WHERE id_user = ?";
    private static final String SEARCH_ONE_BY_ID_QUERY = "SELECT nome_user, data_nascimento, email_user, senha_user FROM funcionario WHERE id = ?";
    private static final String LIST_QUERY = "SELECT nome_user, data_nascimento, email_user, senha_user FROM tb_funcionario";

  private Connection connection = null;

  public FuncionarioDAO(Connection connection) throws DAOException{
    if (connection = null){
        throw new DAOException("Conexão nula ao criar FuncionarioDAO");
    }
    
    this.connection = connection;
  }

  public void inserir(Funcionario funcionario) throws DAOException {
    try (PreparedStatement statement = connection.prepareStatement(INSERT_QUERY)) {
      statement.setString(1, funcionario.getNomeUser());
      statement.setDate(2, funcionario.getDataNascimento());
      statement.setString(3, funcionario.getEmailUser());
      statement.setString(4, funcionario.getSenhaUser());
      statement.executeUpdate();
    } catch (SQLException e) {
      throw new DAOException("Erro ao inserir funcionário" + INSERT_QUERY , e);
    }
  }

  public List<Funcionario> listar() throws DAOException {
    List<Funcionario> funcionarios = new ArrayList<>();
    try (PreparedStatement statement = connection.prepareStatement(LIST_QUERY)) {
      ResultSet resultSet = statement.executeQuery();
      while (resultSet.next()) {
        Funcionario funcionario = new Funcionario();
        funcionario.setIdUser(resultSet.getInt("id_user"));
        funcionario.setNomeUser(resultSet.getString("nome_user"));
        funcionario.setDataNascimento(resultSet.getDate("data_nascimento").getTime());
        funcionario.setEmailUser(resultSet.getString("email_user"));
        funcionario.setSenhaUser(resultSet.getString("senha_user"));
        funcionarios.add(funcionario);
      }
    } catch (SQLException e) {
      throw new DAOException("Erro ao listar funcionários" + LIST_QUERY , e);
    }
    return funcionarios;
  }

  public Funcionario buscarPorId(int idUser) throws DAOException {
    Funcionario funcionario = null;
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try {
        conn = ConnectionFactory.getConnection();
        stmt = conn.prepareStatement(SEARCH_ONE_BY_ID_QUERY);
        stmt.setInt(1, idUser);
        rs = stmt.executeQuery();
        if (rs.next()) {
            funcionario = new Funcionario();
            funcionario.setIdUser(rs.getInt("id_user"));
            funcionario.setNomeUser(rs.getString("nome_user"));
            funcionario.setDataNascimento(rs.getDate("data_nascimento").getTime());
            funcionario.setEmailUser(rs.getString("email_user"));
            funcionario.setSenhaUser(rs.getString("senha_user"));
        }
    } catch (SQLException e) {
        throw new DAOException("Erro ao buscar funcionário: " + SEARCH_ONE_BY_ID_QUERY, e);
    } 
    return funcionario;
}

  public void atualizar(Funcionario funcionario) throws DAOException {
    try (PreparedStatement statement = connection.prepareStatement(UPDATE_QUERY)) {
      statement.setString(1, funcionario.getNomeUser());
      statement.setString(2, funcionario.getEmailUser());
      statement.setString(3, funcionario.getSenhaUser());
      statement.setInt(4, funcionario.getIdUser());
      statement.executeUpdate();
    } catch (SQLException e) {
      throw new DAOException("Erro ao atualizar funcionário" + UPDATE_QUERY , e);
    }
  }

  public void excluir(int id) throws DAOException {
    try (PreparedStatement statement = connection.prepareStatement(DELETE_QUERY)) {
      statement.setInt(1, id);
      statement.executeUpdate();
    } catch (SQLException e) {
      throw new DAOException("Erro ao excluir funcionário" + DELETE_QUERY , e);
    }
  }}