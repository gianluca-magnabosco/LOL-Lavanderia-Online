package com.ufpr.tads.web2.model.facade;

import com.ufpr.tads.web2.exception.DAOException;
import com.ufpr.tads.web2.exception.DadoInvalidoException;
import com.ufpr.tads.web2.exception.ErroAoEnviarEmailException;
import com.ufpr.tads.web2.model.dao.CidadeDAO;
import com.ufpr.tads.web2.model.dao.ConnectionFactory;
import com.ufpr.tads.web2.model.dao.EnderecoDAO;
import com.ufpr.tads.web2.model.dao.UserDAO;
import com.ufpr.tads.web2.model.domain.Cidade;
import com.ufpr.tads.web2.model.domain.Endereco;
import com.ufpr.tads.web2.model.domain.User;
import com.ufpr.tads.web2.security.HashFunction;
import com.ufpr.tads.web2.security.RandomPasswordGenerator;
import com.ufpr.tads.web2.util.MailService;

/**
 *
 * @author Gian
 */
public class RegistroFacade {
     
    public static void registrar(String userNome,
                                 String userCpf,
                                 String userEmail,
                                 String userPhoneNumber,
                                 String userAddressCep,
                                 String userAddressLogradouro,
                                 String userAddressNumero,
                                 String userAddressCidade,
                                 String userAddressEstado,
                                 String userAddressBairro,
                                 String userAddressComplemento) throws DadoInvalidoException, ErroAoEnviarEmailException {
        
        
        validateFields(userNome, userCpf, userEmail, userPhoneNumber, userAddressCep,
                                                                      userAddressLogradouro,
                                                                      userAddressNumero,
                                                                      userAddressCidade,
                                                                      userAddressEstado,
                                                                      userAddressBairro);

        checkIfUserIsInDatabase(userEmail);
        
        Endereco endereco = adicionarEndereco(userAddressCep, userAddressLogradouro, userAddressNumero, userAddressCidade, userAddressEstado, userAddressBairro, userAddressComplemento);
        
        String userPassword = adicionarUsuario(endereco, userCpf, userNome, userEmail, userPhoneNumber);
        
        MailService.sendUserPasswordEmail(userEmail, userPassword);
    }
    
    
    
    
    private static void validateFields(String userNome,
                                       String userCpf,
                                       String userEmail,
                                       String userPhoneNumber,
                                       String userAddressCep,
                                       String userAddressLogradouro,
                                       String userAddressNumero,
                                       String userAddressCidade,
                                       String userAddressEstado,
                                       String userAddressBairro) throws DadoInvalidoException {
        
        if (userNome == null || !userNome.matches(".+")) {
            throw new DadoInvalidoException("O nome é inválido!");
        }

        if (userCpf == null || !validateCpf(userCpf)) {
            throw new DadoInvalidoException("O CPF é inválido!");
        }

        if (userEmail == null
                || !userEmail.matches("[a-zA-Z0-9._%+-]{1,64}@(?:[a-zA-Z0-9-]{1,63}\\.){1,125}[a-zA-Z]{2,63}")) {
            throw new DadoInvalidoException("O e-mail é inválido!");
        }

        if (userPhoneNumber == null
                || !userPhoneNumber.matches("\\(\\d{2}\\)\\s\\d{5}-\\d{4}")) {
            throw new DadoInvalidoException("O telefone é inválido!");
        }

        if (userAddressCep == null
                || !userAddressCep.matches("\\d{5}-\\d{3}")) {
            throw new DadoInvalidoException("O CEP é inválido!");
        }

        if (userAddressLogradouro == null
                || !userAddressLogradouro.matches(".+")) {
            throw new DadoInvalidoException("O Logradouro é inválido!");
        }

        if (userAddressNumero == null
                || !userAddressNumero.matches("\\d+")) {
            throw new DadoInvalidoException("O Número do endereço é inválido!");
        }

        if (userAddressCidade == null
                || !userAddressCidade.matches(".+")) {
            throw new DadoInvalidoException("A cidade é inválida!");
        }

        if (userAddressEstado == null
                || !userAddressEstado.matches("[a-zA-Z]{2}")) {
            throw new DadoInvalidoException("O estado é inválido!");
        }

        if (userAddressBairro == null
                || !userAddressBairro.matches(".+")) {
            throw new DadoInvalidoException("O bairro é inválido!");
        }  

    }
    
   
        
