/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package officerdatamanager;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author UDISSSA1
 */
public class DateDetails {
    
    private static final Calendar calendar = Calendar.getInstance();
    
    public static String getDateNextMonth(){
        calendar.set(Calendar.MONTH, Calendar.MONTH);
        calendar.set(Calendar.DAY_OF_MONTH, 31);
        calendar.add(Calendar.MONTH, 1);
        
        if(String.valueOf(Calendar.MONTH).length()==1)
            return "0"+String.valueOf(Calendar.MONTH);
        else
            return String.valueOf(Calendar.MONTH);
    }
    public static String getDateNextYear(){
        calendar.set(Calendar.MONTH, Calendar.MONTH);
        calendar.set(Calendar.DAY_OF_MONTH, 31);
        calendar.add(Calendar.MONTH, 1);        
        
        return String.valueOf(calendar.get(Calendar.YEAR));
    }    
    public static String getDateMonth(){
        Date date = new Date();
        LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        if(String.valueOf(localDate.getMonthValue()).length()==1)
            return "0"+String.valueOf(localDate.getMonthValue());
        else
            return String.valueOf(localDate.getMonthValue());
    }

    public static String getDateDate(){
        Date date = new Date();
        LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        if(String.valueOf(localDate.getDayOfMonth()).length()==1)
            return "0"+String.valueOf(localDate.getDayOfMonth());
        else
            return String.valueOf(localDate.getDayOfMonth());
    }   
    
    public static String  getDateYear(){
        Date date = new Date();
        LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        return String.valueOf(localDate.getYear());
    }       
 
    public static String getDateHour(){
        if(String.valueOf(calendar.get(Calendar.HOUR)).length()==1)
            return "0"+String.valueOf(calendar.get(Calendar.HOUR));
        else
           return String.valueOf(calendar.get(Calendar.HOUR));
    }
    
    public static String getDateMinute(){
        if(String.valueOf(calendar.get(Calendar.MINUTE)).length()==1)
            return "0"+String.valueOf(calendar.get(Calendar.MINUTE));
        else
           return String.valueOf(calendar.get(Calendar.MINUTE));
    }    
    
    public static int getDate(){
        calendar.set(Calendar.MONTH, Calendar.MONTH);
        calendar.set(Calendar.DAY_OF_MONTH, 31);
        calendar.add(Calendar.MONTH, 1);        
        
        return calendar.get(Calendar.YEAR);
    }   
    
    public static void main(String args[]) {
    
        System.out.println(getDateHour());
    }
}
