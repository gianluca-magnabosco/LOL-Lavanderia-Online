package servlets;

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
        
        
        if (!validateFields(request)) {
            String errorMessage = URLEncoder.encode("Algum dado inserido é inválido!", "UTF-8");
            response.sendRedirect("registrar.jsp?message=" + errorMessage);
            return;
        }
        
        String userEmail = request.getParameter("email");
        
        
        
        
        
        
        // TODO: CHECAR SE USUÁRIO JÁ TEM CONTA (FAZER QUERY NO BANCO DE DADOS -> criar metodo no userdao pra buscar por email)!!!!!!!!!!!
        if (checkIfUserIsInDatabase(userEmail)) {
            String errorMessage = URLEncoder.encode("Você já está cadastrado no sistema, realize o <a href='login.jsp'>login</a>", "UTF-8");
            response.sendRedirect("registrar.jsp?message=" + errorMessage);
            return;
        }
        
        
        
        
        String userPassword = RandomPasswordGenerator.getRandomPassword(16);
        
        String hashedUserPassword = HashFunction.getHash(userPassword);
        // TODO: fazer adição no banco -> 1- tabela de endereço: cep, logradouro, número, cidade (pesquisar por nome e adicionar por id), bairro, complemento
        //                             -> 2- tabela de usuario: nome, cpf, email, telefone, senha, tipo de usuario (cliente sempre), id do endereço ^^^^^^^^^
        
        
        
        
        
        
        
        MailService.sendUserPasswordEmail(userEmail, userPassword);
        
        String userEmailParameter = URLEncoder.encode(userEmail, "UTF-8");
        response.sendRedirect("cadastrorealizado.jsp?email=" + userEmailParameter);
    }
    
    
    
    
    
    private boolean checkIfUserIsInDatabase(String userEmail) {
        // TODO
        return false;
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
        if (userEmail == null || !userEmail.matches("[a-zA-Z0-9._%+-]{1,64}@(?:[a-zA-Z0-9-]{1,63}\\.){1,125}[a-zA-Z]{2,63}")) {
            return false;
        }
        
        String userPhoneNumber = request.getParameter("telefone");
        if (userPhoneNumber == null || !userPhoneNumber.matches("\\(\\d{2}\\)\\s\\d{5}-\\d{4}")) {
            return false;
        }
        
        String userAddressCEP = request.getParameter("cep");
        if (userAddressCEP == null || !userAddressCEP.matches("\\d{5}-\\d{3}")) {
            return false;
        }
        
        String userAddressLogradouro = request.getParameter("logradouro");
        if (userAddressLogradouro == null || !userAddressLogradouro.matches(".+")) {
            return false;
        }
        
        String userAddressNumero = request.getParameter("numero");
        if (userAddressNumero == null || !userAddressNumero.matches("\\d+")) {
            return false;
        }
        
        String userAddressCidade = request.getParameter("localidade");
        if (userAddressCidade == null || !userAddressCidade.matches(".+")) {
            return false;
        }
        
        String userAddressEstado = request.getParameter("uf");
        if (userAddressEstado == null || !userAddressEstado.matches("[a-zA-Z]{2}")) {
            return false;
        }
        
        String userAddressBairro = request.getParameter("bairro");
        if (userAddressBairro == null || !userAddressBairro.matches(".+")) {
            return false;
        }  

        return true;
    }
    
    
    private boolean validateCpf(String cpf) {
        if (!cpf.matches("\\d{3}\\.\\d{3}\\.\\d{3}-\\d{2}")) {
            return false;
        }
        
        cpf = cpf.replace(".", "").replace("-", "");
        
        int soma = 0;

        for (int i = 1; i <= 9; i++) {
            soma += Integer.parseInt(cpf.substring(i - 1, i)) * (11 - i);
        }

        int resto = soma % 11;
        if (resto == 10 || resto == 11 || resto < 2) {
            resto = 0;
        } else {
            resto = 11 - resto;
        }

        if (resto != Integer.parseInt(cpf.substring(9, 10))) {
            return false;
        }

        soma = 0;

        for (int i = 1; i <= 10; i++) {
            soma += Integer.parseInt(cpf.substring(i - 1, i)) * (12 - i);
        }
        resto = soma % 11;

        if (resto == 10 || resto == 11 || resto < 2) {
            resto = 0;
        } else {
            resto = 11 - resto;
        }

        if (resto != Integer.parseInt(cpf.substring(10, 11))) {
            return false;
        }

        return true;
    }
}
