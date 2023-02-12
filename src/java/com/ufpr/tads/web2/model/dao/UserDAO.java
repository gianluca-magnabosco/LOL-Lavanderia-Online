package com.ufpr.tads.web2.model.dao;

import com.ufpr.tads.web2.model.domain.Cidade;
import com.ufpr.tads.web2.model.domain.Endereco;
import com.ufpr.tads.web2.model.domain.Estado;
import java.util.List;
import com.ufpr.tads.web2.model.domain.User;
import com.ufpr.tads.web2.exception.DAOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
 

public class UserDAO implements DAO<User> {
    private static final String VALIDATE_LOGIN_QUERY = "SELECT u.id_user, u.cpf_user, u.nome_user, u.email_user, u.telefone_user, u.senha_user, en.id_endereco, en.cep_endereco, en.logradouro_endereco, en.numero_endereco, en.complemento_endereco, en.bairro_endereco, c.id_cidade, c.nome_cidade, es.id_estado, es.nome_estado, es.uf_estado FROM tb_user u JOIN tb_endereco en ON (u.id_endereco = en.id_endereco) JOIN tb_cidade c ON (en.id_cidade = c.id_cidade) JOIN tb_estado es ON (es.id_estado = c.id_estado) WHERE u.email_user = ? AND u.senha_user = ?;";
    private static final String SEARCH_ONE_QUERY = "SELECT u.id_user, u.cpf_user, u.nome_user, u.email_user, u.telefone_user, u.senha_user, en.id_endereco, en.cep_endereco, en.logradouro_endereco, en.numero_endereco, en.complemento_endereco, en.bairro_endereco, c.id_cidade, c.nome_cidade, es.id_estado, es.nome_estado, es.uf_estado FROM tb_user u JOIN tb_endereco en ON (u.id_endereco = en.id_endereco) JOIN tb_cidade c ON (en.id_cidade = c.id_cidade) JOIN tb_estado es ON (es.id_estado = c.id_estado) WHERE u.id_user = ?;";
    private static final String SEARCH_ONE_BY_EMAIL_QUERY = "SELECT u.id_user, u.cpf_user, u.nome_user, u.email_user, u.telefone_user, u.senha_user, en.id_endereco, en.cep_endereco, en.logradouro_endereco, en.numero_endereco, en.complemento_endereco, en.bairro_endereco, c.id_cidade, c.nome_cidade, es.id_estado, es.nome_estado, es.uf_estado FROM tb_user u JOIN tb_endereco en ON (u.id_endereco = en.id_endereco) JOIN tb_cidade c ON (en.id_cidade = c.id_cidade) JOIN tb_estado es ON (es.id_estado = c.id_estado) WHERE u.email_user = ?;";
    private static final String SEARCH_ALL_QUERY = "SELECT u.id_user, u.cpf_user, u.nome_user, u.email_user, u.telefone_user, u.senha_user, en.id_endereco, en.cep_endereco, en.logradouro_endereco, en.numero_endereco, en.complemento_endereco, en.bairro_endereco, c.id_cidade, c.nome_cidade, es.id_estado, es.nome_estado, es.uf_estado FROM tb_user u JOIN tb_endereco en ON (u.id_endereco = en.id_endereco) JOIN tb_cidade c ON (en.id_cidade = c.id_cidade) JOIN tb_estado es ON (es.id_estado = c.id_estado);";
    private static final String INSERT_QUERY = "INSERT INTO tb_user (id_endereco, cpf_user, nome_user, email_user, telefone_user, senha_user) VALUES (?, ?, ?, ?, ?, ?);";
    
