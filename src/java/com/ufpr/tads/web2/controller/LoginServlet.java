package com.ufpr.tads.web2.controller;

import com.ufpr.tads.web2.exception.AppException;
import com.ufpr.tads.web2.exception.DAOException;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.ufpr.tads.web2.model.beans.LoginBean;
import com.ufpr.tads.web2.model.facade.LoginFacade;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String userEmail = request.getParameter("email");
        String userPassword = request.getParameter("password");
        
        LoginBean login = null;
        
        try {
            login = LoginFacade.login(userEmail, userPassword);
            
            if (login == null) {
                throw new DAOException("E-mail ou senha incorretos!");
            }
            
        } catch (AppException e) {
            e.printStackTrace();
            RequestDispatcher loginDispatcher = request.getRequestDispatcher("/login.jsp");
            request.setAttribute("message", e.getMessage());
            loginDispatcher.forward(request, response);
            return;
        }
        
        
        HttpSession session = request.getSession();
        session.setAttribute("login", login);

        response.sendRedirect("pedido?action=inicio");
        return;
    }
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/login.jsp").forward(request, response);
        return;
    }

}
