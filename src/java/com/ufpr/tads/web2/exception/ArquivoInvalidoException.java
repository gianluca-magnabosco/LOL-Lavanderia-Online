
package com.ufpr.tads.web2.exception;

/**
 *
 * @author Gian
 */
public class ArquivoInvalidoException extends AppException {
    
    public ArquivoInvalidoException() {
        
    }
    
    public ArquivoInvalidoException(String errorMessage) {
        super(errorMessage);
    }
    
    public ArquivoInvalidoException(String errorMessage, Throwable throwable) {
        super(errorMessage, throwable);
    }
}



