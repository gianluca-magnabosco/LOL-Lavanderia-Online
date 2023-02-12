package com.ufpr.tads.web2.model.dao;

import com.ufpr.tads.web2.model.domain.Cidade;
import com.ufpr.tads.web2.model.domain.Estado;
import com.ufpr.tads.web2.exception.DAOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class CidadeDAO implements DAO<Cidade> {
    private static final String SEARCH_ONE_BY_ID_QUERY = "SELECT c.id_cidade, c.nome_cidade, es.id_estado, es.nome_estado, es.uf_estado FROM tb_cidade c JOIN tb_estado es ON (c.id_estado = es.id_estado) WHERE c.id_cidade = ?;";
    private static final String SEARCH_ONE_BY_NAME_QUERY = "SELECT c.id_cidade, c.nome_cidade, es.id_estado, es.nome_estado, es.uf_estado FROM tb_cidade c JOIN tb_estado es ON (c.id_estado = es.id_estado) WHERE c.nome_cidade = ?;";
    private static final String SEARCH_ALL_QUERY = "SELECT c.id_cidade, c.nome_cidade, es.id_estado, es.nome_estado, es.uf_estado FROM tb_cidade c JOIN tb_estado es ON (c.id_estado = es.id_estado);";
    
    
    private Connection con = null;
    
    
    public CidadeDAO(Connection con) throws DAOException {
        if (con == null) {
            throw new DAOException("Conexao nula ao criar CidadeDAO.");
        }
        
        this.con = con;
    }    
    
    
    @Override
    public Cidade search(String name) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(SEARCH_ONE_BY_NAME_QUERY)) {
            st.setString(1, name);
            
            try (ResultSet rs = st.executeQuery()) {
            
                while (rs.next()) {
                    Cidade cidade = new Cidade();
                    cidade.setId(rs.getInt("id_cidade"));
                    Estado estado = new Estado();
                    estado.setId(rs.getInt("id_estado"));
                    estado.setNome("nome_estado");
                    estado.setUf("uf_estado");
                    cidade.setEstado(estado);
                    cidade.setNome(rs.getString("nome_cidade"));

                    return cidade;
                }
            }
            
            return null;
        }
        catch(SQLException e) {
            throw new DAOException("Erro ao buscar cidade por nome: " + SEARCH_ONE_BY_NAME_QUERY, e);
        }    
    }

    
    @Override
    public Cidade searchById(int id) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(SEARCH_ONE_BY_ID_QUERY)) {
            st.setInt(1, id);
            
            try (ResultSet rs = st.executeQuery()) {
            
                while (rs.next()) {
                    Cidade cidade = new Cidade();
                    cidade.setId(rs.getInt("id_cidade"));
                    Estado estado = new Estado();
                    estado.setId(rs.getInt("id_estado"));
                    estado.setNome("nome_estado");
                    estado.setUf("uf_estado");
                    cidade.setEstado(estado);
                    cidade.setNome(rs.getString("nome_cidade"));

                    return cidade;
                }
            }
            
            return null;
        }
        catch(SQLException e) {
            throw new DAOException("Erro ao buscar cidade por id: " + SEARCH_ONE_BY_ID_QUERY, e);
        }  
    }

    
    @Override
    public List<Cidade> searchAll() throws DAOException {
        List<Cidade> list = new ArrayList<>();
        
        try (PreparedStatement st = con.prepareStatement(SEARCH_ALL_QUERY);
                ResultSet rs = st.executeQuery()) {
            
            while (rs.next()) {
                Cidade cidade = new Cidade();
                cidade.setId(rs.getInt("id_cidade"));
                Estado estado = new Estado();
                estado.setId(rs.getInt("id_estado"));
                estado.setNome("nome_estado");
                estado.setUf("uf_estado");
                cidade.setEstado(estado);
                cidade.setNome(rs.getString("nome_cidade"));
                
                list.add(cidade);
            }
            
            return list;
        }
        catch(SQLException e) {
            throw new DAOException("Erro ao buscar cidades: " + SEARCH_ALL_QUERY, e);
        }   
    }

    
    
    
    
    @Override
    public void insert(Cidade t) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Cidade t) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Cidade t) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    
}
