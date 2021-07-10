<%-- 
    Document   : ViewDataTable
    Created on : Jul 4, 2021, 10:39:45 AM
    Author     : UDISSSA1
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="com.samith.base.Officer"%>
<%@page import="com.samith.controller.OfficerDataProcessor"%>
<%@page  contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
OfficerDataProcessor officerDataProcessor=new OfficerDataProcessor();
String option1textIn="";
try{
    if(!request.getParameter("option1text").equals(""))
        option1textIn = request.getParameter("option1text").trim();
        System.out.println("option1textIn is:"+option1textIn);
} catch (Exception e) {
          System.out.print(e);
}
String option2textIn="";
try{	
    if(!request.getParameter("option2text").equals(""))
        option2textIn = request.getParameter("option2text").trim();
        System.out.println("option2textIn is:"+option2textIn);
} catch (Exception e) {
         e.printStackTrace();
         System.out.print(e);
}
String option1selectIn="";
try{
    if(!request.getParameter("option1text").equals(""))
        option1selectIn =request.getParameter("option1select");
} catch (Exception e) {
         e.printStackTrace();
}

String option2selectIn="";
try{
    if(!request.getParameter("option2text").equals(""))
        option2selectIn =request.getParameter("option2select");
} catch (Exception e) {
         e.printStackTrace();
}

//List<Officer>  officers = officerDataProcessor.getOfficerAllByIndexNumberWildCard(request.getParameter("GetIndexNumber").trim());
List<Officer> officers = new ArrayList<>();
try{
officers = officerDataProcessor.getOfficerAllByIndexNumberWildCard (option1textIn, option2textIn, option1selectIn ,option2selectIn );
} catch (Exception e) {
         e.printStackTrace();
}

Map<String, String> wantedValues = new LinkedHashMap<String, String>();

