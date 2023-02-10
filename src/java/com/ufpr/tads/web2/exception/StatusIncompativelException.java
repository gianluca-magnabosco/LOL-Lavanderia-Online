package com.ufpr.tads.web2.exception;

/**
 *
 * @author Gian
 */
public class StatusIncompativelException extends AppException {
    
    public StatusIncompativelException() {
        
    }
    
    public StatusIncompativelException(String errorMessage) {
        super(errorMessage);
    }
    
    public StatusIncompativelException(String errorMessage, Throwable throwable) {
        super(errorMessage, throwable);
    }
}

