package exception;

public class DAOException extends Exception {
    
    public DAOException() {
        
    }
    
    public DAOException(String errorMessage) {
        super(errorMessage);
    }
    
    public DAOException(String errorMessage, Throwable throwable) {
        super(errorMessage, throwable);
    }
}


// TODO: Fazer algum mecanismo genérico pra erros de DAO, redirect pra ErrorPage ou sei la