try{
    if(!request.getParameter("IndexNumber").equals(null))
        wantedValues.put("IndexNumber","IndexNumber");
} catch (Exception e) {
         wantedValues.put("IndexNumber","");
}
try{
    if(!request.getParameter("EmpName").equals(null))
        wantedValues.put("EmpName","EmpName");
} catch (Exception e) {
        wantedValues.put("EmpName","");
}
try{
    if(!request.getParameter("FullName").equals(null))
        wantedValues.put("FullName","FullName");
} catch (Exception e) {
        wantedValues.put("FullName",""); 
}
try{    
    if(!request.getParameter("ContactNo").equals(null))
        wantedValues.put("ContactNo","ContactNo");
} catch (Exception e) {
       wantedValues.put("ContactNo","");
}
try{        
    if(!request.getParameter("BirthDay").equals(null))
        wantedValues.put("BirthDay","BirthDay");
} catch (Exception e) {
        e.printStackTrace();
       wantedValues.put("BirthDay","");
}
try{
    if(!request.getParameter("NIC").equals(null))
        wantedValues.put("NIC","NIC");
} catch (Exception e) {
        wantedValues.put("NIC","");
}
try{       
    if(!request.getParameter("Gender").equals(null))
        wantedValues.put("Gender","Gender");
} catch (Exception e) {
        wantedValues.put("Gender","");
}
try{  
    if(!request.getParameter("Gender").equals(null))
        wantedValues.put("Gender","Gender");
} catch (Exception e) {
       wantedValues.put("Gender","");
}
try{ 
    if(!request.getParameter("Address").equals(null))
        wantedValues.put("Address","Address");
} catch (Exception e) {
      wantedValues.put("Address","");
}
try{  
    if(!request.getParameter("OfficeType").equals(null))
        wantedValues.put("OfficeType","OfficeType");
} catch (Exception e) {
        e.printStackTrace();
      wantedValues.put("OfficeType",""); 
}
try{ 
    if(!request.getParameter("Designation").equals(null))
        wantedValues.put("Designation","Designation");
} catch (Exception e) {
      wantedValues.put("Designation","");
}
try{      
    if(!request.getParameter("Grade").equals(null))
        wantedValues.put("Grade","Grade");
} catch (Exception e) {
        e.printStackTrace();
       wantedValues.put("Grade","");
}
try{   
    if(!request.getParameter("OfficeLocation").equals(null))
        wantedValues.put("OfficeLocation","OfficeLocation");
} catch (Exception e) {
       wantedValues.put("OfficeLocation","");
}
try{     
    if(!request.getParameter("OfficeLocationJoinDate").equals(null))
        wantedValues.put("OfficeLocationJoinDate","OfficeLocationJoinDate");
} catch (Exception e) {
       wantedValues.put("OfficeLocationJoinDate","");
}
try{  
    if(!request.getParameter("AreaFileNo").equals(null))
        wantedValues.put("AreaFileNo","AreaFileNo");
} catch (Exception e) {
        wantedValues.put("AreaFileNo","");
}
try{
    if(!request.getParameter("ServiceArea").equals(null))
        wantedValues.put("ServiceArea","ServiceArea");
} catch (Exception e) {
         wantedValues.put("ServiceArea","");
}
try{
    if(!request.getParameter("FirstAppointmentDate").equals(null))
        wantedValues.put("FirstAppointmentDate","FirstAppointmentDate");
} catch (Exception e) {
         wantedValues.put("FirstAppointmentDate","");
}
try{
    if(!request.getParameter("SecondAppointmentDate").equals(null))
        wantedValues.put("SecondAppointmentDate","SecondAppointmentDate");
} catch (Exception e) {
        wantedValues.put("SecondAppointmentDate","");
}
try{  
    if(!request.getParameter("SamurdhiAuthAppointmentDate").equals(null))
        wantedValues.put("SamurdhiAuthAppointmentDate","SamurdhiAuthAppointmentDate");
} catch (Exception e) {
        wantedValues.put("SamurdhiAuthAppointmentDate","");
}
try{ 	
    if(!request.getParameter("SalaryNo").equals(null))
        wantedValues.put("SalaryNo","SalaryNo");
} catch (Exception e) {
        wantedValues.put("SalaryNo","");
}
try{ 	
    if(!request.getParameter("SalaryIncreamentDate").equals(null))
        wantedValues.put("SalaryIncreamentDate","SalaryIncreamentDate");
} catch (Exception e) {
        wantedValues.put("SalaryIncreamentDate","");
}
try{ 	
    if(!request.getParameter("ServiceType").equals(null))
        wantedValues.put("ServiceType","ServiceType");
} catch (Exception e) {
        wantedValues.put("ServiceType","");
}
try{ 	
    if(!request.getParameter("ETF").equals(null))
        wantedValues.put("ETF","ETF");
} catch (Exception e) {
        wantedValues.put("ETF","");
}
try{ 	
    if(!request.getParameter("PensionAge").equals(null))
        wantedValues.put("PensionAge","PensionAge");
} catch (Exception e) {
        wantedValues.put("PensionAge","");	
}
try{	
    if(!request.getParameter("PensionDate").equals(null))
        wantedValues.put("PensionDate","PensionDate");
} catch (Exception e) {
         wantedValues.put("PensionDate","");
}

