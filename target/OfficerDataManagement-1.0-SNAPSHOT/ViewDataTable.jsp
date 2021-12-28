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
} catch (Exception e) {e.toString();}
String option2textIn="";
try{	
    if(!request.getParameter("option2text").equals(""))
        option2textIn = request.getParameter("option2text").trim();
} catch (Exception e) {e.toString();}
String option1selectIn="";
try{
    if(!request.getParameter("option1text").equals(""))
        option1selectIn =request.getParameter("option1select");
} catch (Exception e) {e.toString();}

String option2selectIn="";
try{
    if(!request.getParameter("option2text").equals(""))
        option2selectIn =request.getParameter("option2select");
} catch (Exception e) {e.toString();}

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
        wantedValues.put("IndexNumber","අනු අංකය");
} catch (Exception e) {
            wantedValues.put("IndexNumber","");
            e.toString();
}
try{
    if(!request.getParameter("EmpName").equals(null))
        wantedValues.put("EmpName","මුලකුරු සමග නම");
} catch (Exception e) {
        wantedValues.put("EmpName","");
        e.toString();
}
try{
    if(!request.getParameter("FullName").equals(null))
        wantedValues.put("FullName","සම්පුර්න නම");
} catch (Exception e) {
        wantedValues.put("FullName",""); 
        e.toString();
}
try{    
    if(!request.getParameter("ContactNo").equals(null))
        wantedValues.put("ContactNo","දුරකථන අංකය");
} catch (Exception e) {
       wantedValues.put("ContactNo","");
        e.toString();
}
try{        
    if(!request.getParameter("BirthDay").equals(null))
        wantedValues.put("BirthDay","උපන් දිනය ");
} catch (Exception e) {
       wantedValues.put("BirthDay","");
        e.toString();
}
try{
    if(!request.getParameter("NIC").equals(null))
        wantedValues.put("NIC","හැදුනුම්පත් අංකය");
} catch (Exception e) {
        wantedValues.put("NIC","");
        e.toString();
}
try{       
    if(!request.getParameter("Gender").equals(null))
        wantedValues.put("Gender","ස්ත්‍රි පුරුෂ භාවය");
} catch (Exception e) {
        wantedValues.put("Gender","");
        e.toString();
}

try{ 
    if(!request.getParameter("Address").equals(null))
        wantedValues.put("Address","ලිපිනය");
} catch (Exception e) {
      wantedValues.put("Address","");
        e.toString();
}
try{  
    if(!request.getParameter("OfficeType").equals(null))
        wantedValues.put("OfficeType","නිලධාරි වර්ගය");
} catch (Exception e) {
      wantedValues.put("OfficeType",""); 
        e.toString();
}
try{ 
    if(!request.getParameter("Designation").equals(null))
        wantedValues.put("Designation","තනතුර");
} catch (Exception e) {
      wantedValues.put("Designation","");
        e.toString();
}
try{      
    if(!request.getParameter("Grade").equals(null))
        wantedValues.put("Grade","ශ්‍රේණිය");
} catch (Exception e) {
        e.printStackTrace();
       wantedValues.put("Grade","");
        e.toString();
}
try{   
    if(!request.getParameter("OfficeLocation").equals(null))
        wantedValues.put("OfficeLocation","සේවා ස්තානය");
} catch (Exception e) {
       wantedValues.put("OfficeLocation","");
        e.toString();
}
try{     
    if(!request.getParameter("OfficeLocationJoinDate").equals(null))
        wantedValues.put("OfficeLocationJoinDate","සේවා ස්තානයට පත්වුනු දවස");
} catch (Exception e) {
       wantedValues.put("OfficeLocationJoinDate","");
        e.toString();
}
try{  
    if(!request.getParameter("AreaFileNo").equals(null))
        wantedValues.put("AreaFileNo","කාලාපයට අයත් ග්‍රාම නිලධාරි වසම");
} catch (Exception e) {
        wantedValues.put("AreaFileNo","");
        e.toString();
}
try{
    if(!request.getParameter("ServiceArea").equals(null))
        wantedValues.put("ServiceArea","කලාපය / සේවා ස්ථානය");
} catch (Exception e) {
         wantedValues.put("ServiceArea","");
        e.toString();
}
try{
    if(!request.getParameter("FirstAppointmentDate").equals(null))
        wantedValues.put("FirstAppointmentDate","මුල් පත්වීම් දිනය");
} catch (Exception e) {
         wantedValues.put("FirstAppointmentDate","");
        e.toString();
}
try{
    if(!request.getParameter("SecondAppointmentDate").equals(null))
        wantedValues.put("SecondAppointmentDate","නියාමක පත්වීම");
} catch (Exception e) {
        wantedValues.put("SecondAppointmentDate","");
        e.toString();
}
try{  
    if(!request.getParameter("SamurdhiAuthAppointmentDate").equals(null))
        wantedValues.put("SamurdhiAuthAppointmentDate","සමෘද්ධි සංවර්ධන නිලධාරි (සමෘ.අධිකාරි) පත්වීම් දිනය");
} catch (Exception e) {
        wantedValues.put("SamurdhiAuthAppointmentDate","");
        e.toString();
}
try{ 	
    if(!request.getParameter("SalaryNo").equals(null))
        wantedValues.put("SalaryNo","වැටුප් අංකය");
} catch (Exception e) {
        wantedValues.put("SalaryNo","");
        e.toString();
}
try{ 	
    if(!request.getParameter("SalaryIncreamentDate").equals(null))
        wantedValues.put("SalaryIncreamentDate","වැටුප් වර්ධක දිනය");
} catch (Exception e) {
        wantedValues.put("SalaryIncreamentDate","");
        e.toString();
}
try{ 	
    if(!request.getParameter("ServiceType").equals(null))
        wantedValues.put("ServiceType","මුල් සේවා/ නව සේවා");
} catch (Exception e) {
        wantedValues.put("ServiceType","");
        e.toString();
}
try{ 	
    if(!request.getParameter("ETF").equals(null))
        wantedValues.put("ETF","පාරිතෝෂික ලබා ඇත/නැත");
} catch (Exception e) {
        wantedValues.put("ETF","");
        e.toString();
}
try{ 	
    if(!request.getParameter("PensionAge").equals(null))
        wantedValues.put("PensionAge","විශ්‍රාම ලබන වයස");
} catch (Exception e) {
        wantedValues.put("PensionAge","");
        e.toString();
}
try{	
    if(!request.getParameter("PensionDate").equals(null))
        wantedValues.put("PensionDate","විශ්‍රාම ලබන වයස දිනය");
} catch (Exception e) {
         wantedValues.put("PensionDate","");
        e.toString();
}
//added 11/07
try{	
    if(!request.getParameter("AppointmentLetterRecived").equals(null))
        wantedValues.put("AppointmentLetterRecived","අන්තර්ග්‍රහණ පත්වීම් ලිපිය ලැබීම");
} catch (Exception e) {
         wantedValues.put("AppointmentLetterRecived","");
        e.toString();
}
try{	
    if(!request.getParameter("FirstVoteChanged").equals(null))
        wantedValues.put("FirstVoteChanged","පලමුව මනාපය පලකීරීමෙන් පසු නැවත මනාපය වෙනස් කිරීම");
} catch (Exception e) {
         wantedValues.put("FirstVoteChanged","");
        e.toString();
}
try{	
    if(!request.getParameter("VoteChangedAppointmentRecived").equals(null))
        wantedValues.put("VoteChangedAppointmentRecived","නැවත මනාපය වෙනස් කල පසු නව පත්වීම් ලිපිය ලැබීම");
} catch (Exception e) {
         wantedValues.put("VoteChangedAppointmentRecived","");
        e.toString();
}
try{	
    if(!request.getParameter("ETFRecivedDate").equals(null))
        wantedValues.put("ETFRecivedDate","පාරිතෝෂික මුදල ලබාගෙන ඇත්නම් දිනය");
} catch (Exception e) {
         wantedValues.put("ETFRecivedDate","");
        e.toString();
}

