package com.ufpr.tads.web2.exception;

/**
 *
 * @author Gian
 */
public class DadoInvalidoException extends AppException {
    
    public DadoInvalidoException() {
        
    }
    
    public DadoInvalidoException(String errorMessage) {
        super(errorMessage);
    }
    
    public DadoInvalidoException(String errorMessage, Throwable throwable) {
        super(errorMessage, throwable);
    }
}

