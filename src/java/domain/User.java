package domain;
 
import java.io.Serializable;

public class User implements Serializable {
    private int id;
    private int idEndereco;
    private String cpf;
    private String fullName;
    private String email;
    private String phoneNumber;
    private String password;
    private String role;
    
    
    public User() {
        
    }
    
    
    public User(String cpf, String fullName, String email, String phoneNumber, String password, String role) {
        this.cpf = cpf;
        this.fullName = fullName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.password = password;
        this.role = role;
    }
    
    public User(int id, int addressId, String cpf, String fullName, String email, String phoneNumber, String password, String role) {
        this.id = id;
        this.idEndereco = addressId;
        this.cpf = cpf;
        this.fullName = fullName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.password = password;
        this.role = role;
    }
    
    
    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public int getIdEndereco() {
        return this.idEndereco;
    }
    
    public void setIdEndereco(int addressId) {
        this.idEndereco = addressId;
    }
    
    public String getCpf() {
        return this.cpf;
    }
    
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getFullName() {
        return this.fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return this.phoneNumber;
    }
    
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    
    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return this.role;
    }
    
    public void setRole(String role) {
        this.role = role;
    }
     
}