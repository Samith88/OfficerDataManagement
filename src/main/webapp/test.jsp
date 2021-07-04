<%-- 
    Document   : UpdateOfficerData
    Created on : Jun 29, 2021, 8:23:47 PM
    Author     : UDISSSA1
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.SortedMap"%>
<%@page import="com.samith.base.Officer"%>
<%@page import="com.samith.controller.OfficerDataProcessor"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<%
OfficerDataProcessor officerDataProcessor=new OfficerDataProcessor();
request.setCharacterEncoding("UTF-8");
Officer officer = officerDataProcessor.getOfficerAllByIndexNumber(request.getParameter("IndexNumber"));
request.setAttribute("PensionAgeValue", officer.getPensionAge()); 

 List<String> dept=new ArrayList<String>(); 
dept.add("45");  
dept.add("50");  
dept.add("55");  
dept.add("60");  
dept.add("65");
 request.setAttribute("dept ", dept);
 String selected="";
%>


<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html" contentType="text/html;charset=UTF-8" >
    <title>නිලධාරි තොරතුරු නැවත සැකසිම</title>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <style>
      html, body {
      min-height: 100%;
      }
      body, div, form, input, select, p { 
      padding: 0;
      margin: 0;
      outline: none;
      font-family: Roboto, Arial, sans-serif;
      font-size: 14px;
      color: #666;
      }
      h1 {
      margin: 0;
      font-weight: 400;
      }
      h3 {
      margin: 12px 0;
      color: #8ebf42;
      }
      .main-block {
      display: flex;
      justify-content: center;
      align-items: center;
      background: #fff;
      }
      form {
      width: 100%;
      padding: 20px;
      }
      fieldset {
      border: none;
      border-top: 1px solid #8ebf42;
      }
      .account-details, .personal-details {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      }
      .account-details >div, .personal-details >div >div {
      display: flex;
      align-items: center;
      margin-bottom: 10px;
      }
      .account-details >div, .personal-details >div, input, label {
      width: 100%;
      }
      label {
      padding: 0 5px;
      text-align: right;
      vertical-align: middle;
      }
      input {
      padding: 5px;
      vertical-align: middle;
      }
      .checkbox {
      margin-bottom: 10px;
      }
      select, .children, .gender, .bdate-block {
      width: calc(100% + 26px);
      padding: 5px 0;
      }
      select {
      background: transparent;
      }
      .gender input {
      width: auto;
      } 
      .gender label {
      padding: 0 5px 0 0;
      } 
      .bdate-block {
      display: flex;
      justify-content: space-between;
      }
      .birthdate select.day {
      width: 35px;
      }
      .birthdate select.mounth {
      width: calc(100% - 94px);
      }
      .birthdate input {
      width: 38px;
      vertical-align: unset;
      }
      .checkbox input, .children input {
      width: auto;
      margin: -2px 10px 0 0;
      }
      .checkbox a {
      color: #8ebf42;
      }
      .checkbox a:hover {
      color: #82b534;
      }
      button {
      width: 100%;
      padding: 10px 0;
      margin: 10px auto;
      border-radius: 5px; 
      border: none;
      background: #8ebf42; 
      font-size: 14px;
      font-weight: 600;
      color: #fff;
      }
      button:hover {
      background: #82b534;
      }
      @media (min-width: 568px) {
      .account-details >div, .personal-details >div {
      width: 50%;
      }
      label {
      width: 40%;
      }
      input {
      width: 60%;
      }
      select, .children, .gender, .bdate-block {
      width: calc(60% + 16px);
      }
      }
    </style>
  </head>
  <body>
    <div class="main-block">
    <form method="post" action="GetOfficerData.jsp" accept-charset="UTF-8">
      <h1>නිලධාරි තොරතුරු ඇතුලත් කිරිම</h1>
     <fieldset>
        <legend>
          <h3>විශ්‍රාම  තොරතුරු</h3>
        </legend>
        <div  class="account-details">
          <div><label>විශ්‍රාම ලබන වයස </label>
              <select name="PensionAge">
                    <%
                        for (int i = 0; i < dept.size(); i++) {
                    %>
                    <option value=<%=dept.get(i)%>   <% if(dept.get(i).equals(officer.getPensionAge())){selected=" selected";} %>  <%=selected%><%selected="";%>><%=dept.get(i)%></option>
                    <%
                        }
                    %>
            </select>
           </div>
            <div><label>විශ්‍රාම </label><input type="text" name="PensionAge2" value="<%=officer.getPensionAge()%>"></div>
            <div><label>විශ්‍රාම2 </label><input type="text" name="PensionAge3" value="${PensionAgeValue}"></div>
        </div>
      </fieldset>
      <fieldset>
        <legend>
          <h3>තොරතුරු තහවුරු කිරිම</h3>
        </legend>
        <div  class="terms-mailing">
          <div class="checkbox">
            <input type="checkbox" name="checkbox" required ><span>තොරතුරු තහවුරු කරන ලදි</span>
          </div>
      </fieldset>
      <button type="submit">තොරතුරු නැවත ඇතුලත් කිරිම</button>
    </form>
    </div> 
  </body>
</html>
