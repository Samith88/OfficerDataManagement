/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.samith.controller;

import com.samith.base.Officer;
import com.samith.configs.MethodStorage;
import static com.samith.configs.MethodStorage.getSalaryIncreamentDateString;
import com.samith.configs.VariableStorage;
import com.samith.dao.OfficerDB;
import com.samith.logging.getLogger;
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
    public boolean sendEmail(String subject,String mailBody) {
        // Get system properties
        System.setProperty("mail.mime.charset", "UTF-8");
        getLogger.getLog().debug(mailBody);
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
            getLogger.getLog().debug("Email Sent message successfully....");
            return true;
        } catch (MessagingException mex) {
            getLogger.getLog().debug(mex.toString());
            return false;
        }
    }
    
    public boolean sendEmail(String subject,String mailBody, String ToAddress) {
        // Get system properties
        System.setProperty("mail.mime.charset", "UTF-8");
        getLogger.getLog().debug(mailBody);
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
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(ToAddress));

             message.setSubject(subject,"utf-8");
             MimeMultipart multipart = new MimeMultipart("related");

            BodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setContent(mailBody, "text/html; charset=utf-8");
            messageBodyPart.setText(mailBody);
            messageBodyPart.setHeader("Content-Type", "text/html");
        
            multipart.addBodyPart(messageBodyPart);
        
            message.setContent(multipart);
            Transport.send(message);
            getLogger.getLog().debug("Email Sent message successfully....");
            return true;
            
        } catch (MessagingException mex) {
            getLogger.getLog().debug(mex.toString());
            return false;
        }
    }
    
    public  void  sendPensionOfficerEmails() throws Exception{
         OfficerDB officerDB=new OfficerDB();
         boolean isEmailSendSuccess=false;
         List<Officer> officers = officerDB.getOfficerAllByPensionDate(MethodStorage.getPentionDate());
         try{
                if(officers.size()>0){
                        if(sendEmail("නිලධාරි විශ්‍රාම  තොරතුරු:"+getCurrentDate(),getEmailBodyPension(officers)))
                            officerDB.updatePensionDetails(officers);
                }
                else
                        getLogger.getLog().debug("No pension officers for today");
           } catch (Exception e) {
               getLogger.getLog().debug("Error in getting pension officers");
           } 
         
    }
    
    public  void  sendSalaryIncreamentEmails() throws Exception{
         OfficerDB officerDB=new OfficerDB();
         List<Officer> officers = officerDB.getOfficerAllBySalaryIncreamentDate(MethodStorage.getSalaryIncreamentDate());
         if(officers.size()>0){
              for (Officer  officer: officers) {
                try{
                           if(sendEmail("නිලධාරි වැටුප්  වැඩිවීම්  තොරතුරු:"+getCurrentDate(),getEmailBodyPerOfficerSalaryIncreament(officer),officer.getEmail()))
                                officerDB.updateCurrentSalaryIncreamentYear(officer);
                    
                   } catch (Exception e) {
                       getLogger.getLog().debug("Error in sending salary increment details for officer: '"+officer.getEmpName()+"' ");
                   }
              }
         }
         else
              getLogger.getLog().debug("No salary increment officers for today");
         
    }
    
     public  void  sendSalaryIncreamentEmailsAll() throws Exception{
         OfficerDB officerDB=new OfficerDB();
         List<Officer> officers = officerDB.getMonthOfficersForSalaryIncreament(MethodStorage.getSalaryIncreamentMonth());
         if(officers.size()>0){
                try{
                           if(sendEmail("නිලධාරි වැටුප්  වැඩිවීම්  තොරතුරු:"+getCurrentDate(),getEmailBodyAllSalaryIncreament(officers)))
                                    officerDB.updateCurrentSalaryIncreamentYearAll(officers);
                   } catch (Exception e) {
                       getLogger.getLog().debug("Error in sending summary of salary increment details for officers");
                   }
         }
         else
              getLogger.getLog().debug("No salary increment officers for today to send monthly salary increament details");
         
    }

    public String getEmailBodyPension(List<Officer> officers){
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
             oneOfficer += "<tr><td>****** </td><td> ******</td></tr>";
             
             fullTable += oneOfficer;
        }
        return "<html><body>"+"<h3>"+"නිලධාරි විශ්‍රාම  තොරතුරු:"+getCurrentDate()+"</h3>"+"<br/><table>" +  fullTable+"</table></body></html>";
    }
    
     public String getEmailBodyAllSalaryIncreament(List<Officer> officers){
        String fullTable="";
        
        for (int i = 0; i < officers.size(); i++) {
             String oneOfficer="";
             Officer officer= officers.get(i);
             oneOfficer += "<tr><td><b>නම:</b></td><td><b>"+officer.getEmpName()+"</b></td></tr>";
             oneOfficer += "<tr><td><b>අනු අංකය:</b></td><td><b>"+officer.getIndexNumber()+"</b></td></tr>";
             oneOfficer += "<tr><td><b>වැටුප් වැඩිවීම් දිනය: </b></td><td><b>"+getSalaryIncreamentDateString()+"</b></td></tr>";
             oneOfficer += "<tr><td><b> තනතුර : </b></td><td><b>"+officer.getOfficeType()+"</b></td></tr>";
             oneOfficer += "<tr><td><b> විෂය : </b></td><td><b>"+officer.getDesignation()+"</b></td></tr>";
             oneOfficer += "<tr><td><b>  වැටුප් අංකය   : </b></td><td><b>"+officer.getSalaryNo()+"</b></td></tr>";
             oneOfficer += "<tr><td>****** </td><td> ******</td></tr>";
             
             fullTable += oneOfficer;
        }
        return "<html><body>"+"<h3>"+"නිලධාරි වැටුප්  වැඩිවීම්  තොරතුරු:"+getCurrentDate()+"</h3>"+"<br/><table>" +  fullTable+"</table></body></html>";
    }
    
    public String getEmailBodyPerOfficerSalaryIncreament(Officer officer){
            String oneOfficer="";
            oneOfficer += "<tr><td><b>නම:</b></td><td><b>"+officer.getEmpName()+"</b></td></tr>";
            oneOfficer += "<tr><td><b>අනු අංකය:</b></td><td><b>"+officer.getIndexNumber()+"</b></td></tr>";
            oneOfficer += "<tr><td><b>වැටුප් වැඩිවීම් දිනය: </b></td><td><b>"+getSalaryIncreamentDateString()+"</b></td></tr>";
            oneOfficer += "<tr><td><b> තනතුර : </b></td><td><b>"+officer.getOfficeType()+"</b></td></tr>";
            oneOfficer += "<tr><td><b> විෂය : </b></td><td><b>"+officer.getDesignation()+"</b></td></tr>";
            oneOfficer += "<tr><td><b>  වැටුප් අංකය   : </b></td><td><b>"+officer.getSalaryNo()+"</b></td></tr>";
            oneOfficer += "<tr><td>****** </td><td> ******</td></tr>";

        return "<html><body>"+"<h3>"+"නිලධාරි වැටුප්  වැඩිවීම්  තොරතුරු: "+officer.getEmpName()+"</h3>"+"<br/> හිතවත් "+officer.getEmpName()+", <br/> ඔබගේ වේතන වැඩිවීම සදහන් කල දවසේ යෙදි ඇති බැවින් කරුනාකර ඒ සදහා ලිපියක් ඉදිරිපත් කරන්න."
                + "<br/> <table>" + oneOfficer + "</table></body></html>";
    }    
    
    private String getCurrentDate(){
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm"); 
        LocalDateTime now = LocalDateTime.now();  
        return dtf.format(now);
    }
    
}
