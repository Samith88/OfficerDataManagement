/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.samith.controller;

import com.samith.configs.VariableStorage;
import java.util.Properties;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 *
 * @author UDISSSA1
 */
public class EmailProcessor {
    public void sendEmail(String subject,String mailBody) {
        // Get system properties
        Properties properties = System.getProperties();
        // Setup mail server
        properties.put("mail.smtp.host", VariableStorage.getSmtpHost());
        properties.put("mail.smtp.host",VariableStorage.getSmtpPort());
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");
        // Get the Session object.// and pass username and password
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(VariableStorage.getEuser(), VariableStorage.getEpass());
            }
        });
        // Used to debug SMTP issues
        session.setDebug(true);
        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);
            // Set From: header field of the header.
            message.setFrom(new InternetAddress(VariableStorage.getEuser()));
            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(VariableStorage.getToAddress()));
            // Set Subject: header field
            message.setSubject(subject);
            // Now set the actual message
         MimeMultipart multipart = new MimeMultipart("related");

         // first part (the html)
         BodyPart messageBodyPart = new MimeBodyPart();
         message.setHeader("Content-Type", "text/html; charset=UTF-8");
        // String htmlText = " <h1>Officer Data Management</h1><br> <h1>Officer data</h1>";
         messageBodyPart.setContent(mailBody, "text/html");

         multipart.addBodyPart(messageBodyPart);

         // second part (the image)
         //messageBodyPart = new MimeBodyPart();
         //DataSource fds = new FileDataSource(
         //   "/home/rishabh.mishra/sampleimage.png");

         //messageBodyPart.setDataHandler(new DataHandler(fds));
         //messageBodyPart.setHeader("Content-ID", "<image-id>");

         // add image to the multipart
         multipart.addBodyPart(messageBodyPart);

         // put everything together
         message.setContent(multipart);
         // Send message
         Transport.send(message);
            System.out.println("Email Sent message successfully....");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }
}
