package com.ufpr.tads.web2.model.facade;

import com.ufpr.tads.web2.exception.DAOException;
import com.ufpr.tads.web2.exception.DadoInvalidoException;
import com.ufpr.tads.web2.exception.EmailInvalidoException;
import com.ufpr.tads.web2.exception.UsuarioOuSenhaInvalidosException;
import com.ufpr.tads.web2.model.beans.LoginBean;
import com.ufpr.tads.web2.model.dao.ConnectionFactory;
import com.ufpr.tads.web2.model.dao.FuncionarioDAO;
import com.ufpr.tads.web2.model.dao.UserDAO;
import com.ufpr.tads.web2.model.domain.Funcionario;
import com.ufpr.tads.web2.model.domain.User;
import com.ufpr.tads.web2.security.HashFunction;
import com.ufpr.tads.web2.util.Validacao;

/**
 *
 * @author Gian
 */
public class LoginFacade {
    
    public static LoginBean login(String userEmail, String userPassword) throws UsuarioOuSenhaInvalidosException, EmailInvalidoException, DadoInvalidoException {
        
        Validacao.validarVazio(userPassword, "A senha deve ser informada!");
        Validacao.validarEmail(userEmail, "O e-mail inserido é inválido!");
        
        String hashedUserPassword = HashFunction.getHash(userPassword);
                     
        try (ConnectionFactory factory = new ConnectionFactory()) {
            UserDAO userDao = new UserDAO(factory.getConnection());
            
            User user = userDao.validateLogin(userEmail, hashedUserPassword);
            
            FuncionarioDAO funcionarioDao = new FuncionarioDAO(factory.getConnection());

            Funcionario funcionario = funcionarioDao.validateLogin(userEmail, hashedUserPassword);
            
            if (user == null && funcionario == null) {
                throw new UsuarioOuSenhaInvalidosException("E-mail ou senha incorretos!");
            }
            
            if (user != null) {
                LoginBean login = new LoginBean();
                login.setId(user.getId());
                login.setNome(user.getFullName());
                login.setEmail(user.getEmail());
                login.setRole("Cliente");
                return login;
            }
            
            if (funcionario != null) {
                LoginBean login = new LoginBean();
                login.setId(funcionario.getId());
                login.setNome(funcionario.getNome());
                login.setEmail(funcionario.getEmail());
                login.setRole("Funcionario");
                return login;
            }
            
        } catch (DAOException e) {
            e.printStackTrace();
        }     
        
        return null;
    }
} 
