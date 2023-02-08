package com.ufpr.tads.web2.exception;

/**
 *
 * @author Gian
 */
public class UsuarioOuSenhaInvalidosException extends AppException {
    
    public UsuarioOuSenhaInvalidosException() {
        
    }
    
    public UsuarioOuSenhaInvalidosException(String errorMessage) {
        super(errorMessage);
    }
    
    public UsuarioOuSenhaInvalidosException(String errorMessage, Throwable throwable) {
        super(errorMessage, throwable);
    }
}

