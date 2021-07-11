/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.samith.dao;

import com.samith.base.Officer;
import com.samith.database.DBConnection;
import com.samith.database.InsertUpdateDeleteClass;
import com.samith.database.RetrieveData;
import com.samith.logging.getLogger;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author UDISSSA1
 */
public class OfficerDB {
    
    
        public boolean putOfficerData(Officer officer){
    
        InsertUpdateDeleteClass insertUpdateDeleteClass =new InsertUpdateDeleteClass(); 
        
        return insertUpdateDeleteClass.insertUpdateDeleteDB("insert into Officer(IndexNumber,EmpName,FullName,ContactNo,BirthDay,NIC,Gender,Address,OfficeType,Designation,Grade,OfficeLocation,OfficeLocationJoinDate,"
                + "AreaFileNo,ServiceArea,FirstAppointmentDate,SecondAppointmentDate,SamurdhiAuthAppointmentDate,SalaryNo,SalaryIncreamentDate,ServiceType,ETF,PensionAge,PensionDate,"
                + "AppointmentLetterRecived,FirstVoteChanged,VoteChangedAppointmentRecived,ETFRecivedDate,ETFAmount) "
                + "values ("
               + " '"+officer.getIndexNumber()+"',"
               + " '"+officer.getEmpName()+"' ,"
               + " '"+officer.getFullName()+"',"
               + " '"+officer.getContactNo()+"',"
               + " '"+officer.getBirthDay()+"',"
               + " '"+officer.getNIC()+"',"
               + " '"+officer.getGender()+"',"
               + " '"+officer.getAddress()+"',"
               + " '"+officer.getOfficeType()+"',"
               + " '"+officer.getDesignation()+"' ,"
               + " '"+officer.getGrade()+"',"
               + " '"+officer.getOfficeLocation()+"',"
               + " '"+officer.getOfficeLocationJoinDate()+"',"
               + " '"+officer.getAreaFileNo()+"',"
               + " '"+officer.getServiceArea()+"',"
               + " '"+officer.getFirstAppointmentDate()+"',"
               + " '"+officer.getSecondAppointmentDate()+"',"
               + " '"+officer.getSamurdhiAuthAppointmentDate()+"', "
               + " '"+officer.getSalaryNo()+"',"
               + " '"+officer.getSalaryIncreamentDate()+"',"
               + " '"+officer.getServiceType()+"',"
               + " '"+officer.getETF()+"',"
               + " '"+officer.getPensionAge()+"',"
               + " '"+officer.getPensionDate()+"',"
               + " '"+officer.getAppointmentLetterRecived()+"',"
               + " '"+officer.getFirstVoteChanged()+"',"
               + " '"+officer.getVoteChangedAppointmentRecived()+"',"
               + " '"+officer.getETFRecivedDate()+"',"
               + " '"+officer.getETFAmount()+"'"
               + ")");
          }
        
        
        public boolean updateOfficerData(Officer officer){
    
        InsertUpdateDeleteClass insertUpdateDeleteClass =new InsertUpdateDeleteClass(); 
        
        return insertUpdateDeleteClass.insertUpdateDeleteDB("update Officer set  "
               + "IndexNumber= '"+officer.getIndexNumber()+"',"
               + "EmpName= '"+officer.getEmpName()+"' ,"
               + "FullName= '"+officer.getFullName()+"',"
               + "ContactNo= '"+officer.getContactNo()+"',"
               + "BirthDay= '"+officer.getBirthDay()+"',"
               + "NIC= '"+officer.getNIC()+"',"
               + "Gender= '"+officer.getGender()+"',"
               + "Address= '"+officer.getAddress()+"',"
               + "OfficeType= '"+officer.getOfficeType()+"',"
               + "Designation= '"+officer.getDesignation()+"' ,"
               + "Grade= '"+officer.getGrade()+"',"
               + "OfficeLocation= '"+officer.getOfficeLocation()+"',"
               + "OfficeLocationJoinDate='"+officer.getOfficeLocationJoinDate()+"',"
               + "AreaFileNo= '"+officer.getAreaFileNo()+"',"
               + "ServiceArea= '"+officer.getServiceArea()+"',"
               + "FirstAppointmentDate= '"+officer.getFirstAppointmentDate()+"',"
               + "SecondAppointmentDate= '"+officer.getSecondAppointmentDate()+"',"
               + "SamurdhiAuthAppointmentDate= '"+officer.getSamurdhiAuthAppointmentDate()+"', "
               + "SalaryNo= '"+officer.getSalaryNo()+"',"
               + "SalaryIncreamentDate= '"+officer.getSalaryIncreamentDate()+"',"
               + "ServiceType= '"+officer.getServiceType()+"',"
               + "ETF= '"+officer.getETF()+"',"
               + "PensionAge= '"+officer.getPensionAge()+"',"
               + "PensionDate= '"+officer.getPensionDate()+"' ,"
               + "AppointmentLetterRecived= '"+officer.getAppointmentLetterRecived()+"', "
               + "FirstVoteChanged= '"+officer.getFirstVoteChanged()+"', "
               + "VoteChangedAppointmentRecived= '"+officer.getVoteChangedAppointmentRecived()+"', "
               + "ETFRecivedDate= '"+officer.getETFRecivedDate()+"', "
               + "ETFAmount= '"+officer.getETFAmount()+"'"
               + " where OfficerEntryId='"+officer.getOfficerEntryId()+"';");
          }
        
