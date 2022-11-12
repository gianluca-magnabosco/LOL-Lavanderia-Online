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
        
        
        
        
        
        
        // TODO: CHECAR SE USUÁRIO JÁ TEM CONTA (FAZER QUERY NO BANCO DE DADOS -> criar metodo no userdao pra buscar por email)!!!!!!!!!!!
        if (userInDatabase(request.getParameter("email"))) {
            String errorMessage = URLEncoder.encode("Você já está cadastrado no sistema, realize o <a href='login.jsp'>login</a>", "UTF-8");
            response.sendRedirect("registrar.jsp?message=" + errorMessage);
            return;
        }
        
        
        
        
        String userPassword = RandomPasswordGenerator.getRandomPassword(16);
        
        String hashedUserPassword = HashFunction.getHash(userPassword);
        // TODO: fazer adição no banco -> 1- tabela de endereço: cep, logradouro, número, cidade (pesquisar por nome e adicionar por id), bairro, complemento
        //                             -> 2- tabela de usuario: nome, cpf, email, telefone, senha, tipo de usuario (cliente sempre), id do endereço ^^^^^^^^^
        
        
        
        
        
        
        
        MailService.sendUserPasswordEmail(request.getParameter("email"), userPassword);
        
        // TODO: criar pagina de confirmação de cadastro e redirecionar pra ela abaixo
        response.sendRedirect("login.jsp");
    }
    
    
    
    
    
    private boolean userInDatabase(String userEmail) {
        // TODO
        return false;
    }
    
    
    
    
    
    
    
    
    
    
    private boolean validateFields(HttpServletRequest request) {
        String nome = request.getParameter("nome");
        if (nome == null || !nome.matches(".+")) {
            return false;
        }
        
        String cpf = request.getParameter("cpf");
        if (cpf == null || !validateCpf(cpf)) {
            return false;
        }
        
        String email = request.getParameter("email");
        if (email == null || !email.matches("[a-zA-Z0-9._%+-]{1,64}@(?:[a-zA-Z0-9-]{1,63}\\.){1,125}[a-zA-Z]{2,63}")) {
            return false;
        }
        
        String telefone = request.getParameter("telefone");
        if (telefone == null || !telefone.matches("\\(\\d{2}\\)\\s\\d{5}-\\d{4}")) {
            return false;
        }
        
        String cep = request.getParameter("cep");
        if (cep == null || !cep.matches("\\d{5}-\\d{3}")) {
            return false;
        }
        
        String logradouro = request.getParameter("logradouro");
        if (logradouro == null || !logradouro.matches(".+")) {
            return false;
        }
        
        String numero = request.getParameter("numero");
        if (numero == null || !numero.matches("\\d+")) {
            return false;
        }
        
        String cidade = request.getParameter("localidade");
        if (cidade == null || !cidade.matches(".+")) {
            return false;
        }
        
        String estado = request.getParameter("uf");
        if (estado == null || !estado.matches("[a-zA-Z]{2}")) {
            return false;
        }
        
        String bairro = request.getParameter("bairro");
        if (bairro == null || !bairro.matches(".+")) {
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
