package com.ufpr.tads.web2.exception;

/**
 *
 * @author Gian
 */
public class DataInvalidaException extends AppException {
    
    public DataInvalidaException() {
        
    }
    
    public DataInvalidaException(String errorMessage) {
        super(errorMessage);
    }
    
    public DataInvalidaException(String errorMessage, Throwable throwable) {
        super(errorMessage, throwable);
    }
}
