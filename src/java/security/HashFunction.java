package security;

import jakarta.xml.bind.DatatypeConverter;
import java.security.MessageDigest;

public class HashFunction {
    
    public static String getHash(String inputString) {
        String hashValue = "";
        
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
            messageDigest.update(inputString.getBytes());
            byte[] digestedBytes = messageDigest.digest();
            hashValue = DatatypeConverter.printHexBinary(digestedBytes).toLowerCase();
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
        
        return hashValue;
    }
}
