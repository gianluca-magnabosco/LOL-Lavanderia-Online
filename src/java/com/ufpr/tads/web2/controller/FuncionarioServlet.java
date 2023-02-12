package com.ufpr.tads.web2.controller;

import com.ufpr.tads.web2.exception.AppException;
import com.ufpr.tads.web2.exception.DadoInvalidoException;
import com.ufpr.tads.web2.model.beans.LoginBean;
import com.ufpr.tads.web2.model.domain.Funcionario;
import com.ufpr.tads.web2.model.facade.FuncionarioFacade;
import com.ufpr.tads.web2.util.Validacao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;


@WebServlet(name = "FuncionarioServlet", urlPatterns = {"/funcionarioController"})
public class FuncionarioServlet extends HttpServlet {


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
                    List<Funcionario> funcionarios = FuncionarioFacade.listAll();
                    request.setAttribute("funcionarios", funcionarios);
                    
                    String message = request.getParameter("message");
                    if (message != null) {
                        request.setAttribute("message", message);
                    }
                    
                    request.getRequestDispatcher("funcionario/listarFuncionario.jsp").forward(request, response);
                    return;
                }
                
                case "consultar" -> {
                    String id = request.getParameter("id");
                    
                    Funcionario funcionario = FuncionarioFacade.searchById(id);     

                    request.setAttribute("funcionario", funcionario);
                        
                    request.getRequestDispatcher("funcionario/detalhesFuncionario.jsp").forward(request, response); 
                }
                
                case "formFuncionario" -> {
                    String id = request.getParameter("id");
                    
                    if (id == null || id.equals("")) {
                        request.getRequestDispatcher("funcionario/cadastrarFuncionario.jsp").forward(request, response); 
                        return;
                    }
                    
                    Funcionario funcionario = FuncionarioFacade.searchById(id);
                                        
                    request.setAttribute("funcionario", funcionario);
                    request.getRequestDispatcher("funcionario/cadastrarFuncionario.jsp").forward(request, response); 
                    return;
                }
                
                case "update" -> {
                    String id = request.getParameter("id");
                    String nome = request.getParameter("nome");
                    String dataNascimento = request.getParameter("dataNascimento");
                    String email = request.getParameter("email");
                    String senha = request.getParameter("senha");
                    
                    if (id == null || id.equals("")) {
                        FuncionarioFacade.insert(nome, dataNascimento, email, senha);
                    } else {
                        FuncionarioFacade.update(id, nome, dataNascimento, email, senha);
                    }
                    
                    response.sendRedirect("funcionarioController?action=listar");
                    return;
                }
                
                case "delete" -> {
                    String id = request.getParameter("id");
                    FuncionarioFacade.delete(id);
                    
                    response.sendRedirect("funcionarioController?action=listar");
                    return;
                }

                default -> {
                    throw new DadoInvalidoException("Eh necessario enviar um parametro action!");
                }
            }
        } catch (AppException e) {
            e.printStackTrace();
            response.sendRedirect("funcionarioController?action=listar&message=" + e.getMessage());
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