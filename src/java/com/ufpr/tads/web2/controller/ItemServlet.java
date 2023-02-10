package com.ufpr.tads.web2.controller;

import com.ufpr.tads.web2.exception.AppException;
import com.ufpr.tads.web2.exception.DadoInvalidoException;
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
import jakarta.servlet.http.Part;


@WebServlet(name = "ItemServlet", urlPatterns = {"/roupa"})
public class ItemServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, DadoInvalidoException {
        
        String action = request.getParameter("action");
        
        Validacao.validarVazio(action, "É necessário enviar um parametro action!");

        try {
            switch (action) {
                case "listar" -> {
                    List<Item> items = ItemFacade.listAll();
                    request.setAttribute("items", items);
                    
                    String message = request.getParameter("message");
                    if (message != null) {
                        request.setAttribute("message", message);
                    }

                    request.getRequestDispatcher("listarRoupa.jsp").forward(request, response);
                    return;
                }

                case "insert" -> {
                    String nome = request.getParameter("nome");
                    String preco = request.getParameter("preco");
                    String tempo = request.getParameter("tempo");
                    Part imagem = request.getPart("imagem");
                    ItemFacade.insert(nome, preco, tempo, imagem);
                    
                    response.sendRedirect("roupa?action=listar");
                    return;
                }

                case "update" -> {
                    String id = request.getParameter("id");
                    String nome = request.getParameter("nome");
                    String preco = request.getParameter("preco");
                    String tempo = request.getParameter("tempo");
                    Part imagem = request.getPart("imagem");                  
                    ItemFacade.update(id, nome, preco, tempo, imagem);
                    
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
                    throw new DadoInvalidoException("É necessário enviar um parametro action!");
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

