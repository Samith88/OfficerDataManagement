package com.samith.controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author UDISSSA1
 */
import com.samith.logging.getLogger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class EmailSender implements Job {

    @Override
    public void execute(final JobExecutionContext ctx)
            throws JobExecutionException {
        EmailProcessor emailProcessor=new EmailProcessor();
        try {
            emailProcessor.sendPensionOfficerEmails();
        } catch (Exception ex) {
            //Logger.getLogger(EmailSender.class.getName()).log(Level.SEVERE, null, ex);
            getLogger.getLog().debug(ex.toString());
        }
        try {
            emailProcessor.sendSalaryIncreamentEmails();
        } catch (Exception ex) {
            getLogger.getLog().debug(ex.toString());
        }
        try {
            emailProcessor.sendSalaryIncreamentEmailsAll();
        } catch (Exception ex) {
            getLogger.getLog().debug(ex.toString());
        }
    }

}