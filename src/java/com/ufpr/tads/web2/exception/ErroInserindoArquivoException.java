package com.ufpr.tads.web2.exception;

/**
 *
 * @author Gian
 */
public class ErroInserindoArquivoException extends AppException {
    
    public ErroInserindoArquivoException() {
        
    }
    
    public ErroInserindoArquivoException(String errorMessage) {
        super(errorMessage);
    }
    
    public ErroInserindoArquivoException(String errorMessage, Throwable throwable) {
        super(errorMessage, throwable);
    }
}