    private Connection con = null;
    
    
    public UserDAO(Connection con) throws DAOException {
        if (con == null) {
            throw new DAOException("Conexao nula ao criar UserDAO.");
        }
        
        this.con = con;
    }

    
    public User validateLogin(String email, String hashedPassword) throws DAOException {

        try (PreparedStatement st = con.prepareStatement(VALIDATE_LOGIN_QUERY)) {
            st.setString(1, email);
            st.setString(2, hashedPassword);
            
            try (ResultSet rs = st.executeQuery()) {

                if (rs.next()) {
                    Estado estado = new Estado();
                    estado.setId(rs.getInt("id_estado"));
                    estado.setNome(rs.getString("nome_estado"));
                    estado.setUf(rs.getString("uf_estado"));
                    
                    Cidade cidade = new Cidade();
                    cidade.setId(rs.getInt("id_cidade"));
                    cidade.setNome(rs.getString("nome_cidade"));
                    cidade.setEstado(estado);
                    
                    Endereco endereco = new Endereco();
                    endereco.setId(rs.getInt("id_endereco"));
                    endereco.setCep(rs.getString("cep_endereco"));
                    endereco.setLogradouro(rs.getString("logradouro_endereco"));
                    endereco.setNumero(rs.getInt("numero_endereco"));
                    endereco.setComplemento(rs.getString("complemento_endereco"));
                    endereco.setBairro(rs.getString("bairro_endereco"));
                    endereco.setCidade(cidade);
                    
                    User user = new User();
                    user.setId(rs.getInt("id_user"));
                    user.setEndereco(endereco);
                    user.setCpf(rs.getString("cpf_user"));
                    user.setFullName(rs.getString("nome_user"));
                    user.setEmail(rs.getString("email_user"));
                    user.setPhoneNumber(rs.getString("telefone_user"));
                    user.setPassword(rs.getString("senha_user"));

                    return user;
                }
            }
            
            return null;
        }
        catch(SQLException e) {
            throw new DAOException("Erro ao validar login do usuario: " + VALIDATE_LOGIN_QUERY, e);
        }
    }
    
    
    @Override
    public User searchById(int id) throws DAOException {
        
        try (PreparedStatement st = con.prepareStatement(SEARCH_ONE_QUERY)) {
            st.setInt(1, id);
            
            try (ResultSet rs = st.executeQuery()) {
            
                while (rs.next()) {
                    Estado estado = new Estado();
                    estado.setId(rs.getInt("id_estado"));
                    estado.setNome(rs.getString("nome_estado"));
                    estado.setUf(rs.getString("uf_estado"));
                    
                    Cidade cidade = new Cidade();
                    cidade.setId(rs.getInt("id_cidade"));
                    cidade.setNome(rs.getString("nome_cidade"));
                    cidade.setEstado(estado);
                    
                    Endereco endereco = new Endereco();
                    endereco.setId(rs.getInt("id_endereco"));
                    endereco.setCep(rs.getString("cep_endereco"));
                    endereco.setLogradouro(rs.getString("logradouro_endereco"));
                    endereco.setNumero(rs.getInt("numero_endereco"));
                    endereco.setComplemento(rs.getString("complemento_endereco"));
                    endereco.setBairro(rs.getString("bairro_endereco"));
                    endereco.setCidade(cidade);
                    
                    User user = new User();
                    user.setId(rs.getInt("id_user"));
                    user.setEndereco(endereco);
                    user.setCpf(rs.getString("cpf_user"));
                    user.setFullName(rs.getString("nome_user"));
                    user.setEmail(rs.getString("email_user"));
                    user.setPhoneNumber(rs.getString("telefone_user"));
                    user.setPassword(rs.getString("senha_user"));

                    return user;
                }
            }
            return null;
        }
        catch(SQLException e) {
            throw new DAOException("Erro ao buscar usuario por id: " + SEARCH_ONE_QUERY, e);
        }
    }

    
    @Override
    public User search(String email) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(SEARCH_ONE_BY_EMAIL_QUERY)) {
            st.setString(1, email);
            
            try (ResultSet rs = st.executeQuery()) {
            
                while (rs.next()) {
                    Estado estado = new Estado();
                    estado.setId(rs.getInt("id_estado"));
                    estado.setNome(rs.getString("nome_estado"));
                    estado.setUf(rs.getString("uf_estado"));
                    
                    Cidade cidade = new Cidade();
                    cidade.setId(rs.getInt("id_cidade"));
                    cidade.setNome(rs.getString("nome_cidade"));
                    cidade.setEstado(estado);
                    
                    Endereco endereco = new Endereco();
                    endereco.setId(rs.getInt("id_endereco"));
                    endereco.setCep(rs.getString("cep_endereco"));
                    endereco.setLogradouro(rs.getString("logradouro_endereco"));
                    endereco.setNumero(rs.getInt("numero_endereco"));
                    endereco.setComplemento(rs.getString("complemento_endereco"));
                    endereco.setBairro(rs.getString("bairro_endereco"));
                    endereco.setCidade(cidade);
                    
                    User user = new User();
                    user.setId(rs.getInt("id_user"));
                    user.setEndereco(endereco);
                    user.setCpf(rs.getString("cpf_user"));
                    user.setFullName(rs.getString("nome_user"));
                    user.setEmail(rs.getString("email_user"));
                    user.setPhoneNumber(rs.getString("telefone_user"));
                    user.setPassword(rs.getString("senha_user"));

                    return user;
                }
            }
            return null;
        }
        catch(SQLException e) {
            throw new DAOException("Erro ao buscar usuario por e-mail: " + SEARCH_ONE_BY_EMAIL_QUERY, e);
        }        
    }
    
    
    @Override
    public List<User> searchAll() throws DAOException {
        List<User> list = new ArrayList<>();
        
        try (PreparedStatement st = con.prepareStatement(SEARCH_ALL_QUERY);
                ResultSet rs = st.executeQuery()) {
            
            while (rs.next()) {
                Estado estado = new Estado();
                estado.setId(rs.getInt("id_estado"));
                estado.setNome(rs.getString("nome_estado"));
                estado.setUf(rs.getString("uf_estado"));

                Cidade cidade = new Cidade();
                cidade.setId(rs.getInt("id_cidade"));
                cidade.setNome(rs.getString("nome_cidade"));
                cidade.setEstado(estado);

                Endereco endereco = new Endereco();
                endereco.setId(rs.getInt("id_endereco"));
                endereco.setCep(rs.getString("cep_endereco"));
                endereco.setLogradouro(rs.getString("logradouro_endereco"));
                endereco.setNumero(rs.getInt("numero_endereco"));
                endereco.setComplemento(rs.getString("complemento_endereco"));
                endereco.setBairro(rs.getString("bairro_endereco"));
                endereco.setCidade(cidade);

                User user = new User();
                user.setId(rs.getInt("id_user"));
                user.setEndereco(endereco);
                user.setCpf(rs.getString("cpf_user"));
                user.setFullName(rs.getString("nome_user"));
                user.setEmail(rs.getString("email_user"));
                user.setPhoneNumber(rs.getString("telefone_user"));
                user.setPassword(rs.getString("senha_user"));
                
                list.add(user);
            }
            
            return list;
        }
        catch(SQLException e) {
            throw new DAOException("Erro ao buscar usuarios: " + SEARCH_ALL_QUERY, e);
        }
    }
    

    @Override
    public void insert(User user) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(INSERT_QUERY)) { 
            st.setInt(1, user.getEndereco().getId());
            st.setString(2, user.getCpf());
            st.setString(3, user.getFullName());
            st.setString(4, user.getEmail());
            st.setString(5, user.getPhoneNumber());
            st.setString(6, user.getPassword());
            
            st.executeUpdate();
        }
        catch(SQLException e) {
            throw new DAOException("Erro ao inserir usuario: " + INSERT_QUERY, e);
        }
    }

    @Override
    public void update(User t) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(User t) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }


}
