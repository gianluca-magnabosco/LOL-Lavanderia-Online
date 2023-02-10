package com.ufpr.tads.web2.util;

import com.ufpr.tads.web2.exception.DadoInvalidoException;
import com.ufpr.tads.web2.exception.DataInvalidaException;
import com.ufpr.tads.web2.exception.EmailInvalidoException;

/**
 *
 * @author Gian
 */
public class Validacao {
    
    
    public static void validarInteiro(String id, String errorMessage) throws DadoInvalidoException {
        if (id == null || !id.matches("\\d+")) {
            throw new DadoInvalidoException(errorMessage);
        }
        
        try {
            Integer.parseInt(id);
        } catch (NumberFormatException e) {
            throw new DadoInvalidoException(errorMessage);
        }
    }
    
    
    public static double validarConverterPreco(String preco, String errorMessage) throws DadoInvalidoException {
        if (preco == null || !preco.matches("[Rr]?\\$?\\s*\\d+([\\,\\.]\\d{1,2})?")) {
            throw new DadoInvalidoException(errorMessage);
        }

        double actual_content; 
        
        try { 
            preco = preco.replaceAll("\\,", ".").replaceAll("[Rr]?\\$\\s*", "");
            actual_content = Double.parseDouble(preco);
        } catch (NumberFormatException e) {
            throw new DadoInvalidoException(errorMessage);
        }
        
        return actual_content;
    }

    
    public static void validarVazio(String valor, String errorMessage) throws DadoInvalidoException {
        if (valor == null || !valor.matches(".+")) {
            throw new DadoInvalidoException(errorMessage);
        }
    }
    
    
    public static void validarEmail(String email, String errorMessage) throws EmailInvalidoException {
        if (email == null || !email.matches("[a-zA-Z0-9._%+-]{1,64}@(?:[a-zA-Z0-9-]{1,63}\\.){1,125}[a-zA-Z]{2,63}")) {
            throw new EmailInvalidoException(errorMessage);          
        }
    }
    
    
    public static void validarData(String data, String errorMessage) throws DataInvalidaException {
        if (data == null || !data.matches("\\d{2}\\d{2}\\d{4}")) {
            throw new DataInvalidaException(errorMessage);
        }
    }
}
