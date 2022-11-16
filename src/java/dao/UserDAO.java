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
    private static final String VALIDATE_LOGIN_QUERY = "SELECT id_user, id_endereco, cpf_user, nome_user, email_user, telefone_user, senha_user, tipo_user FROM tb_user WHERE email_user = ? AND senha_user = ?;";
    private static final String SEARCH_ONE_QUERY = "SELECT id_user, id_endereco, cpf_user, nome_user, email_user, telefone_user, senha_user, tipo_user FROM tb_user WHERE id_user = ?;";
    private static final String SEARCH_ONE_BY_EMAIL_QUERY = "SELECT id_user, id_endereco, cpf_user, nome_user, email_user, telefone_user, senha_user, tipo_user FROM tb_user WHERE email_user = ?;";
    private static final String SEARCH_ALL_QUERY = "SELECT id_user, id_endereco, cpf_user, nome_user, email_user, telefone_user, senha_user, tipo_user FROM tb_user;";
    private static final String INSERT_QUERY = "INSERT INTO tb_user (id_endereco, cpf_user, nome_user, email_user, telefone_user, senha_user, tipo_user) VALUES (?, ?, ?, ?, ?, ?, ?);";
    private static final String UPDATE_QUERY = "UPDATE tb_user SET cpf_user = ?, nome_user = ?, email_user = ?, telefone_user = ?, senha_user = ?, tipo_user = ? WHERE id_user = ?;";
    private static final String DELETE_QUERY = "DELETE FROM tb_user WHERE id_user = ? AND id_endereco = ? AND cpf_user = ? AND nome_user = ? AND email_user = ? AND telefone_user = ? AND senha_user = ? AND tipo_user = ?;";
    
    
    private Connection con = null;
    
    
    public UserDAO(Connection con) throws DAOException {
        if (con == null) {
            throw new DAOException("Conexão nula ao criar UserDAO.");
        }
        
        this.con = con;
    }

    
    public User validateLogin(String email, String hashedPassword) throws DAOException {

        try (PreparedStatement st = con.prepareStatement(VALIDATE_LOGIN_QUERY)) {
            st.setString(1, email);
            st.setString(2, hashedPassword);
            
            try (ResultSet rs = st.executeQuery()) {

                while (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id_user"));
                    user.setIdEndereco(rs.getInt("id_endereco"));
                    user.setCpf(rs.getString("cpf_user"));
                    user.setFullName(rs.getString("nome_user"));
                    user.setEmail(rs.getString("email_user"));
                    user.setPhoneNumber(rs.getString("telefone_user"));
                    user.setPassword(rs.getString("senha_user"));
                    user.setRole(rs.getString("tipo_user"));

                    return user;
                }
            }
            
            return null;
        }
        catch(SQLException e) {
            throw new DAOException("Erro ao buscar usuário: " + VALIDATE_LOGIN_QUERY, e);
        }
    }
    
    
    @Override
    public User searchById(int id) throws DAOException {
        
        try (PreparedStatement st = con.prepareStatement(SEARCH_ONE_QUERY)) {
            st.setInt(1, id);
            
            try (ResultSet rs = st.executeQuery()) {
            
                while (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id_user"));
                    user.setIdEndereco(rs.getInt("id_endereco"));
                    user.setCpf(rs.getString("cpf_user"));
                    user.setFullName(rs.getString("nome_user"));
                    user.setEmail(rs.getString("email_user"));
                    user.setPhoneNumber(rs.getString("telefone_user"));
                    user.setPassword(rs.getString("senha_user"));
                    user.setRole(rs.getString("tipo_user"));

                    return user;
                }
            }
            return null;
        }
        catch(SQLException e) {
            throw new DAOException("Erro ao buscar usuário: " + SEARCH_ONE_QUERY, e);
        }
    }

    
    @Override
    public User search(String email) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(SEARCH_ONE_BY_EMAIL_QUERY)) {
            st.setString(1, email);
            
            try (ResultSet rs = st.executeQuery()) {
            
                while (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id_user"));
                    user.setIdEndereco(rs.getInt("id_endereco"));
                    user.setCpf(rs.getString("cpf_user"));
                    user.setFullName(rs.getString("nome_user"));
                    user.setEmail(rs.getString("email_user"));
                    user.setPhoneNumber(rs.getString("telefone_user"));
                    user.setPassword(rs.getString("senha_user"));
                    user.setRole(rs.getString("tipo_user"));

                    return user;
                }
            }
            return null;
        }
        catch(SQLException e) {
            throw new DAOException("Erro ao buscar usuário: " + SEARCH_ONE_BY_EMAIL_QUERY, e);
        }        
    }
    
    
    @Override
    public List<User> searchAll() throws DAOException {
        List<User> list = new ArrayList<>();
        
        try (PreparedStatement st = con.prepareStatement(SEARCH_ALL_QUERY);
                ResultSet rs = st.executeQuery()) {
            
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id_user"));
                user.setIdEndereco(rs.getInt("id_endereco"));
                user.setCpf(rs.getString("cpf_user"));
                user.setFullName(rs.getString("nome_user"));
                user.setEmail(rs.getString("email_user"));
                user.setPhoneNumber(rs.getString("telefone_user"));
                user.setPassword(rs.getString("senha_user"));
                user.setRole(rs.getString("tipo_user"));
                
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
            st.setInt(1, user.getIdEndereco());
            st.setString(2, user.getCpf());
            st.setString(3, user.getFullName());
            st.setString(4, user.getEmail());
            st.setString(5, user.getPhoneNumber());
            st.setString(6, user.getPassword());
            st.setString(7, user.getRole());
            
            st.executeUpdate();
        }
        catch(SQLException e) {
            throw new DAOException("Erro ao inserir usuário: " + INSERT_QUERY, e);
        }
    }


    @Override
    public void update(User user) throws DAOException {
        
        try (PreparedStatement st = con.prepareStatement(UPDATE_QUERY)) {
            st.setString(1, user.getCpf());
            st.setString(2, user.getFullName());
            st.setString(3, user.getEmail());
            st.setString(4, user.getPhoneNumber());
            st.setString(5, user.getPassword());
            st.setString(6, user.getRole());
            
            st.setInt(7, user.getId());
            
            st.executeUpdate();
        }
        catch(SQLException e) {
            throw new DAOException("Erro ao alterar usuário: " + UPDATE_QUERY, e);
        }
    }
    

    @Override
    public void delete(User user) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(DELETE_QUERY)) {
            st.setInt(1, user.getId());
            st.setInt(2, user.getIdEndereco());
            st.setString(3, user.getCpf());
            st.setString(4, user.getFullName());
            st.setString(5, user.getEmail());
            st.setString(6, user.getPhoneNumber());
            st.setString(7, user.getPassword());
            st.setString(8, user.getRole());
            
            st.executeUpdate();
        }
        catch(SQLException e) {
            throw new DAOException("Erro ao remover usuário: " + DELETE_QUERY, e);
        }
    }

}
