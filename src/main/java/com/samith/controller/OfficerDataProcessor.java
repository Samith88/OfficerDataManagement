/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.samith.controller;

import com.samith.base.Officer;
import com.samith.dao.OfficerDB;
import java.util.List;

/**
 *
 * @author UDISSSA1
 */
public class OfficerDataProcessor {
    
    //putOfficerData(Officer officer)
    public boolean   putOfficerData(Officer officer){
        OfficerDB officerDB=new OfficerDB();
        return officerDB.putOfficerData(officer);
    
    }
    
    public boolean   updateOfficerData(Officer officer){
        OfficerDB officerDB=new OfficerDB();
        return officerDB.updateOfficerData(officer);
    
    }
    
    public Officer getOfficerByIndexNumber(String IndexNumber) throws Exception{
    
         OfficerDB officerDB=new OfficerDB();
         return officerDB.getOfficerByIndexNumber(IndexNumber);
    }
 
    public Officer getOfficerAllByIndexNumber(String IndexNumber) throws Exception{
    
         OfficerDB officerDB=new OfficerDB();
         return officerDB.getOfficerAllByIndexNumber(IndexNumber);
    }
    
    public   List<Officer>  getOfficerAllByIndexNumberWildCard(String IndexNumberWildCard) throws Exception{
         OfficerDB officerDB=new OfficerDB();
         return officerDB.getOfficerAllByIndexNumberWildCard(IndexNumberWildCard);
    }
    
}
