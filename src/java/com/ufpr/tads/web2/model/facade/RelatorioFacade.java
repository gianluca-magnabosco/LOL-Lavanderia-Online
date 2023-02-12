package com.ufpr.tads.web2.model.facade;

import com.ufpr.tads.web2.exception.DAOException;
import com.ufpr.tads.web2.model.dao.ConnectionFactory;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URL;
import java.util.HashMap;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;

/**
 *
 * @author Gian
 */
public class RelatorioFacade {
    
    public static void gerarRelatorio(String jasper, String host, OutputStream output) throws IOException, DAOException, JRException {
        try (ConnectionFactory factory = new ConnectionFactory()) {

            URL jasperURL = new URL(host + jasper);
            HashMap params = new HashMap();
            
            byte[] bytes;
            bytes = JasperRunManager.runReportToPdf(jasperURL.openStream(), params, factory.getConnection());
            if (bytes != null) {
                output.write(bytes);
            }
        }
    }
}
