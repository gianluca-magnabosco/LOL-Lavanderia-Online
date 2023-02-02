package com.ufpr.tads.web2.security;

import java.security.SecureRandom;
import java.util.Random;


public class RandomPasswordGenerator {
    
    private static final String SYMBOLS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    
    public static String getRandomPassword(int length) {
        Random random = new SecureRandom();
        StringBuilder builder = new StringBuilder(length);
        
        for (int i = 0; i < length; i++) {
            builder.append(SYMBOLS.charAt(random.nextInt(SYMBOLS.length())));
        }
        
        return builder.toString();
    }
    
}
