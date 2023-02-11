package com.ufpr.tads.web2.model.facade;

import com.ufpr.tads.web2.exception.DAOException;
import com.ufpr.tads.web2.exception.DadoInvalidoException;
import com.ufpr.tads.web2.exception.DataInvalidaException;
import com.ufpr.tads.web2.exception.EmailInvalidoException;
import com.ufpr.tads.web2.model.dao.ConnectionFactory;
import com.ufpr.tads.web2.model.domain.Funcionario;
import com.ufpr.tads.web2.model.dao.FuncionarioDAO;
import com.ufpr.tads.web2.security.HashFunction;
import com.ufpr.tads.web2.util.Validacao;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


public class FuncionarioFacade {
    
    
    public static List<Funcionario> listAll() throws DAOException {
        try (ConnectionFactory factory = new ConnectionFactory()) {
            FuncionarioDAO dao = new FuncionarioDAO(factory.getConnection());
            return dao.searchAll();
        }
    }
    
       
    public static Funcionario searchById(String id) throws DadoInvalidoException, DAOException {
        try (ConnectionFactory factory = new ConnectionFactory()) {
            Validacao.validarInteiro(id, "O id de funcionario inserido é inválido!");
            FuncionarioDAO dao = new FuncionarioDAO(factory.getConnection());
            return dao.searchById(Integer.parseInt(id));
        }
    }
    
    
    public static void insert(String nome, String dataNascimento, String email, String senha) throws DAOException, EmailInvalidoException, DadoInvalidoException, DataInvalidaException {
        validarParametros(nome, email, senha);
        Date data = validarConverterData(dataNascimento);
        
        String hashedPassword = HashFunction.getHash(senha);
        
        try (ConnectionFactory factory = new ConnectionFactory()) {
            Funcionario funcionario = new Funcionario();
            funcionario.setNome(nome);
            funcionario.setDataNascimento(data);
            funcionario.setEmail(email);
            funcionario.setSenha(hashedPassword);
            
            FuncionarioDAO dao = new FuncionarioDAO(factory.getConnection());
            dao.insert(funcionario);
        }
    }

    
    public static void update(String id, String nome, String dataNascimento, String email, String senha) throws DAOException, DadoInvalidoException, EmailInvalidoException, DataInvalidaException {
        Validacao.validarInteiro(id, "O id de funcionario informado é inválido!");
        validarParametros(nome, email, senha);
        Date data = validarConverterData(dataNascimento);
        
        String hashedPassword = HashFunction.getHash(senha);
        
        try (ConnectionFactory factory = new ConnectionFactory()) {
            Funcionario funcionario = new Funcionario();
            funcionario.setId(Integer.parseInt(id));
            funcionario.setNome(nome);
            funcionario.setDataNascimento(data);
            funcionario.setEmail(email);
            funcionario.setSenha(hashedPassword);
            
            FuncionarioDAO dao = new FuncionarioDAO(factory.getConnection());
            dao.update(funcionario);
        }
    }
    
        
    public static void delete(String id) throws DadoInvalidoException, DAOException {
        try (ConnectionFactory factory = new ConnectionFactory()) {
            Validacao.validarInteiro(id, "O id de funcionario inserido é inválido!");
            FuncionarioDAO dao = new FuncionarioDAO(factory.getConnection());
            dao.deleteById(Integer.parseInt(id));
        }
    }

    
    private static void validarParametros(String nome, String email, String senha) throws EmailInvalidoException, DadoInvalidoException {
        Validacao.validarVazio(nome, "O nome é obrigatório!");
        Validacao.validarEmail(email, "O e-mail inserido é inválido!");
        Validacao.validarVazio(senha, "A senha é obrigatória!");
    }
    
    
    private static Date validarConverterData(String dataNascimento) throws DadoInvalidoException, DataInvalidaException {
        Validacao.validarData(dataNascimento, "A data inserida é inválida!");
        
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        
        try {
            return dateFormat.parse(dataNascimento);
        } catch (ParseException e) {
            throw new DataInvalidaException("A data inserida é inválida!");
        }
    }

}