%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>නිලධාරී දත්ත</title>
        <style>
             tr:nth-child(even) {background-color: #33FF93;}
       </style>
    </head>
    <body>
        <h1>නිලධාරී දත්ත</h1>
        <div>
            <fieldset>
       <table align="center" cellpadding="5" cellspacing="5" border="1">

       <tr>
       
       </tr>
        <tr> 
       
        <%
        try{
         for (Map.Entry<String, String> entry : wantedValues.entrySet()) {
                System.out.println(entry.getKey() + "/" + entry.getValue());
                 if(!entry.getValue().toString().equals("")){
         %>
            <td><b><%=entry.getKey() %></b></td>
         <% 
                }
            }
        } catch (Exception e) {
        e.printStackTrace();
        }
        %>
       </tr>
       
       
       
       <%
       try {
       if(officers.size()>0)
       {
       for (int i = 0; i < officers.size(); i++) {
       Officer officer= officers.get(i);
       %>
       <tr bgcolor="#DEB887">
       <% if(!wantedValues.get("IndexNumber").equals("")){  %>
            <td><b><%=officer.getIndexNumber()%></b></td>
       <% }  if(!wantedValues.get("EmpName").equals("")){  %>
            <td><b><%=officer.getEmpName()%></b></td>
       <% }  if(!wantedValues.get("FullName").equals("")){ %>
             <td><b><%=officer.getFullName()%></b></td>
        <% }  if(!wantedValues.get("ContactNo").equals("")){ %>
             <td><b><%=officer.getContactNo()%></b></td>
        <% }  if(!wantedValues.get("BirthDay").equals("")){ %>
             <td><b><%=officer.getBirthDay()%></b></td>
        <% }  if(!wantedValues.get("NIC").equals("")){ %>
             <td><b><%=officer.getNIC()%></b></td>
         <% }  if(!wantedValues.get("Gender").equals("")){ %>
            <td><b><%=officer.getGender()%></b></td>
         <% }  if(!wantedValues.get("Address").equals("")){ %>
            <td><b><%=officer.getAddress()%></b></td>
        <% }  if(!wantedValues.get("OfficeType").equals("")){ %>
             <td><b><%=officer.getOfficeType()%></b></td>
        <% }  if(!wantedValues.get("Designation").equals("")){ %>
            <td><b><%=officer.getDesignation()%></b></td>
        <% }  if(!wantedValues.get("Grade").equals("")){ %>
             <td><b><%=officer.getGrade()%></b></td>
        <% }  if(!wantedValues.get("OfficeLocation").equals("")){ %>
            <td><b><%=officer.getOfficeLocation()%></b></td>
        <% }  if(!wantedValues.get("OfficeLocationJoinDate").equals("")){ %>
            <td><b><%=officer.getOfficeLocationJoinDate()%></b></td>
        <% }  if(!wantedValues.get("AreaFileNo").equals("")){ %>
            <td><b><%=officer.getAreaFileNo()%></b></td>
        <% }  if(!wantedValues.get("ServiceArea").equals("")){ %>
            <td><b><%=officer.getServiceArea()%></b></td>
        <% }  if(!wantedValues.get("FirstAppointmentDate").equals("")){ %>
            <td><b><%=officer.getFirstAppointmentDate()%></b></td>
        <% }  if(!wantedValues.get("SecondAppointmentDate").equals("")){ %>
            <td><b><%=officer.getSecondAppointmentDate()%></b></td>
        <% }  if(!wantedValues.get("SamurdhiAuthAppointmentDate").equals("")){ %>
            <td><b><%=officer.getSamurdhiAuthAppointmentDate()%></b></td>
        <% }  if(!wantedValues.get("SalaryNo").equals("")){ %>
            <td><b><%=officer.getSalaryNo()%></b></td>
        <% }  if(!wantedValues.get("SalaryIncreamentDate").equals("")){ %>
            <td><b><%=officer.getSalaryIncreamentDate()%></b></td>
        <% }  if(!wantedValues.get("ServiceType").equals("")){ %>
             <td><b><%=officer.getServiceType()%></b></td>
        <% }  if(!wantedValues.get("ETF").equals("")){ %>
             <td><b><%=officer.getETF()%></b></td>
        <% }  if(!wantedValues.get("PensionAge").equals("")){ %>
            <td><b><%=officer.getPensionAge()%></b></td>
        <% }  if(!wantedValues.get("PensionDate").equals("")){ %>
            <td><b><%=officer.getPensionDate()%></b></td>
       <%  }  %>
       </tr>
       
       <% 
           }
          }
       } catch (Exception e) {
       e.printStackTrace();
       }
       %>
       </table>
       </fieldset>
     </div>
    <div>
      <fieldset>
          <div>
             <a href="main.jsp">නැවත මුල් පිටුවට</a>
          </div>
          <div>
             <a href="ViewData.jsp">නැවත නිලධාරි තොරතුරු දැක්මට</a>
          </div>
      </fieldset>
      </div>
       
    </body>
</html>
