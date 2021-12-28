/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.samith.configs;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

/**
 *
 * @author UDISSSA1
 */
public class MethodStorage {
    
    public static  String getAddYearsDate(String BirthDay,String  PensionAge){
        DateTimeFormatter formatter  = DateTimeFormatter.ofPattern("uuuu-MM-dd");
        LocalDate dateTime = LocalDate.parse(BirthDay, formatter);
        dateTime = dateTime.plusYears( Integer.parseInt(PensionAge));
        return dateTime.format(formatter);
    }
    
    public static  String getPentionDate(){
        DateTimeFormatter formatter  = DateTimeFormatter.ofPattern("uuuu-MM-dd");
        
        LocalDate dateTime  = LocalDate.now();
        dateTime = dateTime.plusMonths(VariableStorage.getPlusMonthsPentionDate());
        return dateTime.format(formatter);
    }
    
    public static  String getSalaryIncreamentDate(){
        DateTimeFormatter formatter  = DateTimeFormatter.ofPattern("MM-dd");
      
        LocalDate dateTime  = LocalDate.now();
        dateTime = dateTime.plusDays(Integer.parseInt("7"));

        return "-"+dateTime.format(formatter);
    }
    
    public static  String getSalaryIncreamentDateString(){
        DateTimeFormatter formatter  = DateTimeFormatter.ofPattern("MM-dd");
      
        LocalDate dateTime  = LocalDate.now();
        dateTime = dateTime.plusDays(Integer.parseInt("7"));

        return dateTime.format(formatter);
    }
    
    public static  String getSalaryIncreamentMonth(){
        DateTimeFormatter formatter  = DateTimeFormatter.ofPattern("MM");
        LocalDate dateTime  = LocalDate.now();
        dateTime = dateTime.plusDays(Integer.parseInt("7"));

        return "-"+dateTime.format(formatter)+"-";
    }
    
   public static String getCurrentYear()
   {
        Date date=new Date();  
        return String.valueOf(date.getYear()+1900);
   }
    
}
