/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.samith.controller;

import com.samith.configs.VariableStorage;
import com.samith.logging.getLogger;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.annotation.WebListener;

import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.ee.servlet.QuartzInitializerListener;
import org.quartz.impl.StdSchedulerFactory;

@WebListener
public class QuartzListener extends QuartzInitializerListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        super.contextInitialized(sce);
        ServletContext ctx = sce.getServletContext();
        StdSchedulerFactory factory = (StdSchedulerFactory) ctx.getAttribute(QUARTZ_FACTORY_KEY);
        try {
            Scheduler scheduler = factory.getScheduler();
            JobDetail jobDetail = JobBuilder.newJob(EmailSender.class).build();
            Trigger trigger = TriggerBuilder.newTrigger().withIdentity("simple").withSchedule(
                    CronScheduleBuilder.cronSchedule(VariableStorage.getEmailCron())).startNow().build();
            scheduler.scheduleJob(jobDetail, trigger);
            scheduler.start();
        } catch (SchedulerException e) {
            //ctx.log("There was an error scheduling the job.", e);
             getLogger.getLog().debug("There was an error scheduling the job."+e.toString());
        }
    }

}
