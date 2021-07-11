/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.samith.controller;

import com.samith.base.Officer;
import com.samith.configs.MethodStorage;
import com.samith.configs.VariableStorage;
import com.samith.dao.OfficerDB;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
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
        properties.put("mail.smtp.port",VariableStorage.getSmtpPort());
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
    
    public  void  sendPensionOfficerEmails() throws Exception{
         OfficerDB officerDB=new OfficerDB();
         boolean isEmailSendSuccess=false;
         List<Officer> officers = officerDB.getOfficerAllByPensionDate(MethodStorage.getPentionDate());
         try{
                if(officers.size()>0){
                        sendEmail("Officer Pension Details:"+getCurrentDate(),getEmailBody(officers));
                        isEmailSendSuccess=true;
                }
                else
                        System.out.println("No pension officers for today");
           } catch (Exception e) {
               System.out.println("Error in getting pension officers");
           }  

         try{
                if(isEmailSendSuccess){
                        officerDB.updatePensionDetails(officers);
                        System.out.println("Pension email entry updated in DB after send emails");
                }
                else
                        System.out.println("No Pension email entry updated in DB");
           } catch (Exception e) {
               System.out.println("Error in pension email entry update  DB");
           }
         
         
    }
    
    public String getEmailBody(List<Officer> officers){
    
        String startEmail="</html></head><body>";
        String endEmail="</table></div></body></html>";
        String fullTable="";
        
        for (int i = 0; i < officers.size(); i++) {
            String oneOfficer="";
             Officer officer= officers.get(i);
             oneOfficer += "<tr><td><b>Name:</b></td><td><b>"+officer.getEmpName()+"</b></td></tr>";
             oneOfficer += "<tr><td><b>Employee Id:</b></td><td><b>"+officer.getIndexNumber()+"</b></td></tr>";
             oneOfficer += "<tr><td><b> Pension  Date: </b></td><td><b>"+officer.getPensionDate()+"</b></td></tr>";
             oneOfficer += "<tr><td><b> Designation : </b></td><td><b>"+officer.getDesignation()+"</b></td></tr>";
             oneOfficer += "<tr><td><b> Office Location : </b></td><td><b>"+officer.getOfficeLocation()+"</b></td></tr>";
             oneOfficer += "<tr><td></td><td></td></tr>";
             
             fullTable += oneOfficer;
        }
        return startEmail+"<h1>"+"Officer Pension Details:"+getCurrentDate()+"<h1>"+fullTable+endEmail;
    }
    
    private String getCurrentDate(){
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm"); 
        LocalDateTime now = LocalDateTime.now();  
        return dtf.format(now);
    }
    
}
