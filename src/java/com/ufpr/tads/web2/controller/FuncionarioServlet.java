package com.ufpr.tads.web2.controller;
import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "FuncionarioServlet", urlPatterns = {"/funcionario"})
public class FuncionarioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        switch (action) {
            case "cadastrar":
                // Direciona para a JSP de cadastro de funcionários
                request.getRequestDispatcher("cadastrarFuncionario.jsp").forward(request, response);
                break;
            case "consultar":
                // Direciona para a JSP de consulta de funcionários
                request.getRequestDispatcher("consultarFuncionario.jsp").forward(request, response);
                break;
            case "listar":
                // Chama o método de listagem de funcionários e armazena em uma lista
                List<User> funcionarios = FuncionarioFacade.listarFuncionarios();
                // Adiciona a lista de funcionários na requisição
                request.setAttribute("funcionarios", funcionarios);
                // Direciona para a JSP de listagem de funcionários
                request.getRequestDispatcher("listarFuncionarios.jsp").forward(request, response);
                break;
            default:
                // Em caso de ação inválida, envia uma mensagem de erro
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Ação inválida");
                break;
        }
    }
}
