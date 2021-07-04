<%-- 
    Document   : ViewDataTable
    Created on : Jul 4, 2021, 10:39:45 AM
    Author     : UDISSSA1
--%>

<%@page import="java.util.List"%>
<%@page import="com.samith.base.Officer"%>
<%@page import="com.samith.controller.OfficerDataProcessor"%>
<%@page  contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
OfficerDataProcessor officerDataProcessor=new OfficerDataProcessor();
List<Officer>  officers = officerDataProcessor.getOfficerAllByIndexNumberWildCard(request.getParameter("IndexNumber").trim());
%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>නිලධාරී දත්ත</title>
    </head>
    <body>
        <h1>නිලධාරී දත්ත</h1>
       <table align="center" cellpadding="5" cellspacing="5" border="1">

       <tr>
       
       </tr>
       <tr bgcolor="#A52A2A">
       <td><b>OfficerEntryId</b></td>
       <td><b>IndexNumber</b></td>
       <td><b>EmpName</b></td>
       <td><b>FullName</b></td>
       <td><b>ContactNo</b></td>
       <td><b>BirthDay</b></td>
       <td><b>NIC</b></td>
       <td><b>Gender</b></td>
       <td><b>Address</b></td>
       <td><b>OfficeType</b></td>
       <td><b>Designation</b></td>
       <td><b>Grade</b></td>
       <td><b>OfficeLocation</b></td>
       <td><b>OfficeLocationJoinDate</b></td>
       <td><b>AreaFileNo</b></td>
       <td><b>ServiceArea</b></td>
       <td><b>FirstAppointmentDate</b></td>
       <td><b>SecondAppointmentDate</b></td>
       <td><b>SamurdhiAuthAppointmentDate</b></td>
       <td><b>SalaryNo</b></td>
       <td><b>SalaryIncreamentDate</b></td>
       <td><b>ServiceType</b></td>
       <td><b>ETF</b></td>
       <td><b>PensionAge</b></td>
       <td><b>PensionDate</b></td>
       <td><b>OfficeLocation</b></td>
       </tr>
       <%
       try {
       for (int i = 0; i < officers.size(); i++) {
       Officer officer= officers.get(i);
       %>
       <tr bgcolor="#DEB887">
       <td><b><%=officer.getOfficerEntryId()%></b></td>
       <td><b><%=officer.getIndexNumber()%></b></td>
       <td><b><%=officer.getEmpName()%></b></td>
       <td><b><%=officer.getFullName()%></b></td>
       <td><b><%=officer.getContactNo()%></b></td>
       <td><b><%=officer.getBirthDay()%></b></td>
       <td><b><%=officer.getNIC()%></b></td>
       <td><b><%=officer.getGender()%></b></td>
       <td><b><%=officer.getAddress()%></b></td>
       <td><b><%=officer.getOfficeType()%></b></td>
       <td><b><%=officer.getDesignation()%></b></td>
       <td><b><%=officer.getGrade()%></b></td>
       <td><b><%=officer.getOfficeLocation()%></b></td>
       <td><b><%=officer.getOfficeLocationJoinDate()%></b></td>
       <td><b><%=officer.getAreaFileNo()%></b></td>
       <td><b><%=officer.getServiceArea()%></b></td>
       <td><b><%=officer.getFirstAppointmentDate()%></b></td>
       <td><b><%=officer.getSecondAppointmentDate()%></b></td>
       <td><b><%=officer.getSamurdhiAuthAppointmentDate()%></b></td>
       <td><b><%=officer.getSalaryNo()%></b></td>
       <td><b><%=officer.getSalaryIncreamentDate()%></b></td>
       <td><b><%=officer.getServiceType()%></b></td>
       <td><b><%=officer.getETF()%></b></td>
       <td><b><%=officer.getPensionAge()%></b></td>
       <td><b><%=officer.getPensionDate()%></b></td>
       <td><b><%=officer.getOfficeLocation()%></b></td>
       
       </tr>
       
       <% 
           }
       } catch (Exception e) {
       e.printStackTrace();
       }
       %>
       </table> 
       
    </body>
</html>
