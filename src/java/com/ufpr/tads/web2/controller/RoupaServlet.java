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
import com.ufpr.tads.web2.facade.RoupaFacade;

@WebServlet("/RoupaServlet")
public class RoupaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        RoupaFacade roupaFacade = new RoupaFacade();

        switch (action) {
            case "list":
                List<Item> items = roupaFacade.listarRoupas();
                request.setAttribute("items", items);
                request.getRequestDispatcher("listarRoupa.jsp").forward(request, response);
                break;
            case "insert":
                Item item = new Item();
                item.setDescricao(request.getParameter("descricao"));
                item.setPreco(Double.parseDouble(request.getParameter("preco")));
                item.setTempo(Integer.parseInt(request.getParameter("tempo")));
                item.setImagem(request.getParameter("imagem"));
                roupaFacade.inserirRoupa(item roupa);
                response.sendRedirect("RoupaServlet?action=list");
                break;
            case "update":
                item = new Item();
                item.setId(Integer.parseInt(request.getParameter("id")));
                item.setDescricao(request.getParameter("descricao"));
                item.setPreco(Double.parseDouble(request.getParameter("preco")));
                item.setTempo(Integer.parseInt(request.getParameter("tempo")));
                item.setImagem(request.getParameter("imagem"));
                roupaFacade.atualizarRoupa(item roupa);
                response.sendRedirect("RoupaServlet?action=list");
                break;
            case "delete":
                int id = Integer.parseInt(request.getParameter("id"));
                roupaFacade.deletarRoupa(id);
                response.sendRedirect("RoupaServlet?action=list");
                break;
            default:
                break;
        }

