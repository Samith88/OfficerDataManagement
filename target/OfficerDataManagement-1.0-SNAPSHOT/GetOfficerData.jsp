<%-- 
    Document   : GetOfficerData
    Created on : Jun 27, 2021, 5:09:14 PM
    Author     : UDISSSA1
--%>

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
                System.out.print("No Cookies!");
                }
%>
<%

Officer officer=new Officer();

request.setCharacterEncoding("UTF-8");
 if(session.getAttribute("operation").equals("update"))
    officer.setOfficerEntryId(session.getAttribute("OfficerEntryId").toString());
officer.setIndexNumber(request.getParameter("IndexNumber").trim());
officer.setEmpName(request.getParameter("EmpName").trim());
officer.setContactNo(request.getParameter("ContactNo").trim());
officer.setBirthDay(request.getParameter("BirthDay").trim());
officer.setNIC(request.getParameter("NIC").trim());
officer.setGender(request.getParameter("Gender").trim());
officer.setOfficeType(request.getParameter("OfficeType").trim());
officer.setDesignation(request.getParameter("Designation").trim());
officer.setGrade(request.getParameter("Grade").trim());
officer.setAreaFileNo(request.getParameter("AreaFileNo").trim());
officer.setServiceArea(request.getParameter("ServiceArea").trim());
officer.setFirstAppointmentDate(request.getParameter("FirstAppointmentDate").trim());
officer.setSecondAppointmentDate(request.getParameter("SecondAppointmentDate").trim());
officer.setSamurdhiAuthAppointmentDate(request.getParameter("SamurdhiAuthAppointmentDate").trim());
officer.setSalaryNo(request.getParameter("SalaryNo").trim());
officer.setSalaryIncreamentDate(request.getParameter("SalaryIncreamentDate").trim());
officer.setServiceType(request.getParameter("ServiceType").trim());
officer.setETF(request.getParameter("ETF").trim());
officer.setPensionAge(request.getParameter("PensionAge").trim());
officer.setPensionDate(request.getParameter("PensionDate").trim());
officer.setFullName(request.getParameter("FullName").trim());
officer.setAddress(request.getParameter("Address").trim());
officer.setOfficeLocation(request.getParameter("OfficeLocation").trim());
officer.setOfficeLocationJoinDate(request.getParameter("OfficeLocationJoinDate").trim());

 OfficerDataProcessor officerDataProcessor=new OfficerDataProcessor();
 String dbOut="";

 if(session.getAttribute("operation").equals("insert"))
 {
     if(officerDataProcessor.putOfficerData(officer)){
        dbOut="දත්ත ඇතුළත් කිරීම සාර්ථක විය";
    }
    else{
         dbOut="දත්ත ඇතුළත් කිරීම අසාර්ථක විය";
    }
}
 if(session.getAttribute("operation").equals("update"))
{
     if(officerDataProcessor.updateOfficerData(officer)){
        dbOut="දත්ත යාවත්කාලීන කිරීම සාර්ථක විය";
    }
    else{
         dbOut="දත්ත යාවත්කාලීන කිරීම අසාර්ථක විය";
    }
}

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" contentType="text/html;charset=UTF-8" >
        <title>නිලධාරි තොරතුරු කලමණාකරනය</title>
    </head>
    <body>
        <h1>නිලධාරි තොරතුරු කලමණාකරනය</h1>
        <%=dbOut%><br> <br>
        <a href="EnterOfficerData.jsp">නැවත නිලධාරි තොරතුරු ඇතුලත් කිරිම</a> <br>
        <a href="main.jsp">මුල් පිටුවට</a> <br>
    </body>
</html>
