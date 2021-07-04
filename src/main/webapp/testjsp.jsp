<%-- 
    Document   : testjsp
    Created on : Jul 4, 2021, 6:18:00 PM
    Author     : UDISSSA1
--%>

<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
request.setCharacterEncoding("UTF-8");
String test="";
try{
    if(!request.getParameter("NIC").equals(null))
        test=request.getParameter("NIC");
} catch (Exception e) {
        e.printStackTrace();
        test="no value nic";
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><%=test%></h1>
    </body>
</html>
