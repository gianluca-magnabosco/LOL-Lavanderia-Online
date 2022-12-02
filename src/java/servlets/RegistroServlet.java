package servlets;

import dao.CidadeDAO;
import dao.ConnectionFactory;
import dao.EnderecoDAO;
import dao.UserDAO;
import domain.Cidade;
import domain.Endereco;
import domain.User;
import exception.DAOException;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import security.HashFunction;
import security.RandomPasswordGenerator;
import util.MailService;


@WebServlet(name = "RegistroServlet", urlPatterns = {"/registrar"})
public class RegistroServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        if (!validateFields(request)) {
            String errorMessage = URLEncoder.encode("Algum dado inserido é inválido!", "UTF-8");
            response.sendRedirect("registrar.jsp?message=" + errorMessage);
            return;
        }
        
        
        String userEmail = request.getParameter("email");

        if (isUserInDatabase(userEmail)) {
            String errorMessage = URLEncoder.encode("Você já está cadastrado no sistema, "
                    + "realize o <a href='login.jsp'>login</a>", "UTF-8");
            response.sendRedirect("registrar.jsp?message=" + errorMessage);
            return;
        }
        
        
        Endereco endereco = new Endereco();
        
        try (ConnectionFactory factory = new ConnectionFactory()) {
            CidadeDAO cidadeDao = new CidadeDAO(factory.getConnection());
            
            Cidade cidade = cidadeDao.search(
                    capitalizeCidade(request.getParameter("localidade"))
            );
            
            if (cidade == null) {
                String errorMessage = URLEncoder.encode("Cidade não encontrada!", "UTF-8");
                response.sendRedirect("registrar.jsp?message=" + errorMessage);
                return;                
            }
            
            endereco.setCidade(cidade);
            endereco.setCep(request.getParameter("cep")
                    .replace("-", ""));
            endereco.setLogradouro(request.getParameter("logradouro"));
            endereco.setNumero(Integer.parseInt(request.getParameter("numero")));
            endereco.setComplemento(request.getParameter("complemento"));
            endereco.setBairro(request.getParameter("bairro"));
            
            EnderecoDAO enderecoDao = new EnderecoDAO(factory.getConnection());
            enderecoDao.insert(endereco);
            
            endereco.setId(enderecoDao.getCurrentId());
        }
        catch (DAOException e) {
            System.out.println("### ERRO DE DAO: " + e.getMessage());
            e.printStackTrace();
        }       
        
        
        
        String userPassword = RandomPasswordGenerator.getRandomPassword(16);
        String hashedUserPassword = HashFunction.getHash(userPassword);
        
        try (ConnectionFactory factory = new ConnectionFactory()) {
            User user = new User();
            user.setEndereco(endereco);
            user.setCpf(request.getParameter("cpf")
                    .replaceAll("\\.", "")
                    .replace("-", ""));
            user.setFullName(request.getParameter("nome"));
            user.setEmail(userEmail);
            user.setPhoneNumber(request.getParameter("telefone")
                    .replace("(", "")
                    .replace(")", "")
                    .replaceAll("\\s", "")
                    .replace("-", ""));
            user.setPassword(hashedUserPassword);
            user.setRole("Cliente");
            
            UserDAO userDao = new UserDAO(factory.getConnection());
            userDao.insert(user);
        }
        catch (DAOException e) {
            System.out.println("### ERRO DE DAO: " + e.getMessage());
            e.printStackTrace();
        }         
        
        
        
        MailService.sendUserPasswordEmail(userEmail, userPassword);
        
        String userEmailParameter = URLEncoder.encode(userEmail, "UTF-8");
        response.sendRedirect("cadastrorealizado.jsp?email=" + userEmailParameter);
    }
    
    
    
    private boolean isUserInDatabase(String userEmail) {
        try (ConnectionFactory factory = new ConnectionFactory()) {
            UserDAO dao = new UserDAO(factory.getConnection());
            
            User user = dao.search(userEmail);
            
            if (user != null) {
                return true;
            }       
        }
        catch (DAOException e) {
            e.printStackTrace();
        }     
        
        return false;
    }
    
    
    private String capitalizeCidade(String cidade) {
        String cidadeAtual = "";
        for (String word : cidade.toLowerCase().split("\\s+")) {
            cidadeAtual += word.replaceFirst(".",
                    word.substring(0, 1).toUpperCase()) + " ";
        }

        return cidadeAtual.substring(0, cidadeAtual.length() - 1);
    }
    
    
    private boolean validateFields(HttpServletRequest request) {
        String userNome = request.getParameter("nome");
        if (userNome == null || !userNome.matches(".+")) {
            return false;
        }
        
        String userCPF = request.getParameter("cpf");
        if (userCPF == null || !validateCpf(userCPF)) {
            return false;
        }
        
        String userEmail = request.getParameter("email");
        if (userEmail == null
                || !userEmail.matches("[a-zA-Z0-9._%+-]{1,64}@(?:[a-zA-Z0-9-]{1,63}\\.){1,125}[a-zA-Z]{2,63}")) {
            return false;
        }
        
        String userPhoneNumber = request.getParameter("telefone");
        if (userPhoneNumber == null
                || !userPhoneNumber.matches("\\(\\d{2}\\)\\s\\d{5}-\\d{4}")) {
            return false;
        }
        
        String userAddressCEP = request.getParameter("cep");
        if (userAddressCEP == null
                || !userAddressCEP.matches("\\d{5}-\\d{3}")) {
            return false;
        }
        
        String userAddressLogradouro = request.getParameter("logradouro");
        if (userAddressLogradouro == null
                || !userAddressLogradouro.matches(".+")) {
            return false;
        }
        
        String userAddressNumero = request.getParameter("numero");
        if (userAddressNumero == null
                || !userAddressNumero.matches("\\d+")) {
            return false;
        }
        
        String userAddressCidade = request.getParameter("localidade");
        if (userAddressCidade == null
                || !userAddressCidade.matches(".+")) {
            return false;
        }
        
        String userAddressEstado = request.getParameter("uf");
        if (userAddressEstado == null
                || !userAddressEstado.matches("[a-zA-Z]{2}")) {
            return false;
        }
        
        String userAddressBairro = request.getParameter("bairro");
        if (userAddressBairro == null
                || !userAddressBairro.matches(".+")) {
            return false;
        }  

        return true;
    }
    
    
    private boolean validateCpf(String cpf) {
        if (!cpf.matches("\\d{3}\\.\\d{3}\\.\\d{3}-\\d{2}")) {
            return false;
        }
        
        cpf = cpf.replace(".", "")
                .replace("-", "");
        
        int n = 0;
        int m = 0;
        for (int i = 9; i < 11; i++) {
            for (n = 0, m = 0; m < i; m++) {
                n += cpf.charAt(m) * ((i + 1) - m);
            }
            n = ((10 * n) % 11) % 10;
            if (cpf.charAt(m) != n) {
                return false;
            }
        }

        return true;
    }
}
