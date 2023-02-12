package com.ufpr.tads.web2.controller;

import com.ufpr.tads.web2.exception.AppException;
import com.ufpr.tads.web2.exception.DadoInvalidoException;
import com.ufpr.tads.web2.model.beans.LoginBean;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.ufpr.tads.web2.model.domain.Item;
import com.ufpr.tads.web2.model.facade.ItemFacade;
import com.ufpr.tads.web2.util.Validacao;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;


@WebServlet(name = "ItemServlet", urlPatterns = {"/roupa"})
@MultipartConfig
public class ItemServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, DadoInvalidoException {
        
        HttpSession session = request.getSession();
        
        LoginBean login = (LoginBean) session.getAttribute("login");
        
        if (login == null || login.getRole().equals("Cliente")) {
            response.sendRedirect("login.jsp?message=Voce+precisa+estar+logado+em+uma+conta+de+funcionario+para+acessar+esta+pagina");
            return;
        }
        
        String action = request.getParameter("action");

        try {
            
            Validacao.validarVazio(action, "Eh necessario enviar um parametro action!");
            
            switch (action) {
                case "listar" -> {
                    List<Item> items = ItemFacade.listAll();
                    request.setAttribute("roupas", items);
                    
                    String message = request.getParameter("message");
                    if (message != null) {
                        request.setAttribute("message", message);
                    }

                    request.getRequestDispatcher("funcionario/listarRoupa.jsp").forward(request, response);
                    return;
                }
                
                case "formRoupa" -> {
                    String id = request.getParameter("id");
                    
                    if (id == null || id.equals("")) {
                        request.getRequestDispatcher("funcionario/cadastrarRoupa.jsp").forward(request, response); 
                        return;
                    }
                    
                    Item roupa = ItemFacade.searchById(id);
                                        
                    request.setAttribute("roupa", roupa);
                    request.getRequestDispatcher("funcionario/cadastrarRoupa.jsp").forward(request, response); 
                    return;
                }

                case "update" -> {
                    String id = request.getParameter("id");
                    String nome = request.getParameter("nome");
                    String preco = request.getParameter("preco");
                    String tempo = request.getParameter("tempo");
                    Part imagem = request.getPart("imagem");
                         
                    String path = getServletContext().getRealPath("");
                    
                    if (id == null || id.equals("")) {
                        ItemFacade.insert(nome, preco, tempo, imagem, path);
                    } else {
                        ItemFacade.update(id, nome, preco, tempo, imagem, path);
                    }
                    
                    response.sendRedirect("roupa?action=listar");
                    return;
                }
                
                case "delete" -> {
                    String id = request.getParameter("id");
                    ItemFacade.delete(id);
                    
                    response.sendRedirect("roupa?action=listar");
                    return;
                }

                default -> {
                    throw new DadoInvalidoException("Eh necessario enviar um parametro action valido!");
                }
            }
        } catch (AppException e) {
            e.printStackTrace();
            response.sendRedirect("roupa?action=listar&message=" + e.getMessage());
            return;
        }
    }
        
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (DadoInvalidoException e) {
            e.printStackTrace();
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (DadoInvalidoException e) {
            e.printStackTrace();
        }
    }
            
}

