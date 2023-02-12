package com.ufpr.tads.web2.controller;

import com.ufpr.tads.web2.exception.AppException;
import com.ufpr.tads.web2.exception.DAOException;
import com.ufpr.tads.web2.model.beans.LoginBean;
import com.ufpr.tads.web2.model.facade.RelatorioFacade;
import com.ufpr.tads.web2.util.Validacao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.OutputStream;
import net.sf.jasperreports.engine.JRException;

/**
 *
 * @author Gian
 */
@WebServlet(name = "RelatorioServlet", urlPatterns = {"/relatorio"})
public class RelatorioServlet extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        LoginBean login = (LoginBean) session.getAttribute("login");
        
        if (login == null || login.getRole().equals("Cliente")) {
            response.sendRedirect("login.jsp?message=Voce+precisa+estar+logado+em+uma+conta+de+funcionario+para+acessar+esta+pagina");
            return;
        }
        
        
        String action = request.getParameter("action");
        
        try {
            Validacao.validarVazio(action, "Deve ser inserido um parametro de action!");
            
            switch (action) {
                
                case "redirect" -> {
                    request.getRequestDispatcher("funcionario/relatorios.jsp").forward(request, response); 
                    return;
                }
                
                case "receitas" -> {
                    try {
                        String jasper = request.getContextPath() + "/relatorios/receitas.jasper";
                        String host = "http://" + request.getServerName() + ":" + request.getServerPort();
                        
                        response.setContentType("application/pdf");
                        OutputStream output = response.getOutputStream();
                        
                        RelatorioFacade.gerarRelatorio(jasper, host, output);
                        
                    } catch (DAOException e) {
                        e.printStackTrace();
                        request.setAttribute("mensagem", "Erro de DAO: " + e.getMessage());
                        request.getRequestDispatcher("funcionario/relatorios.jsp").forward(request, response);
                    } catch (JRException | IOException e) {
                        e.printStackTrace();
                        request.setAttribute("mensagem", "Erro no Jasper: " + e.getMessage());
                        request.getRequestDispatcher("funcionario/relatorios.jsp").forward(request, response);
                    }
                }
                
                case "clientes" -> {
                    try {
                        String jasper = request.getContextPath() + "/relatorios/clientes.jasper";
                        String host = "http://" + request.getServerName() + ":" + request.getServerPort();

                        response.setContentType("application/pdf");
                        OutputStream output = response.getOutputStream();
                        
                        RelatorioFacade.gerarRelatorio(jasper, host, output);
                        
                    } catch (DAOException e) {
                        e.printStackTrace();
                        request.setAttribute("mensagem", "Erro de DAO: " + e.getMessage());
                        request.getRequestDispatcher("funcionario/relatorios.jsp").forward(request, response);
                    } catch (JRException | IOException e) {
                        e.printStackTrace();
                        request.setAttribute("mensagem", "Erro no Jasper: " + e.getMessage());
                        request.getRequestDispatcher("funcionario/relatorios.jsp").forward(request, response);
                    }
                }
                
                case "clientesFieis" -> {
                    try {
                        String jasper = request.getContextPath() + "/relatorios/clientesFieis.jasper";
                        String host = "http://" + request.getServerName() + ":" + request.getServerPort();

                        response.setContentType("application/pdf");
                        OutputStream output = response.getOutputStream();
                        
                        RelatorioFacade.gerarRelatorio(jasper, host, output);
                        
                    } catch (DAOException e) {
                        e.printStackTrace();
                        request.setAttribute("mensagem", "Erro de DAO: " + e.getMessage());
                        request.getRequestDispatcher("funcionario/relatorios.jsp").forward(request, response);
                    } catch (JRException | IOException e) {
                        e.printStackTrace();
                        request.setAttribute("mensagem", "Erro no Jasper: " + e.getMessage());
                        request.getRequestDispatcher("funcionario/relatorios.jsp").forward(request, response);
                    }
                }
                
                case "pedidos" -> {
                    try {
                        String jasper = request.getContextPath() + "/relatorios/pedidos.jasper";
                        String host = "http://" + request.getServerName() + ":" + request.getServerPort();

                        response.setContentType("application/pdf");
                        OutputStream output = response.getOutputStream();
                        
                        RelatorioFacade.gerarRelatorio(jasper, host, output);
                        
                    } catch (DAOException e) {
                        e.printStackTrace();
                        request.setAttribute("mensagem", "Erro de DAO: " + e.getMessage());
                        request.getRequestDispatcher("funcionario/relatorios.jsp").forward(request, response);
                    } catch (JRException | IOException e) {
                        e.printStackTrace();
                        request.setAttribute("mensagem", "Erro no Jasper: " + e.getMessage());
                        request.getRequestDispatcher("funcionario/relatorios.jsp").forward(request, response);
                    }
                }
                
                default -> {
                    response.sendRedirect("relatorio?action=redirect&message=" + "Deve ser inserido um parametro de action valido!");
                    return;
                }
            }
        } catch (AppException e) {
            response.sendRedirect("relatorio?action=redirect&message=" + e.getMessage());
            return;
        }
    }

}