try{	
    if(!request.getParameter("ETFAmount").equals(null))
        wantedValues.put("ETFAmount","පාරිතෝෂික මුදල");
} catch (Exception e) {
         wantedValues.put("ETFAmount","");
        e.toString();
}

try{	
    if(!request.getParameter("AreaFile").equals(null))
        wantedValues.put("AreaFile","කලාපය අනුව ගොණු අංකය");
} catch (Exception e) {
         wantedValues.put("AreaFile","");
        e.toString();
}

try{	
    if(!request.getParameter("Email").equals(null))
        wantedValues.put("Email","විද්යුත් ලිපිනය");
} catch (Exception e) {
         wantedValues.put("Email","");
        e.toString();
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
       <script src="js/script.js" type="text/javascript"></script>
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
                 if(!entry.getValue().toString().equals("")){
         %>
            <td><b><%=entry.getValue() %></b></td>
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
        <% }  if(!wantedValues.get("AppointmentLetterRecived").equals("")){ %>
            <td><b><%=officer.getAppointmentLetterRecived()%></b></td>
        <% }  if(!wantedValues.get("FirstVoteChanged").equals("")){ %>
            <td><b><%=officer.getFirstVoteChanged()%></b></td>
        <% }  if(!wantedValues.get("VoteChangedAppointmentRecived").equals("")){ %>
            <td><b><%=officer.getVoteChangedAppointmentRecived()%></b></td>
        <% }  if(!wantedValues.get("ETFRecivedDate").equals("")){ %>
            <td><b><%=officer.getETFRecivedDate()%></b></td>  
        <% }  if(!wantedValues.get("ETFAmount").equals("")){ %>
            <td><b><%=officer.getETFAmount()%></b></td>  
        <% }  if(!wantedValues.get("AreaFile").equals("")){ %>
            <td><b><%=officer.getAreaFile()%></b></td> 
        <% }  if(!wantedValues.get("Email").equals("")){ %>
            <td><b><%=officer.getEmail()%></b></td>
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
          <br/>  <br/>
      <fieldset>
          <br/>
          <div>
            <button onclick="exportTableToCSV('officers.csv')">නිලධාරි තොරතුරු බාගත කිරීම</button>
          </div>
           <br/>
          <div>
             <a href="main.jsp">නැවත මුල් පිටුවට</a>
          </div>
          <br/>
          <div>
             <a href="ViewData.jsp">නැවත නිලධාරි තොරතුරු දැක්මට</a>
          </div>
      </fieldset>
      </div>
       
    </body>
</html>
