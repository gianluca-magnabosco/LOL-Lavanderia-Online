package com.ufpr.tads.web2.controller;

import com.ufpr.tads.web2.model.beans.ConfigBean;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;


@WebServlet(name = "StartupServlet", urlPatterns = {"/startup"}, loadOnStartup = 1)
public class StartupServlet extends HttpServlet {

    public void init(ServletConfig config) throws ServletException {
        ConfigBean conf = new ConfigBean();
        conf.setEmail("lol_lavanderiaonline@outlook.com");
        
        ServletContext ctx = config.getServletContext();
        ctx.setAttribute("configuracao", conf);
    }
}
