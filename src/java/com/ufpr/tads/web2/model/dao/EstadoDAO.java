package com.ufpr.tads.web2.model.dao;

import com.ufpr.tads.web2.model.domain.Estado;
import com.ufpr.tads.web2.exception.DAOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class EstadoDAO implements DAO<Estado> {
    private static final String SEARCH_ONE_BY_ID_QUERY = "SELECT id_estado, nome_estado, uf_estado FROM tb_estado WHERE id_estado = ?;";
    private static final String SEARCH_ONE_BY_NAME_QUERY = "SELECT id_estado, nome_estado, uf_estado FROM tb_estado WHERE nome_estado = ?;";
    private static final String SEARCH_ALL_QUERY = "SELECT id_estado, nome_estado, uf_estado FROM tb_estado;";
    
    
    private Connection con = null;
    
    
    public EstadoDAO(Connection con) throws DAOException {
        if (con == null) {
            throw new DAOException("Conexao nula ao criar EstadoDAO.");
        }
        
        this.con = con;
    }
    
    
    @Override
    public Estado search(String name) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(SEARCH_ONE_BY_NAME_QUERY)) {
            st.setString(1, name);
            
            try (ResultSet rs = st.executeQuery()) {
            
                while (rs.next()) {
                    Estado estado = new Estado();
                    estado.setId(rs.getInt("id_estado"));
                    estado.setNome(rs.getString("nome_estado"));
                    estado.setUf(rs.getString("uf_estado"));

                    return estado;
                }
            }
            
            return null;
        }
        catch(SQLException e) {
            throw new DAOException("Erro ao buscar estado por nome: " + SEARCH_ONE_BY_NAME_QUERY, e);
        }          
    }

    @Override
    public Estado searchById(int id) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(SEARCH_ONE_BY_ID_QUERY)) {
            st.setInt(1, id);
            
            try (ResultSet rs = st.executeQuery()) {
            
                while (rs.next()) {
                    Estado estado = new Estado();
                    estado.setId(rs.getInt("id_estado"));
                    estado.setNome(rs.getString("nome_estado"));
                    estado.setUf(rs.getString("uf_estado"));

                    return estado;
                }
            }
            
            return null;
        }
        catch(SQLException e) {
            throw new DAOException("Erro ao buscar estado por id: " + SEARCH_ONE_BY_ID_QUERY, e);
        }        
    }

    @Override
    public List<Estado> searchAll() throws DAOException {
        List<Estado> list = new ArrayList<>();
        
        try (PreparedStatement st = con.prepareStatement(SEARCH_ALL_QUERY);
                ResultSet rs = st.executeQuery()) {
            
            while (rs.next()) {
                Estado estado = new Estado();
                estado.setId(rs.getInt("id_estado"));
                estado.setNome(rs.getString("nome_estado"));
                estado.setUf(rs.getString("uf_estado"));
                
                list.add(estado);
            }
            
            return list;
        }
        catch(SQLException e) {
            throw new DAOException("Erro ao buscar estados: " + SEARCH_ALL_QUERY, e);
        }        
    }
    
    
    

    @Override
    public void insert(Estado t) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Estado t) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Estado t) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
