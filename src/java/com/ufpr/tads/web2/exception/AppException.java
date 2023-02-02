package com.ufpr.tads.web2.exception;

/**
 *
 * @author Gian
 */
public class AppException extends Exception {
    
    public AppException() {
        
    }
    
    public AppException(String errorMessage) {
        super(errorMessage);
    }
    
    public AppException(String errorMessage, Throwable throwable) {
        super(errorMessage, throwable);
    }
}

