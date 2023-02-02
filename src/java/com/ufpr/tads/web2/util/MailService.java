package com.ufpr.tads.web2.util;

import com.ufpr.tads.web2.exception.ErroAoEnviarEmailException;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;


/**
 *
 * @author Gian
 */
public class MailService {
    
    private static final String END3R3C0_D0_3M41L = "lol_lavanderia_online-reborn@outlook.com";
    private static final String S3NH4_D0_3M41L = "senhamuitolegal123";
    private static final String SMTP_SERVER = "smtp-mail.outlook.com";
    
    public static void sendUserPasswordEmail(String userEmail, String userPassword) throws ErroAoEnviarEmailException {
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.ssl.trust", SMTP_SERVER);
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", SMTP_SERVER);
        properties.put("mail.smtp.port", "587");
        
        
        Session session = Session.getInstance(properties, new Authenticator() {
           @Override
            protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(END3R3C0_D0_3M41L, S3NH4_D0_3M41L);
           }
        });
        
        
        Message message = prepareMessage(session, userEmail, userPassword);
        try {
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
            throw new ErroAoEnviarEmailException("Erro ao enviar o e-mail com sua senha");
        }
    }
    
    
    
    private static Message prepareMessage(Session session, String userEmail, String userPassword) throws ErroAoEnviarEmailException {
        Message message = new MimeMessage(session);
        
        String htmlPage = "<!DOCTYPE html><html><head><meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\"><meta name=\"viewport\" content=\"width=device-width,initial-scale=1\"><title>Sua senha</title></head><body marginheight=\"0\" topmargin=\"0\" marginwidth=\"0\" style=\"margin:0;background-color:#f2f3f8\" leftmargin=\"0\"><table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"#f2f3f8\" style=\"@import url(https://fonts.cdnfonts.com/css/verdana);font-family:Verdana\"><tr><td><table style=\"background-color:#f2f3f8;max-width:670px;margin:0 auto\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"height:80px\">&nbsp;</td></tr><tr><td style=\"text-align:center\"><img style=\"border-width:0;width:250px;height:160px;margin-bottom:15px;margin-top:5px\" src=\"https://media.discordapp.net/attachments/872237870109298760/1041390707631460532/logo-icone.png\" title=\"logo\" alt=\"Lavanderia On-Line\"></td></tr><tr><td style=\"height:20px\">&nbsp;</td></tr><tr><td><table width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width:670px;background:#fff;border-radius:3px;text-align:center;-webkit-box-shadow:0 6px 18px 0 rgba(0,0,0,.06);-moz-box-shadow:0 6px 18px 0 rgba(0,0,0,.06);box-shadow:0 6px 18px 0 rgba(0,0,0,.06)\"><tr><td style=\"height:40px\">&nbsp;</td></tr><tr><td style=\"padding:0 35px\"><h1 style=\"color:#1e1e2d;font-weight:800;margin:0;font-size:32px;font-family:Rubik,sans-serif\">Seja bem-vindo!</h1><span style=\"display:inline-block;vertical-align:middle;margin:29px 0 26px;border-bottom:1px solid #cecece;width:500px\"></span><p style=\"color:#455056;font-size:15px;line-height:24px;margin:0\">Você foi cadastrado com sucesso no sistema LOL - Lavanderia Online.<br>Estamos enviando neste e-mail a senha que você utilizará para acessar o sistema.<br><div style=\"margin-top:15px;margin-bottom:10px\">Sua senha atual é:<br/><b style=\"align-items:center;border:1px solid transparent;border-radius:4px;box-shadow:none;display:inline-flex;font-size:1rem;height:2.5em;justify-content:flex-start;line-height:1.5;padding-bottom:calc(.5em - 1px);padding-left:calc(.75em - 1px);padding-right:calc(.75em - 1px);padding-top:calc(.5em - 1px);position:relative;vertical-align:top;background-color:#00d1b2;border-color:transparent;color:#fff;margin-top:5px;\"><span>&nbsp;</span>" + userPassword + "<span>&nbsp;</span></b></div><br>Utilize seu e-mail e a senha acima para acessar o sistema. Seja muito bem-vindo!</p></td></tr><tr><td style=\"height:40px\">&nbsp;</td></tr></table></td><tr><td style=\"height:20px\">&nbsp;</td></tr><tr><td style=\"text-align:center\"><p style=\"font-size:14px;color:rgba(69,80,86,.7411764705882353);line-height:18px;margin:0 0 0; margin-top: 25px;\">&copy; <strong> LOL - Lavanderia Online</strong></p></td></tr><tr><td style=\"height:80px\">&nbsp;</td></tr></table></td></tr></table></body></html>";
        
        try {
            message.setFrom(new InternetAddress(END3R3C0_D0_3M41L));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
            message.setSubject("Confirmação de cadastro - LOL Lavanderia Online");
            message.setContent(htmlPage, "text/html");
            return message;
        } catch (Exception e) {
            e.printStackTrace();
            throw new ErroAoEnviarEmailException("Erro ao enviar o e-mail com sua senha");
        }
    }
}