    private static void checkIfUserIsInDatabase(String userEmail) throws DadoInvalidoException {
        try (ConnectionFactory factory = new ConnectionFactory()) {
            UserDAO dao = new UserDAO(factory.getConnection());
            
            User user = dao.search(userEmail);
            
            if (user != null) {
                throw new DadoInvalidoException("Você já está cadastrado no sistema, realize o <a href='login.jsp'>login</a>");
            }       
        }
        catch (DAOException e) {
            e.printStackTrace();
            throw new DadoInvalidoException("Erro de banco de dados!");
        }     
    }
    
    
    
    private static Endereco adicionarEndereco(String userAddressCep,
                                              String userAddressLogradouro,
                                              String userAddressNumero,
                                              String userAddressCidade,
                                              String userAddressEstado,
                                              String userAddressBairro,
                                              String userAddressComplemento) throws DadoInvalidoException {
        
        
        try (ConnectionFactory factory = new ConnectionFactory()) {
            
            Endereco endereco = new Endereco();
                    
            CidadeDAO cidadeDao = new CidadeDAO(factory.getConnection());
            
            Cidade cidade = cidadeDao.search(capitalizeCidade(userAddressCidade));
            
            if (cidade == null) {
                throw new DadoInvalidoException("Cidade não encontrada!");               
            }
            
            endereco.setCidade(cidade);
            endereco.setCep(userAddressCep.replace("-", ""));
            endereco.setLogradouro(userAddressLogradouro);
            endereco.setNumero(Integer.parseInt(userAddressNumero));
            endereco.setComplemento(userAddressComplemento);
            endereco.setBairro(userAddressBairro);
            
            EnderecoDAO enderecoDao = new EnderecoDAO(factory.getConnection());
            enderecoDao.insert(endereco);
            
            endereco.setId(enderecoDao.getCurrentId());
            
            return endereco;
        }
        catch (DAOException e) {
            e.printStackTrace();
            throw new DadoInvalidoException("Erro ao adicionar endereço!");
        }    
    }
    
    
    
    
    private static String adicionarUsuario(Endereco endereco,
                                         String userCpf,
                                         String userNome,
                                         String userEmail,
                                         String userPhoneNumber) throws DadoInvalidoException {
                
        String userPassword = RandomPasswordGenerator.getRandomPassword(16);
        String hashedUserPassword = HashFunction.getHash(userPassword);
        
        try (ConnectionFactory factory = new ConnectionFactory()) {
            User user = new User();
            user.setEndereco(endereco);
            user.setCpf(userCpf
                    .replaceAll("\\.", "")
                    .replace("-", ""));
            
            user.setFullName(userNome);
            user.setEmail(userEmail);
            user.setPhoneNumber(userPhoneNumber
                    .replace("(", "")
                    .replace(")", "")
                    .replaceAll("\\s", "")
                    .replace("-", ""));
            
            user.setPassword(hashedUserPassword);
            
            UserDAO userDao = new UserDAO(factory.getConnection());
            userDao.insert(user);
            
            return userPassword;
        }
        catch (DAOException e) {
            e.printStackTrace();
            throw new DadoInvalidoException("Erro ao adicionar cliente!");
        }         
        
    }
    
    
    
    private static String capitalizeCidade(String cidade) {
        String cidadeAtual = "";
        for (String word : cidade.toLowerCase().split("\\s+")) {
            cidadeAtual += word.replaceFirst(".",
                    word.substring(0, 1).toUpperCase()) + " ";
        }

        return cidadeAtual.substring(0, cidadeAtual.length() - 1);
    }
    
    
    
    private static boolean validateCpf(String cpf) {
        if (!cpf.matches("\\d{3}\\.\\d{3}\\.\\d{3}-\\d{2}")) {
            return false;
        }
        
        cpf = cpf.replace(".", "")
                .replace("-", "");
        
        
        char dig10, dig11;
        int i, num, r, soma = 0, peso = 10;

        for (i = 0; i < 9; i++) {
            num = (int) (cpf.charAt(i) - 48);
            soma = soma + (num * peso);
            peso -= 1;
        }

        r = 11 - (soma % 11);

        if (r == 10 || r == 11) {
            dig10 = '0';
        } else {
            dig10 = (char) (r + 48);
        }

        soma = 0;
        peso = 11;
        for (i = 0; i < 10; i++) {
            num = (int) (cpf.charAt(i) - 48);
            soma = soma + (num * peso);
            peso -= 1;
        }

        r = 11 - (soma % 11);

        if (r == 10 || r == 11) {
            dig11 = '0';
        } else {
            dig11 = (char) (r + 48);
        }

        if (dig10 == cpf.charAt(9) && dig11 == cpf.charAt(10)) {
            return true;
        } else {
            return false;
        }
    }
}
