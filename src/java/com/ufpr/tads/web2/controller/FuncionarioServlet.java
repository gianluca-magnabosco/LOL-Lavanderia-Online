package com.ufpr.tads.web2.controller;

import com.ufpr.tads.web2.exception.AppException;
import com.ufpr.tads.web2.exception.DadoInvalidoException;
import com.ufpr.tads.web2.model.domain.Funcionario;
import com.ufpr.tads.web2.model.facade.FuncionarioFacade;
import com.ufpr.tads.web2.util.Validacao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;


@WebServlet(name = "FuncionarioServlet", urlPatterns = {"/funcionario"})
public class FuncionarioServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, DadoInvalidoException {
        
        String action = request.getParameter("action");
        
        Validacao.validarVazio(action, "É necessário enviar um parametro action!");
        
        try {
            switch (action) {
                case "listar" -> {
                    List<Funcionario> funcionarios = FuncionarioFacade.listAll();
                    request.setAttribute("funcionarios", funcionarios);
                    
                    String message = request.getParameter("message");
                    if (message != null) {
                        request.setAttribute("message", message);
                    }
                    
                    request.getRequestDispatcher("listarFuncionario.jsp").forward(request, response);
                    return;
                }
                
                case "insert" -> {
                    String nome = request.getParameter("nome");
                    String dataNascimento = request.getParameter("dataNascimento");
                    String email = request.getParameter("email");
                    String senha = request.getParameter("senha");
                    FuncionarioFacade.insert(nome, dataNascimento, email, senha);
                    
                    response.sendRedirect("funcionario?action=listar");
                    return;
                }
                
                case "update" -> {
                    String id = request.getParameter("id");
                    String nome = request.getParameter("nome");
                    String dataNascimento = request.getParameter("dataNascimento");
                    String email = request.getParameter("email");
                    String senha = request.getParameter("senha");
                    FuncionarioFacade.update(id, nome, dataNascimento, email, senha);
                    
                    response.sendRedirect("funcionario?action=listar");
                    return;
                }
                
                case "delete" -> {
                    String id = request.getParameter("id");
                    FuncionarioFacade.delete(id);
                    
                    response.sendRedirect("funcionario?action=listar");
                    return;
                }

                default -> {
                    throw new DadoInvalidoException("É necessário enviar um parametro action!");
                }
            }
        } catch (AppException e) {
            e.printStackTrace();
            response.sendRedirect("funcionario?action=listar&message=" + e.getMessage());
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