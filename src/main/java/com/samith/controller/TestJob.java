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
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import java.text.SimpleDateFormat;  
import java.util.Date;  

public class TestJob implements Job {

    @Override
    public void execute(final JobExecutionContext ctx)
            throws JobExecutionException {
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
        Date date = new Date();  
        System.out.println("Job1: Executing Job at: "+formatter.format(date));

    }

}