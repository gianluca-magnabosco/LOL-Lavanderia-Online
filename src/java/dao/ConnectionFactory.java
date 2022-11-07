package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import exception.DAOException;

public class ConnectionFactory implements AutoCloseable {
    private static final String DRIVER = "org.postgresql.Driver";
    private static final String URL = "jdbc:postgresql://localhost:5432/lavanderia";
    private static final String LOGIN = "postgres";
    private static final String PASSWORD = "postgres";
    
    private Connection con = null;
    
    
    public ConnectionFactory() {
        super();
    }
    
    public Connection getConnection() throws DAOException {
        if (con == null) {
            try {
                Class.forName(DRIVER);
                con = DriverManager.getConnection(URL, LOGIN, PASSWORD);
            }
            catch(ClassNotFoundException e) {
                throw new DAOException("Driver do banco de dados não encontrado: " + DRIVER, e);
            }
            catch(SQLException e) {
                throw new DAOException("Erro conectando ao BD: " + URL + "/" + LOGIN + "/" + PASSWORD, e);
            } 
        }
        
        return con;
    }    
    
    
    @Override
    public void close() {
        if (con != null) {
            try {
                con.close();
                con = null;
            }
            catch(Exception e) {
                System.out.println("Erro fechando a conexão. IGNORADO");
                e.printStackTrace();
            }
        }
    }
    
}
