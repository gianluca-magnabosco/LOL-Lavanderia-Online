package com.ufpr.tads.web2.controller;

import com.ufpr.tads.web2.exception.AppException;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import com.ufpr.tads.web2.model.facade.RegistroFacade;



@WebServlet(name = "RegistroServlet", urlPatterns = {"/registrar"})
public class RegistroServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        String userNome = request.getParameter("nome");
        String userCpf = request.getParameter("cpf");
        String userEmail = request.getParameter("email");
        String userPhoneNumber = request.getParameter("telefone");
        String userAddressCep = request.getParameter("cep");
        String userAddressLogradouro = request.getParameter("logradouro"); 
        String userAddressNumero = request.getParameter("numero");
        String userAddressCidade = request.getParameter("localidade");
        String userAddressEstado = request.getParameter("uf");
        String userAddressBairro = request.getParameter("bairro");
        String userAddressComplemento = request.getParameter("complemento");

    
        try {
            RegistroFacade.registrar(userNome,
                                     userCpf,
                                     userEmail,
                                     userPhoneNumber,
                                     userAddressCep,
                                     userAddressLogradouro,
                                     userAddressNumero,
                                     userAddressCidade,
                                     userAddressEstado,
                                     userAddressBairro,
                                     userAddressComplemento);
            
        } catch (AppException e) {
            String errorMessage = URLEncoder.encode(e.getMessage(), "UTF-8");
            response.sendRedirect("registrar.jsp?message=" + errorMessage);
            return;
        }
        
        String userEmailParameter = URLEncoder.encode(userEmail, "UTF-8");
        response.sendRedirect("cliente/cadastroRealizado.jsp?email=" + userEmailParameter);
    }
    
}
