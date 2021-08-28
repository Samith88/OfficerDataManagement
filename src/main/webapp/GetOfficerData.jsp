<%-- 
    Document   : GetOfficerData
    Created on : Jun 27, 2021, 5:09:14 PM
    Author     : UDISSSA1
--%>

<%@page import="com.samith.logging.getLogger"%>
<%@page import="com.samith.configs.MethodStorage"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%@page import="java.sql.*,java.util.*"%>
<%@page import="com.samith.controller.OfficerDataProcessor"%>
<%@page import="com.samith.base.Officer"%>

<%

        Cookie cookie=null;
        Cookie[] cookies=null;
        cookies=request.getCookies();
        String scheme=request.getScheme();

                if (cookies == null) {
                response.sendRedirect("index.jsp");
                getLogger.getLog().debug("No Cookies!");
                }
%>
<%

Officer officer=new Officer();

request.setCharacterEncoding("UTF-8");
String operation="";
try{
operation=request.getParameter("submit").toString();
}catch (Exception e) {e.toString();}

try{
 if(operation.equals("update"))
 {
    officer.setOfficerEntryId(request.getParameter("OfficerEntryId").trim());
 }
}catch (Exception e) {e.toString();}try{    
officer.setIndexNumber(request.getParameter("IndexNumber").trim());
}catch (Exception e) {e.toString();}try{
officer.setEmpName(request.getParameter("EmpName").trim());
}catch (Exception e) {e.toString();}try{
officer.setContactNo(request.getParameter("ContactNo").trim());
}catch (Exception e) {e.toString();}try{
officer.setBirthDay(request.getParameter("BirthDay").trim());
}catch (Exception e) {e.toString();}try{
officer.setNIC(request.getParameter("NIC").trim());
}catch (Exception e) {e.toString();}try{
officer.setGender(request.getParameter("Gender").trim());
}catch (Exception e) {e.toString();}try{
officer.setOfficeType(request.getParameter("OfficeType").trim());
}catch (Exception e) {e.toString();}try{
officer.setDesignation(request.getParameter("Designation").trim());
}catch (Exception e) {e.toString();}try{
officer.setGrade(request.getParameter("Grade").trim());
}catch (Exception e) {e.toString();}try{
officer.setAreaFileNo(request.getParameter("AreaFileNo").trim());
}catch (Exception e) {e.toString();}try{
officer.setServiceArea(request.getParameter("ServiceArea").trim());
}catch (Exception e) {e.toString();}try{
officer.setFirstAppointmentDate(request.getParameter("FirstAppointmentDate").trim());
}catch (Exception e) {e.toString();}try{
officer.setSecondAppointmentDate(request.getParameter("SecondAppointmentDate").trim());
}catch (Exception e) {e.toString();}try{
officer.setSamurdhiAuthAppointmentDate(request.getParameter("SamurdhiAuthAppointmentDate").trim());
}catch (Exception e) {e.toString();}try{
officer.setSalaryNo(request.getParameter("SalaryNo").trim());
}catch (Exception e) {e.toString();}try{
officer.setSalaryIncreamentDate(request.getParameter("SalaryIncreamentDate").trim());
}catch (Exception e) {e.toString();}try{
officer.setServiceType(request.getParameter("ServiceType").trim());
}catch (Exception e) {e.toString();}try{
officer.setETF(request.getParameter("ETF").trim());
}catch (Exception e) {e.toString();}try{
officer.setPensionAge(request.getParameter("PensionAge").trim());
}catch (Exception e) {e.toString();}try{
 if(operation.equals("insert"))
    officer.setPensionDate(MethodStorage.getAddYearsDate(officer.getBirthDay(),officer.getPensionAge()));
}catch (Exception e) {e.toString();}try{
 if(operation.equals("update"))
    officer.setPensionDate(request.getParameter("PensionDate").trim());
}catch (Exception e) {e.toString();}try{

officer.setFullName(request.getParameter("FullName").trim());
}catch (Exception e) {e.toString();}try{
officer.setAddress(request.getParameter("Address").trim());
}catch (Exception e) {e.toString();}try{
officer.setOfficeLocation(request.getParameter("OfficeLocation").trim());
}catch (Exception e) {e.toString();}try{
officer.setOfficeLocationJoinDate(request.getParameter("OfficeLocationJoinDate").trim());
}catch (Exception e) {e.toString();}try{
//added 11/07
officer.setAppointmentLetterRecived(request.getParameter("AppointmentLetterRecived").trim());
}catch (Exception e) {e.toString();}try{
officer.setFirstVoteChanged(request.getParameter("FirstVoteChanged").trim());
}catch (Exception e) {e.toString();}try{
officer.setVoteChangedAppointmentRecived(request.getParameter("VoteChangedAppointmentRecived").trim());
}catch (Exception e) {e.toString();}try{
officer.setETFRecivedDate(request.getParameter("ETFRecivedDate").trim());
}catch (Exception e) {e.toString();}try{
officer.setETFAmount(request.getParameter("ETFAmount").trim());
}catch (Exception e) {e.toString();}try{
//added 11/14
officer.setAreaFile(request.getParameter("AreaFile").trim());
}catch (Exception e) {e.toString();}

 OfficerDataProcessor officerDataProcessor=new OfficerDataProcessor();
 String dbOpsOut="කිසිදු මෙහෙයුමක් සර්ථක නොවිනි";
try{
 if(request.getParameter("submit").equals("insert"))
 {
     if(officerDataProcessor.putOfficerData(officer)){
        dbOpsOut="දත්ත ඇතුළත් කිරීම සාර්ථක විය";
    }
    else{
         dbOpsOut="දත්ත ඇතුළත් කිරීම අසාර්ථක විය";
    }
}
}catch (Exception e) {e.toString();}try{
 if(request.getParameter("submit").equals("update"))
{
     if(officerDataProcessor.updateOfficerData(officer)){
        dbOpsOut="දත්ත යාවත්කාලීන කිරීම සාර්ථක විය";
    }
    else{
         dbOpsOut="දත්ත යාවත්කාලීන කිරීම අසාර්ථක විය";
    }
}
}catch (Exception e) {e.toString();}
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" contentType="text/html;charset=UTF-8" >
        <title>නිලධාරි තොරතුරු කලමණාකරනය</title>
    </head>
    <body>
        <h1>නිලධාරි තොරතුරු කලමණාකරනය</h1>
        <%=dbOpsOut%><br> <br>
        <a href="EnterOfficerData.jsp">නැවත නිලධාරි තොරතුරු ඇතුලත් කිරිම</a> <br>
        <a href="main.jsp">මුල් පිටුවට</a> <br>
    </body>
</html>
