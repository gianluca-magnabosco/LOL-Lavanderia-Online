package com.ufpr.tads.web2.controller;

import com.ufpr.tads.web2.exception.AppException;
import com.ufpr.tads.web2.exception.DadoInvalidoException;
import com.ufpr.tads.web2.exception.PermissaoNegadaException;
import com.ufpr.tads.web2.model.beans.LoginBean;
import com.ufpr.tads.web2.model.domain.Item;
import com.ufpr.tads.web2.model.domain.Pedido;
import com.ufpr.tads.web2.model.facade.PedidoFacade;
import com.ufpr.tads.web2.util.Validacao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.nio.charset.StandardCharsets;
import java.util.List;
import org.apache.commons.io.IOUtils;


/**
 *
 * @author Gian
 */
@WebServlet(name = "PedidoServlet", urlPatterns = {"/pedido"})
public class PedidoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, DadoInvalidoException {
        
        HttpSession session = request.getSession();
        
        LoginBean login = (LoginBean) session.getAttribute("login");
        
        if (login == null) {
            response.sendRedirect("login.jsp?message=Voce+precisa+estar+logado+para+acessar+esta+pagina");
            return;
        }
        
        String action = request.getParameter("action");

        try {
            
            Validacao.validarVazio(action, "Eh necessario enviar um parametro action!");
            
            switch (action) {
                case "inicio" -> {
                    if (login.getRole().equals("Cliente")) {
                        List<Pedido> pedidos = PedidoFacade.listByUserIdEmAberto(login.getId());
                        
                        request.setAttribute("pedidos", pedidos);
                        request.getRequestDispatcher("cliente/inicio.jsp").forward(request, response);
                        return;
                    }
                    
                    if (login.getRole().equals("Funcionario")) {
                        List<Pedido> pedidos = PedidoFacade.listAllEmAberto();
                        
                        request.setAttribute("pedidos", pedidos);
                        request.getRequestDispatcher("funcionario/inicio.jsp").forward(request, response); 
                        return;
                    }
                }
                
                case "listar" -> {
                    if (login.getRole().equals("Cliente")) {
                        List<Pedido> pedidos = PedidoFacade.listAllByUser(login.getId());
                        
                        String message = (String) request.getAttribute("message");
                        if (message != null) {
                            request.setAttribute("message", message);
                        }
                        
                        String realizado = request.getParameter("realizado");
                        String id = request.getParameter("id");
                        
                        if (realizado != null && realizado.equals("true") && id != null && !id.equals("")) {
                            request.setAttribute("realizado", realizado);
                            request.setAttribute("id", id);
                        }
                        
                        request.setAttribute("pedidos", pedidos);
                        request.getRequestDispatcher("cliente/listarPedidos.jsp").forward(request, response); 
                        return;
                    }
                    
                    if (login.getRole().equals("Funcionario")) {
                        List<Pedido> pedidos = PedidoFacade.listAll();
                        
                        String message = request.getParameter("message");
                        if (message != null) {
                            request.setAttribute("message", message);
                        }
                        
                        request.setAttribute("pedidos", pedidos);
                        request.getRequestDispatcher("funcionario/listarPedidos.jsp").forward(request, response); 
                        return;
                    }
                }
                
                case "formPedido" -> {
                    
                    List<Item> itens = PedidoFacade.formPedido();
                    
                    request.setAttribute("itens", itens);
                    
                    request.getRequestDispatcher("cliente/realizarPedido.jsp").forward(request, response); 
                    return;
                }
                
                case "realizar" -> {
                    if (login.getRole().equals("Cliente")) {
                        
                        String status = request.getParameter("status");
                        
                        String body = IOUtils.toString(request.getInputStream(), StandardCharsets.UTF_8);

                        int idUser = login.getId();
                        
                        PedidoFacade.insert(body, idUser, status);

                        response.sendRedirect("pedido?action=listar");
                        return;
                    } else {
                        response.sendRedirect("pedido?action=listar&message=Nao+permitido+para+funcionarios");
                    }
                }
                
                case "insertSuccess" -> {
                    int id = PedidoFacade.getLastInserted();
                    response.sendRedirect("pedido?action=listar&realizado=true&id=" + id);
                    return;
                }
    
                case "pesquisar" -> {
                    request.getRequestDispatcher("cliente/consultarPedido.jsp").forward(request, response); 
                    return;
                }
                
                case "consultar" -> {
                    String id = request.getParameter("id");
                    
                    try {
                        Pedido pedido = PedidoFacade.listById(id);     
                        
                        if (login.getRole().equals("Cliente") && pedido.getUser().getId() != login.getId()) {
                            throw new PermissaoNegadaException("Esse pedido nao foi feito por voce!");
                        }
                        
                        request.setAttribute("pedido", pedido);
                        
                    } catch (AppException e) {
                        request.setAttribute("message", e.getMessage());
                        request.getRequestDispatcher("cliente/consultarPedido.jsp").forward(request, response); 
                    }
                    
                    
                    if (login.getRole().equals("Cliente")) {
                        request.getRequestDispatcher("cliente/detalhesPedido.jsp").forward(request, response); 
                        return;
                    }
                    
                    if (login.getRole().equals("Funcionario")) {
                        request.getRequestDispatcher("funcionario/detalhesPedido.jsp").forward(request, response); 
                        return;
                    }
                }
                
                case "cancelar" -> {
                    if (login.getRole().equals("Cliente")) {
                        String id = request.getParameter("id");
                        
                        PedidoFacade.cancelar(id);
                        
                        response.sendRedirect("pedido?action=listar");
                        return;
                    } else {
                        response.sendRedirect("pedido?action=listar&message=Nao+permitido+para+funcionarios");
                        return;
                    }
                }
                
                case "pagar" -> {
                    if (login.getRole().equals("Cliente")) {
                        String id = request.getParameter("id");
                        
                        PedidoFacade.pagar(id);
                        
                        response.sendRedirect("pedido?action=listar");
                        return;
                    } else {
                        response.sendRedirect("pedido?action=listar&message=Nao+permitido+para+funcionarios");
                        return;
                    }
                }
                
                case "recolher" -> {
                    if (login.getRole().equals("Funcionario")) {
                        String id = request.getParameter("id");
                        
                        PedidoFacade.recolher(id);
                        
                        response.sendRedirect("pedido?action=listar");
                        return;
                    } else {
                        response.sendRedirect("pedido?action=listar&message=Nao+permitido+para+clientes");
                        return;
                    }
                }
                
                case "confirmar" -> {
                    if (login.getRole().equals("Funcionario")) {
                        String id = request.getParameter("id");
                        
                        PedidoFacade.confirmar(id);
                        
                        response.sendRedirect("pedido?action=listar");
                        return;
                    } else {
                        response.sendRedirect("pedido?action=listar&message=Nao+permitido+para+clientes");
                        return;
                    }
                }
                
                case "finalizar" -> {
                    if (login.getRole().equals("Funcionario")) {
                        String id = request.getParameter("id");
                        
                        PedidoFacade.finalizar(id);
                        
                        response.sendRedirect("pedido?action=listar");
                        return;
                    } else {
                        response.sendRedirect("pedido?action=listar&message=Nao+permitido+para+clientes");
                        return;
                    }
                }
                
                default -> {
                    throw new DadoInvalidoException("Eh necessario enviar um parametro action valido!");
                }
                
            }
        } catch (AppException e) {
            response.sendRedirect("pedido?action=listar&message=" + e.getMessage());
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
