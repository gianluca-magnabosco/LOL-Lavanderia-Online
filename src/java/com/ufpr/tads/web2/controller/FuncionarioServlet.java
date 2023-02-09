package com.ufpr.tads.web2.controller;
import java.io.IOException;
import java.util.List;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.ufpr.tads.web2.model.domain.Funcionario;
import com.ufpr.tads.web2.model.dao.funcionarioDAO;
import com.ufpr.tads.web2.exception.AppException;
import com.ufpr.tads.web2.exception.DAOException;

public class FuncionarioServlet extends HttpServlet {

    private FuncionarioDAO funcionarioDAO = new FuncionarioDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "inserir":
            String nomeUser = request.getParameter("nomeUser");
            String dataNascimento = request.getParameter("dataNascimento");
            String emailUser = request.getParameter("emailUser");
            String senhaUser = request.getParameter("senhaUser");
            FuncionarioFacade.cadastrarFuncionario(nomeUser, dataNascimento, emailUser, senhaUser);
            request.getRequestDispatcher("listarFuncionario.jsp").forward(request, response);
            break;
            case "atualizar":
            String nomeUser = request.getParameter("nomeUser");
            String dataNascimento = request.getParameter("dataNascimento");
            String emailUser = request.getParameter("emailUser");
            String senhaUser = request.getParameter("senhaUser");
            FuncionarioFacade.atualizarFuncionario(nomeUser, dataNascimento, emailUser, senhaUser);
            request.getRequestDispatcher("listarFuncionario.jsp").forward(request, response);
            break;
            case "excluir":
            String idUser = request.getParameter("senhaUser");
            FuncionarioFacade.excluirFuncionario(idUser);
            request.getRequestDispatcher("listarFuncionario.jsp").forward(request, response);
                break;
            case "consultar":
            String idUser = request.getParameter("idUser");
            FuncionarioFacade.buscarFuncionarioPorId(idUser);
            request.getRequestDispatcher("consultarFuncionario.jsp").forward(request, response);
                break;
            case "listar":
            FuncionarioFacade.listarFuncionarios();
            request.getRequestDispatcher("listarFuncionario.jsp").forward(request, response);
                break;
            default:
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


}