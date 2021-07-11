/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.samith.configs;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

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
    
}
