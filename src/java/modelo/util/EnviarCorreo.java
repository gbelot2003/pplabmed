/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.util;

import java.io.*;
import java.util.*;
import javax.mail.*;
import javax.activation.*;
import javax.mail.internet.*;

public class EnviarCorreo {
    private static String user;
    private static String from;
    private static String to;
    private static String subject;
    private static String encabezado_mandar;
    private static String cc;
    private static String bcc;
    private static String SMTPHost;
    private static String password;
    private static String port;
    private static ArrayList<String> attachs;

    public EnviarCorreo() {
    }   
    

    public static int send_mail(String para,
            String copia,           
            String titulo,
            String contenido) {
        user = "itsinergia@outlook.com";
        from = "itsinergia@outlook.com";
        password = "sinergiacala123@";
        to = para;
        subject = titulo;
        cc = copia;
        bcc = "";
        SMTPHost = "smtp.live.com";
        port = "25";
        
       encabezado_mandar =  "<!DOCTYPE html><html><head><meta name='viewport' content='width=device-width, initial-scale=1.0'><meta charset='utf-8'>" +
                            "</head><body>" +
                            "<div class='contenedor' style='width: 700px;top:0px; left:0px; margin: 0 auto;'>" +
                            "<div  style='width: 700px;margin: 0 auto;display:inline-block;margin-left:auto;margin-right:auto;" +
                            "border: 1px rgb(89,89,89) solid;text-shadow: 0px 0px 0px rgb(89,89,89);" +
                            "-moz-box-shadow:  0px 0px 16px 7px rgb(128,128,128);-webkit-box-shadow:  0px 0px 16px 7px rgb(128,128,128);" +
                            "box-shadow:  0px 0px 16px 7px rgb(128,128,128);'>" +
                            "<div style='margin-left: 2em; margin-right: 2em;'>" + contenido+
                            "<br><p style='font-family: sans-serif;text-align: justify;font-size:16px;color:#76A0B1;'>Por favor no responda o envíe consultas a este correo, gracias de antemano. </p><br>" +
                            "</div>" +
                            "</body></html>";
        
       
        Multipart multipart = new MimeMultipart();
        try {
            Properties props = System.getProperties();
            props.put("mail.smtp.host", SMTPHost);
            props.setProperty("mail.smtp.auth", "true");
            props.setProperty("mail.smtp.port", port);
            props.setProperty("mail.smtp.auth", "true");  
            props.setProperty("mail.smtp.starttls.enable", "true");
            props.setProperty("mail.smtp.user", user);
            Session session = Session.getDefaultInstance(props,null);
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(from));
            // To
            if (to != null && to.length() > 0) {
                msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            }
            // CC
            if (cc != null && cc.length() > 0) {
                msg.setRecipients(Message.RecipientType.CC, InternetAddress.parse(cc, false));
            }
            // BCC
            if (bcc != null && bcc.length() > 0) {
                msg.setRecipients(Message.RecipientType.BCC, InternetAddress.parse(bcc, false));
            }
            // Subject
            if (subject != null && subject.length() > 0) {
                msg.setSubject(subject);
            } else {
                msg.setSubject("(no subject)");
            }
            // date 
            msg.setSentDate(new Date());

            // Create the message part para el encabezado
            BodyPart messageBodyPart = new MimeBodyPart();
            //messageBodyPart.setText(encabezado_mandar);
            messageBodyPart.setContent(encabezado_mandar, "text/html");
            multipart.addBodyPart(messageBodyPart);
            
            messageBodyPart = new MimeBodyPart();
            DataSource source = null;
            
            //attach 2
         /*  if(attachs.size() == 0)
            {
                // Put parts in message
                msg.setContent(multipart);                                        
                
                // Envio del mensaje
                Transport.send(msg);				
                //rc = 1;
                return 1 ;                                
            }
            else
            {
                for (int i=0; i<attachs.size();i++)
                {
                    MimeBodyPart addfile = new MimeBodyPart();
                    addfile.setDataHandler(new DataHandler(new FileDataSource(attachs.get(i).toString())));
                    addfile.setFileName(new FileDataSource(attachs.get(i).toString()).getName());
                    multipart.addBodyPart(addfile);
                }
                
                // Put parts in message
                msg.setContent(multipart);
            }*/
            msg.setContent(multipart);
            Transport t = session.getTransport("smtp");
            t.connect(user, password);
            t.sendMessage(msg, msg.getAllRecipients());
            t.close();
            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
}