        public void updatePensionDetails(List<Officer> officers){
    
        InsertUpdateDeleteClass insertUpdateDeleteClass =null;
        for(int i=0;i<officers.size();i++){
                    insertUpdateDeleteClass =new InsertUpdateDeleteClass(); 
                    insertUpdateDeleteClass.insertUpdateDeleteDB("update Officer set  "
                    + "PensionEmailSend= 'Y'"
                    + " where OfficerEntryId='"+officers.get(i).getOfficerEntryId()+"';");
            }
        }
        
       public Officer getOfficerByIndexNumber(String IndexNumber) throws Exception{
           
           RetrieveData retrieveClass =new RetrieveData();
           Officer officer = new Officer();
           
           try{
               ResultSet rs  = retrieveClass.getResultsFormDB("select EmpName  from Officer  where IndexNumber='"+IndexNumber+"'");
               while (rs.next()) {
                   officer.setEmpName(rs.getString("EmpName"));
               }
               DBConnection.disconnect();
           } catch (SQLException e) {
               getLogger.getLog().debug(e.toString());
                try{DBConnection.disconnect();}catch (SQLException ex) {}
           }     
           return officer;
       }
    
    
       public Officer getOfficerAllByIndexNumber(String IndexNumber) throws Exception{
           
           RetrieveData retrieveClass =new RetrieveData();
           Officer officer = new Officer();
           
           try{
               ResultSet rs  = retrieveClass.getResultsFormDB("select *  from Officer  where IndexNumber='"+IndexNumber+"'");
               while (rs.next()) {
                   officer.setOfficerEntryId(rs.getString("OfficerEntryId"));
                   officer.setIndexNumber(rs.getString("IndexNumber"));
                   officer.setEmpName(rs.getString("EmpName"));
                   officer.setFullName(rs.getString("FullName"));
                   officer.setContactNo(rs.getString("ContactNo"));
                   officer.setBirthDay(rs.getString("BirthDay"));
                   officer.setNIC(rs.getString("NIC"));
                   officer.setGender(rs.getString("Gender"));
                   officer.setAddress(rs.getString("Address"));
                   officer.setOfficeType(rs.getString("OfficeType"));
                   officer.setDesignation(rs.getString("Designation"));
                   officer.setGrade(rs.getString("Grade"));
                   officer.setOfficeLocation(rs.getString("OfficeLocation"));
                   officer.setOfficeLocationJoinDate(rs.getString("OfficeLocationJoinDate"));
                   officer.setAreaFileNo(rs.getString("AreaFileNo"));
                   officer.setServiceArea(rs.getString("ServiceArea"));
                   officer.setFirstAppointmentDate(rs.getString("FirstAppointmentDate"));
                   officer.setSecondAppointmentDate(rs.getString("SecondAppointmentDate"));
                   officer.setSamurdhiAuthAppointmentDate(rs.getString("SamurdhiAuthAppointmentDate"));
                   officer.setSalaryNo(rs.getString("SalaryNo"));
                   officer.setSalaryIncreamentDate(rs.getString("SalaryIncreamentDate"));
                   officer.setServiceType(rs.getString("ServiceType"));
                   officer.setETF(rs.getString("ETF"));
                   officer.setPensionAge(rs.getString("PensionAge"));
                   officer.setPensionDate(rs.getString("PensionDate"));
                   officer.setOfficeLocation(rs.getString("OfficeLocation"));
                   
                   officer.setAppointmentLetterRecived(rs.getString("AppointmentLetterRecived"));
                   officer.setFirstVoteChanged(rs.getString("FirstVoteChanged"));
                   officer.setVoteChangedAppointmentRecived(rs.getString("VoteChangedAppointmentRecived"));
                   officer.setETFRecivedDate(rs.getString("ETFRecivedDate"));
                   officer.setETFAmount(rs.getString("ETFAmount"));
               }
               DBConnection.disconnect();
           } catch (SQLException e) {
               getLogger.getLog().debug(e.toString());
                try{DBConnection.disconnect();}catch (SQLException ex) {}
           }     
           return officer;
       } 
       
