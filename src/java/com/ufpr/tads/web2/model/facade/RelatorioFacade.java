package com.ufpr.tads.web2.model.facade;

import com.ufpr.tads.web2.exception.DAOException;
import com.ufpr.tads.web2.exception.DadoInvalidoException;
import com.ufpr.tads.web2.model.dao.ConnectionFactory;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
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
    
    public static void gerarRelatorioComData(String jasper, String host, OutputStream output, String dataInicio, String dataFim) throws IOException, DAOException, JRException, ParseException, DadoInvalidoException {
        try (ConnectionFactory factory = new ConnectionFactory()) {
            
            Date dateInicio = new Date();
            Date dateFim = new Date();
            
            if ((dataInicio != null && !dataInicio.equals("")) && (dataFim != null && !dataFim.equals(""))) {
                try {
                    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                    dateInicio = formatter.parse(dataInicio);
                    dateFim = formatter.parse(dataFim);
                } catch (Exception e) {
                    throw new DadoInvalidoException("Data inserida eh invalida");
                }
            }

            URL jasperURL = new URL(host + jasper);
                        
            Map<String, Object> parameters = new HashMap<>();
            
            if ((dataInicio != null && !dataInicio.equals("")) && (dataFim != null && !dataFim.equals(""))) {
                parameters.put("data_inicio", dateInicio);
                parameters.put("data_fim", dateFim);
            }
            
            byte[] bytes;
            bytes = JasperRunManager.runReportToPdf(jasperURL.openStream(), parameters, factory.getConnection());
            if (bytes != null) {
                output.write(bytes);
            }
        }
    }
    
                            

}
