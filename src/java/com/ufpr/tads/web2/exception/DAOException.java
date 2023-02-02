package com.ufpr.tads.web2.exception;

public class DAOException extends AppException {
    
    public DAOException() {
        
    }
    
    public DAOException(String errorMessage) {
        super(errorMessage);
    }
    
    public DAOException(String errorMessage, Throwable throwable) {
        super(errorMessage, throwable);
    }
}

