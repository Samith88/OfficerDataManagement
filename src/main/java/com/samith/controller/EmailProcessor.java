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
        System.setProperty("mail.mime.charset", "UTF-8");
        System.out.println(mailBody);
        Properties properties = System.getProperties();
        // Setup mail server
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", VariableStorage.getSmtpHost());
        properties.put("mail.smtp.port",VariableStorage.getSmtpPort());
        // Get the Session object.// and pass username and password
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(VariableStorage.getEuser(), VariableStorage.getEpass());
            }
        });
        session.setDebug(true);
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(VariableStorage.getEuser()));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(VariableStorage.getToAddress()));

             message.setSubject(subject,"utf-8");
             MimeMultipart multipart = new MimeMultipart("related");

            BodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setContent(mailBody, "text/html; charset=utf-8");
            messageBodyPart.setText(mailBody);
            messageBodyPart.setHeader("Content-Type", "text/html");
        
            multipart.addBodyPart(messageBodyPart);
        
            message.setContent(multipart);
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
                        sendEmail("නිලධාරි විශ්‍රාම  තොරතුරු:"+getCurrentDate(),getEmailBody(officers));
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
        String fullTable="";
        
        for (int i = 0; i < officers.size(); i++) {
            String oneOfficer="";
             Officer officer= officers.get(i);
             oneOfficer += "<tr><td><b>නම:</b></td><td><b>"+officer.getEmpName()+"</b></td></tr>";
             oneOfficer += "<tr><td><b>අනු අංකය:</b></td><td><b>"+officer.getIndexNumber()+"</b></td></tr>";
             oneOfficer += "<tr><td><b>විශ්‍රාම ලබන වයස දිනය: </b></td><td><b>"+officer.getPensionDate()+"</b></td></tr>";
             oneOfficer += "<tr><td><b> තනතුර : </b></td><td><b>"+officer.getOfficeType()+"</b></td></tr>";
             oneOfficer += "<tr><td><b> විෂය : </b></td><td><b>"+officer.getDesignation()+"</b></td></tr>";
             oneOfficer += "<tr><td><b> සේවා ස්තානය : </b></td><td><b>"+officer.getOfficeLocation()+"</b></td></tr>";
             oneOfficer += "<tr><td><b>  වැටුප් අංකය   : </b></td><td><b>"+officer.getSalaryNo()+"</b></td></tr>";
             oneOfficer += "<tr><td><b>  වැටුප් වර්ධක දිනය   : </b></td><td><b>"+officer.getSalaryIncreamentDate()+"</b></td></tr>";
             oneOfficer += "<tr><td>****** </td><td> ******</td></tr>";
             
             fullTable += oneOfficer;
        }
        return "<html><body>"+"<h1>"+"නිලධාරි විශ්‍රාම  තොරතුරු:"+getCurrentDate()+"<h1>"+"<table>" +  fullTable+"</table></body></html>";
    }
    
    private String getCurrentDate(){
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm"); 
        LocalDateTime now = LocalDateTime.now();  
        return dtf.format(now);
    }
    
}
