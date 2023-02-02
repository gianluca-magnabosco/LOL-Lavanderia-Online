package com.ufpr.tads.web2.model.facade;

import com.ufpr.tads.web2.exception.DAOException;
import com.ufpr.tads.web2.model.beans.LoginBean;
import com.ufpr.tads.web2.model.dao.ConnectionFactory;
import com.ufpr.tads.web2.model.dao.UserDAO;
import com.ufpr.tads.web2.model.domain.User;
import com.ufpr.tads.web2.security.HashFunction;

/**
 *
 * @author Gian
 */
public class LoginFacade {
    
    public static User login(String userEmail, String userPassword, LoginBean login) {
        if (!userEmail.matches("[a-zA-Z0-9._%+-]{1,64}@(?:[a-zA-Z0-9-]{1,63}\\.){1,125}[a-zA-Z]{2,63}") || !userPassword.matches(".+")) {
            return null;            
        }
        
        String hashedUserPassword = HashFunction.getHash(userPassword);
                     
        try (ConnectionFactory factory = new ConnectionFactory()) {
            UserDAO dao = new UserDAO(factory.getConnection());
            
            User user = dao.validateLogin(userEmail, hashedUserPassword);
            
            if (user.getFullName() == null) {
                return null;
            }
            
            login.setId(user.getId());
            login.setNome(user.getFullName());
            login.setEmail(user.getEmail());
            login.setRole(user.getRole());
            
            return user;
        }
        catch (DAOException e) {
            e.printStackTrace();
        }        
        
        return null;
    }
} 
