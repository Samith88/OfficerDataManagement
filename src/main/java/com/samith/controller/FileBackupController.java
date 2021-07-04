package com.samith.controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import officerdatamanager.DateDetails;
import com.samith.logging.getLogger;
/**
 *
 * @author UDISSSA1
 */
public class FileBackupController {
    
    public void getBackup(String sourceFileName,String backuptempName ){
        
        
        Path sourceFile = Paths.get(sourceFileName);
        Path backuptemp = Paths.get(backuptempName);
        
        Path backupFile = Paths.get(backuptemp+"_"+DateDetails.getDateYear()+DateDetails.getDateMonth()+
                DateDetails.getDateDate()+DateDetails.getDateHour()+DateDetails.getDateMinute());
        
        try {
            Files.copy(sourceFile, backupFile,StandardCopyOption.REPLACE_EXISTING);
            getLogger.getLog().debug("DB File copied to backup location");
            } catch (IOException e1) {
                getLogger.getLog().debug(e1.toString());              
            }        
    }
    
}
