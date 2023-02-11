package com.ufpr.tads.web2.controller;

import com.ufpr.tads.web2.exception.DadoInvalidoException;
import com.ufpr.tads.web2.util.Validacao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Gian
 */
@WebServlet(name = "RelatorioServlet", urlPatterns = {"/relatorio"})
public class RelatorioServlet extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String action = request.getParameter("action");
        
        try {
            Validacao.validarVazio(action, "Deve ser inserido um parâmetro de action!");
            
            switch (action) {
                
                case "redirect" -> {
                    request.getRequestDispatcher("funcionario/relatorios.jsp").forward(request, response); 
                    return;
                }
                
                case "receitas" -> {
                    
                }
                
                case "clientes" -> {
                    
                }
                
                case "clientesFieis" -> {
                    
                }
                
                case "pedidos" -> {
                    
                }
            }
        } catch (DadoInvalidoException e) {
            response.sendRedirect("pedido?action=listar&message=" + e.getMessage());
            return;
        }
    }

}
