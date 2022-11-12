package util;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;


public class MailService {
    
    private static final String EMAIL_ADDRESS = "lol_lavanderia_online@outlook.com";
    private static final String EMAIL_PASSWORD = "senhalegal123";
    private static final String SMTP_SERVER = "smtp-mail.outlook.com";
    
    public static void sendUserPasswordEmail(String userEmail, String userPassword) {
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.ssl.trust", SMTP_SERVER);
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", SMTP_SERVER);
        properties.put("mail.smtp.port", "587");
        
        
        Session session = Session.getInstance(properties, new Authenticator() {
           @Override
           protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(EMAIL_ADDRESS, EMAIL_PASSWORD);
           }
        });
        
        
        Message message = prepareMessage(session, userEmail, userPassword);
        try {
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
    
    
    
    private static Message prepareMessage(Session session, String userEmail, String userPassword) {
        Message message = new MimeMessage(session);
       
        try {
            message.setFrom(new InternetAddress(EMAIL_ADDRESS));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
            message.setSubject("Confirmação de cadastro - LOL Lavanderia Online");
            message.setText("Olá tudo bem?\n\nSua conta no sistema LOL - Lavanderia Online foi criada com sucesso!\n\nPara acessar o sistema utilize seu e-mail e a senha a seguir: " + userPassword);
            return message;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }
}
