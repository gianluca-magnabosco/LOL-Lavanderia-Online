package com.ufpr.tads.web2.model.dao;

import com.ufpr.tads.web2.model.domain.Cidade;
import com.ufpr.tads.web2.model.domain.Endereco;
import com.ufpr.tads.web2.model.domain.Estado;
import com.ufpr.tads.web2.exception.DAOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class EnderecoDAO implements DAO<Endereco> {
    private static final String SEARCH_ONE_BY_ID_QUERY = "SELECT en.id_endereco, en.cep_endereco, en.logradouro_endereco, en.numero_endereco, en.complemento_endereco, en.bairro_endereco, c.id_cidade, c.nome_cidade, es.id_estado, es.nome_estado, es.uf_estado FROM tb_endereco en JOIN tb_cidade c ON (en.id_cidade = c.id_cidade) JOIN tb_estado es ON (c.id_estado = es.id_estado) WHERE id_endereco = ?;";
    private static final String SEARCH_ALL_QUERY = "SELECT en.id_endereco, en.cep_endereco, en.logradouro_endereco, en.numero_endereco, en.complemento_endereco, en.bairro_endereco, c.id_cidade, c.nome_cidade, es.id_estado, es.nome_estado, es.uf_estado FROM tb_endereco en JOIN tb_cidade c ON (en.id_cidade = c.id_cidade) JOIN tb_estado es ON (c.id_estado = es.id_estado);";
    private static final String INSERT_QUERY = "INSERT INTO tb_endereco (id_cidade, cep_endereco, logradouro_endereco, numero_endereco, complemento_endereco, bairro_endereco) VALUES (?, ?, ?, ?, ?, ?);";
    
    private int currentId;
    
    private Connection con = null;
    
    
    public EnderecoDAO(Connection con) throws DAOException {
        if (con == null) {
            throw new DAOException("Conexão nula ao criar EnderecoDAO.");
        }
        
        this.con = con;
    }    
    
    
    public int getCurrentId() {
        return this.currentId;
    }
    
    public void setCurrentId(int id) {
        this.currentId = id;
    }


    @Override
    public Endereco searchById(int id) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(SEARCH_ONE_BY_ID_QUERY)) {
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
                    endereco.setCidade(cidade);
                    endereco.setCep(rs.getString("cep_endereco"));
                    endereco.setLogradouro(rs.getString("logradouro_endereco"));
                    endereco.setNumero(rs.getInt("numero_endereco"));
                    endereco.setComplemento(rs.getString("complemento_endereco"));
                    endereco.setBairro(rs.getString("bairro_endereco"));

                    return endereco;
                }
            }
            
            return null;
        }
        catch(SQLException e) {
            throw new DAOException("Erro ao buscar endereço: " + SEARCH_ONE_BY_ID_QUERY, e);
        }  
    }

    
    @Override
    public List<Endereco> searchAll() throws DAOException {
        List<Endereco> list = new ArrayList<>();
        
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
                endereco.setCidade(cidade);
                endereco.setCep(rs.getString("cep_endereco"));
                endereco.setLogradouro(rs.getString("logradouro_endereco"));
                endereco.setNumero(rs.getInt("numero_endereco"));
                endereco.setComplemento(rs.getString("complemento_endereco"));
                endereco.setBairro(rs.getString("bairro_endereco"));
                
                list.add(endereco);
            }
            
            return list;
        }
        catch(SQLException e) {
            throw new DAOException("Erro ao buscar endereços: " + SEARCH_ALL_QUERY, e);
        }   
    }

    
    @Override
    public void insert(Endereco endereco) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(INSERT_QUERY, Statement.RETURN_GENERATED_KEYS)) { 
            st.setInt(1, endereco.getCidade().getId());
            st.setString(2, endereco.getCep());
            st.setString(3, endereco.getLogradouro());
            st.setInt(4, endereco.getNumero());
            st.setString(5, endereco.getComplemento());
            st.setString(6, endereco.getBairro());
            
            st.executeUpdate();
            
            ResultSet keys = st.getGeneratedKeys();
            keys.next();
            this.setCurrentId(keys.getInt(1));
        }
        catch(SQLException e) {
            throw new DAOException("Erro ao inserir endereço: " + INSERT_QUERY, e);
        }
    }

    
    
    
    
    @Override
    public Endereco search(String name) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    @Override
    public void update(Endereco t) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Endereco t) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    
    
}
