package servlets;

import dao.ConnectionFactory;
import dao.UserDAO;
import domain.User;
import exception.DAOException;
import security.HashFunction;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String errorMessage = "E-mail ou senha inválidos!";    
        RequestDispatcher loginDispatcher = request.getRequestDispatcher("/login.jsp");
        
        String userEmail = request.getParameter("email");
        String userPassword = request.getParameter("password");
        
        if (!userEmail.matches("[a-zA-Z0-9._%+-]{1,64}@(?:[a-zA-Z0-9-]{1,63}\\.){1,125}[a-zA-Z]{2,63}") || !userPassword.matches(".+")) {
            request.setAttribute("message", errorMessage);
            loginDispatcher.forward(request, response);
            return;            
        }
        
        String hashedUserPassword = HashFunction.getHash(userPassword);
                     
        try (ConnectionFactory factory = new ConnectionFactory()) {
            UserDAO dao = new UserDAO(factory.getConnection());
            
            User user = dao.validateLogin(userEmail, hashedUserPassword);
            
            if (user == null) {
                request.setAttribute("message", errorMessage);
                loginDispatcher.forward(request, response);
                return;
            }
            
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            RequestDispatcher homeDispatcher = request.getRequestDispatcher("/home.jsp");
            homeDispatcher.forward(request, response);            
        }
        catch (DAOException e) {
            e.printStackTrace();
            request.setAttribute("message", "Erro de banco de dados!");
            loginDispatcher.forward(request, response);
        }        
        
    }

}
