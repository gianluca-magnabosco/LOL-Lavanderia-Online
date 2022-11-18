package servlets;

import beans.ConfigBean;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;


@WebServlet(name = "StartupServlet", urlPatterns = {"/StartupServlet"}, loadOnStartup = 1)
public class StartupServlet extends HttpServlet {

    public void init(ServletConfig config) throws ServletException {
        ConfigBean conf = new ConfigBean();
        conf.setEmail("lol_lavanderia-online@outlook.com");
        
        ServletContext ctx = config.getServletContext();
        ctx.setAttribute("configuracao", conf);
    }
}
