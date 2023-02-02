package com.ufpr.tads.web2.exception;

/**
 *
 * @author Gian
 */
public class ErroAoEnviarEmailException extends AppException {
    
    public ErroAoEnviarEmailException() {
        
    }
    
    public ErroAoEnviarEmailException(String errorMessage) {
        super(errorMessage);
    }
    
    public ErroAoEnviarEmailException(String errorMessage, Throwable throwable) {
        super(errorMessage, throwable);
    }
}

