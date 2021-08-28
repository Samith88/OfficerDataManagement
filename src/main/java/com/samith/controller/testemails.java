/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.samith.controller;

/**
 *
 * @author UDISSSA1
 */
public class testemails {
    
    public static void main(String args[])  {
    
        EmailProcessor EmailProcessor=new EmailProcessor();
        EmailProcessor.sendEmail("Test Subject", "Test body");
        
    }
    
}
