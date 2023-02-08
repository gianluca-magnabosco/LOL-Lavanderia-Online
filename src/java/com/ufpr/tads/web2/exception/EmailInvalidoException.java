package com.ufpr.tads.web2.exception;

/**
 *
 * @author Gian
 */
public class EmailInvalidoException extends AppException {
    
    public EmailInvalidoException() {
        
    }
    
    public EmailInvalidoException(String errorMessage) {
        super(errorMessage);
    }
    
    public EmailInvalidoException(String errorMessage, Throwable throwable) {
        super(errorMessage, throwable);
    }
}

