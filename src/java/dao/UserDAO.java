package dao;

import java.util.List;
import domain.User;
import exception.DAOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
 

public class UserDAO implements DAO<User> {
    private static final String VALIDATE_LOGIN_QUERY = "SELECT * FROM Users WHERE email = ? AND senha = ?";
    private static final String SEARCH_ONE_QUERY = "SELECT * FROM Users WHERE id = ?;";
    private static final String SEARCH_ALL_QUERY = "SELECT * FROM Users;";
    private static final String INSERT_QUERY = "INSERT INTO Users (cpf, nome, email, endereco, telefone, senha) VALUES (?, ?, ?, ?, ?, ?);";
    private static final String UPDATE_QUERY = "UPDATE Users SET cpf = ?, nome = ?, email = ?, endereco = ?, telefone = ?, senha = ? WHERE id = ?;";
    private static final String DELETE_QUERY = "DELETE FROM Users WHERE cpf = ? AND nome = ? AND email = ? AND endereco = ? AND telefone = ? AND senha = ?;";
    
    private Connection con = null;
    
    
    public UserDAO(Connection con) throws DAOException {
        if (con == null) {
            throw new DAOException("Conexão nula ao criar UserDAO.");
        }
        
        this.con = con;
    }

    
    public User validateLogin(String email, String password) throws DAOException {

        try (PreparedStatement st = con.prepareStatement(VALIDATE_LOGIN_QUERY)) {
            st.setString(1, email);
            st.setString(2, password);
            
            ResultSet rs = st.executeQuery();
            
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setCpf(rs.getString("cpf"));
                user.setFullName(rs.getString("nome"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("endereco"));
                user.setPhoneNumber(rs.getString("telefone"));
                user.setPassword(rs.getString("senha"));
                
                return user;
            }
            
            return null;
        }
        catch(SQLException e) {
            throw new DAOException("Erro ao buscar usuário: " + VALIDATE_LOGIN_QUERY, e);
        }
    }
    
    
    @Override
    public User searchOne(int id) throws DAOException {
        
        try (PreparedStatement st = con.prepareStatement(SEARCH_ONE_QUERY)) {
            st.setInt(1, id);
            
            ResultSet rs = st.executeQuery();
            
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setCpf(rs.getString("cpf"));
                user.setFullName(rs.getString("nome"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("endereco"));
                user.setPhoneNumber(rs.getString("telefone"));
                user.setPassword(rs.getString("senha"));
                
                return user;
            }
            
            return null;
        }
        catch(SQLException e) {
            throw new DAOException("Erro ao buscar usuário: " + SEARCH_ONE_QUERY, e);
        }
    }


    @Override
    public List<User> searchAll() throws DAOException {
        List<User> list = new ArrayList<>();
        
        try (PreparedStatement st = con.prepareStatement(SEARCH_ALL_QUERY)) {
            ResultSet rs = st.executeQuery();
            
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setCpf(rs.getString("cpf"));
                user.setFullName(rs.getString("nome"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("endereco"));
                user.setPhoneNumber(rs.getString("telefone"));
                user.setPassword(rs.getString("senha"));
                
                list.add(user);
            }
            
            return list;
        }
        catch(SQLException e) {
            throw new DAOException("Erro ao buscar usuários: " + SEARCH_ALL_QUERY, e);
        }
    }
    

    @Override
    public void insert(User user) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(INSERT_QUERY)) { 
            st.setString(1, user.getCpf());
            st.setString(2, user.getFullName());
            st.setString(3, user.getEmail());
            st.setString(4, user.getAddress());
            st.setString(5, user.getPhoneNumber());
            st.setString(6, user.getPassword());
            
            st.executeUpdate();
        }
        catch(SQLException e) {
            throw new DAOException("Erro ao inserir usuário: " + INSERT_QUERY, e);
        }
    }


    @Override
    public void update(int id, User newUser) throws DAOException {
        
        try (PreparedStatement st = con.prepareStatement(UPDATE_QUERY)) {
            st.setString(1, newUser.getCpf());
            st.setString(2, newUser.getFullName());
            st.setString(3, newUser.getEmail());
            st.setString(4, newUser.getAddress());
            st.setString(5, newUser.getPhoneNumber());
            st.setString(6, newUser.getPassword());
            
            st.setInt(7, id);
            
            st.executeUpdate();
        }
        catch(SQLException e) {
            throw new DAOException("Erro ao alterar usuário: " + UPDATE_QUERY, e);
        }
    }
    

    @Override
    public void delete(User user) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(DELETE_QUERY)) {
            st.setString(1, user.getCpf());
            st.setString(2, user.getFullName());
            st.setString(3, user.getEmail());
            st.setString(4, user.getAddress());
            st.setString(5, user.getPhoneNumber());
            st.setString(6, user.getPassword());
            
            st.executeUpdate();
        }
        catch(SQLException e) {
            throw new DAOException("Erro ao remover usuário: " + DELETE_QUERY, e);
        }
    }

}
