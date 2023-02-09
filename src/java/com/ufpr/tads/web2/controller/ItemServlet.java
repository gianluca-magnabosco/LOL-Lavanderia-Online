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
                    Item item = new Item();
                    item.setNome(request.getParameter("nome"));
                    item.setPreco(Double.parseDouble(request.getParameter("preco")));
                    item.setTempo(Integer.parseInt(request.getParameter("tempo")));
                    item.setImagem(request.getParameter("imagem"));
                    ItemFacade.inserirItem(item);
                    response.sendRedirect("ItemServlet?action=list");
                    break;
                case "update":
                    item = new Item();
                    item.setId(Integer.parseInt(request.getParameter("id")));
                    item.setNome(request.getParameter("Nome"));
                    item.setPreco(Double.parseDouble(request.getParameter("preco")));
                    item.setTempo(Integer.parseInt(request.getParameter("tempo")));
                    item.setImagem(request.getParameter("imagem"));
                    ItemFacade.atualizarItem(item);
                    response.sendRedirect("ItemServlet?action=list");
                    break;
                case "delete":
                    int id = Integer.parseInt(request.getParameter("id"));
                    ItemFacade.deletarItem(id);
                    response.sendRedirect("ItemServlet?action=list");
                    break;
                default:
                    break;
            }
        } catch (NumberFormatException e) {
            throw new AppException("Valor inválido para número", e);
        } catch (DAOException e)

