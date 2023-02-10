package com.ufpr.tads.web2.exception;

/**
 *
 * @author Gian
 */
public class PermissaoNegadaException extends AppException {
    
    public PermissaoNegadaException() {
        
    }
    
    public PermissaoNegadaException(String errorMessage) {
        super(errorMessage);
    }
    
    public PermissaoNegadaException(String errorMessage, Throwable throwable) {
        super(errorMessage, throwable);
    }
}