       public  List<Officer>  getOfficerAllByPensionDate(String MonthsToAddPentionDate) throws Exception{
           
           RetrieveData retrieveClass =new RetrieveData();
           List<Officer> officers = new ArrayList<>();
           Officer officer = null;
           
           try{
               ResultSet rs  = retrieveClass.getResultsFormDB("select *  from Officer  where PensionDate='"+MonthsToAddPentionDate+"' and PensionEmailSend='N';");
               //ResultSet rs  = retrieveClass.getResultsFormDB("select *  from Officer ;");
               while (rs.next()) {
                   officer = new Officer();
                   officer.setOfficerEntryId(rs.getString("OfficerEntryId"));
                   officer.setIndexNumber(rs.getString("IndexNumber"));
                   officer.setEmpName(rs.getString("EmpName"));
                   officer.setFullName(rs.getString("FullName"));
                   officer.setContactNo(rs.getString("ContactNo"));
                   officer.setBirthDay(rs.getString("BirthDay"));
                   officer.setNIC(rs.getString("NIC"));
                   officer.setGender(rs.getString("Gender"));
                   officer.setAddress(rs.getString("Address"));
                   officer.setOfficeType(rs.getString("OfficeType"));
                   officer.setDesignation(rs.getString("Designation"));
                   officer.setGrade(rs.getString("Grade"));
                   officer.setOfficeLocation(rs.getString("OfficeLocation"));
                   officer.setOfficeLocationJoinDate(rs.getString("OfficeLocationJoinDate"));
                   officer.setAreaFileNo(rs.getString("AreaFileNo"));
                   officer.setServiceArea(rs.getString("ServiceArea"));
                   officer.setFirstAppointmentDate(rs.getString("FirstAppointmentDate"));
                   officer.setSecondAppointmentDate(rs.getString("SecondAppointmentDate"));
                   officer.setSamurdhiAuthAppointmentDate(rs.getString("SamurdhiAuthAppointmentDate"));
                   officer.setSalaryNo(rs.getString("SalaryNo"));
                   officer.setSalaryIncreamentDate(rs.getString("SalaryIncreamentDate"));
                   officer.setServiceType(rs.getString("ServiceType"));
                   officer.setETF(rs.getString("ETF"));
                   officer.setPensionAge(rs.getString("PensionAge"));
                   officer.setPensionDate(rs.getString("PensionDate"));
                   officer.setOfficeLocation(rs.getString("OfficeLocation"));
                   
                   officer.setAppointmentLetterRecived(rs.getString("AppointmentLetterRecived"));
                   officer.setFirstVoteChanged(rs.getString("FirstVoteChanged"));
                   officer.setVoteChangedAppointmentRecived(rs.getString("VoteChangedAppointmentRecived"));
                   officer.setETFRecivedDate(rs.getString("ETFRecivedDate"));
                   officer.setETFAmount(rs.getString("ETFAmount"));
                   
                   officers.add(officer);
               }
               DBConnection.disconnect();
           } catch (SQLException e) {
               getLogger.getLog().debug(e.toString());
                try{DBConnection.disconnect();}catch (SQLException ex) {}
           }     
           return officers;
       } 
       
    
       public  List<Officer>  getOfficerAllByIndexNumberWildCard(String whereString) throws Exception{
           
           RetrieveData retrieveClass =new RetrieveData();
           Officer officer = null;
           List<Officer> officers = new ArrayList<>();
           try{
               ResultSet rs  = retrieveClass.getResultsFormDB("select *  from Officer "+whereString+";");
               while (rs.next()) {
                   officer = new Officer();
                   officer.setOfficerEntryId(rs.getString("OfficerEntryId"));
                   officer.setIndexNumber(rs.getString("IndexNumber"));
                   officer.setEmpName(rs.getString("EmpName"));
                   officer.setFullName(rs.getString("FullName"));
                   officer.setContactNo(rs.getString("ContactNo"));
                   officer.setBirthDay(rs.getString("BirthDay"));
                   officer.setNIC(rs.getString("NIC"));
                   officer.setGender(rs.getString("Gender"));
                   officer.setAddress(rs.getString("Address"));
                   officer.setOfficeType(rs.getString("OfficeType"));
                   officer.setDesignation(rs.getString("Designation"));
                   officer.setGrade(rs.getString("Grade"));
                   officer.setOfficeLocation(rs.getString("OfficeLocation"));
                   officer.setOfficeLocationJoinDate(rs.getString("OfficeLocationJoinDate"));
                   officer.setAreaFileNo(rs.getString("AreaFileNo"));
                   officer.setServiceArea(rs.getString("ServiceArea"));
                   officer.setFirstAppointmentDate(rs.getString("FirstAppointmentDate"));
                   officer.setSecondAppointmentDate(rs.getString("SecondAppointmentDate"));
                   officer.setSamurdhiAuthAppointmentDate(rs.getString("SamurdhiAuthAppointmentDate"));
                   officer.setSalaryNo(rs.getString("SalaryNo"));
                   officer.setSalaryIncreamentDate(rs.getString("SalaryIncreamentDate"));
                   officer.setServiceType(rs.getString("ServiceType"));
                   officer.setETF(rs.getString("ETF"));
                   officer.setPensionAge(rs.getString("PensionAge"));
                   officer.setPensionDate(rs.getString("PensionDate"));
                   officer.setOfficeLocation(rs.getString("OfficeLocation"));
                   
                   officer.setAppointmentLetterRecived(rs.getString("AppointmentLetterRecived"));
                   officer.setFirstVoteChanged(rs.getString("FirstVoteChanged"));
                   officer.setVoteChangedAppointmentRecived(rs.getString("VoteChangedAppointmentRecived"));
                   officer.setETFRecivedDate(rs.getString("ETFRecivedDate"));
                   officer.setETFAmount(rs.getString("ETFAmount"));
                   officers.add(officer);
               }
               DBConnection.disconnect();
           } catch (SQLException e) {
               getLogger.getLog().debug(e.toString());
               try{DBConnection.disconnect();}catch (SQLException ex) {}
           }     
           return officers;
       } 
    
    
}

