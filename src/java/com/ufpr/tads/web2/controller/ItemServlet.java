package com.ufpr.tads.web2.controller;

import com.ufpr.tads.web2.exception.AppException;
import com.ufpr.tads.web2.exception.DAOException;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.ufpr.tads.web2.model.domain.Item;
import com.ufpr.tads.web2.facade.ItemFacade;

@WebServlet("/ItemServlet")
public class ItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        ItemFacade ItemFacade = new ItemFacade();

        try {
            switch (action) {
                case "list":
                    List<Item> items = ItemFacade.listarItems();
                    request.setAttribute("items", items);
                    request.getRequestDispatcher("listarRoupa.jsp").forward(request, response);
                    break;

                case "insert":
		            String nome = request.getParameter("nome");
		            String preco = request.getParameter("preco");
		            String tempo = request.getParameter("tempo");
		            String imagem = request.getParameter("imagem");
		            ItemFacade.inserirItem(nome, preco, tempo, imagem);
		            response.sendRedirect("listarRoupa.jsp");
		            break;

                case "update":
                    String id = request.getParameter("id");
                    String nome = request.getParameter("nome");
                    String preco = request.getParameter("preco");
                    String tempo = request.getParameter("tempo");
                    String imagem = request.getParameter("imagem");                    
                    ItemFacade.atualizarItem(id, nome, preco, tempo, imagem);
                    response.sendRedirect("listarRoupa.jsp");
                    break;

                case "delete":
                    String id = request.getParameter("id");
                    ItemFacade.deletarItem(id);
                    response.sendRedirect("listarRoupa.jsp");
                    break;

                default:
                    break;
            }
        } catch (NumberFormatException e) {
            throw new AppException("Valor inválido para número", e);
        } catch (DAOException e){

        } catch (AppException e) {
            e.printStackTrace();
            response.sendRedirect("/listarroupa.jsp?message=" + e.getMessage());
            return;
        }

