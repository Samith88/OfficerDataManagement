<%-- 
    Document   : index
    Created on : Jun 27, 2021, 11:50:40 AM
    Author     : UDISSSA1
--%>

<%@page import="com.samith.configs.VariableStorage"%>
<%@page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Officer Data Management System</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <style>
      html, body {
      display: flex;
      justify-content: center;
      font-family: Roboto, Arial, sans-serif;
      font-size: 15px;
      }
      form {
      border: 5px solid #f1f1f1;
      }
      input[type=text], input[type=password] {
      width: 100%;
      padding: 16px 8px;
      margin: 8px 0;
      display: inline-block;
      border: 1px solid #ccc;
      box-sizing: border-box;
      }
      button {
      background-color: #8ebf42;
      color: white;
      padding: 14px 0;
      margin: 10px 0;
      border: none;
      cursor: grabbing;
      width: 100%;
      }
      h1 {
      text-align:center;
      fone-size:18;
      }
      button:hover {
      opacity: 0.8;
      }
      .formcontainer {
      text-align: left;
      margin: 24px 50px 12px;
      }
      .container {
      padding: 16px 0;
      text-align:left;
      }
      .container2 {
      padding: 16px 0;
      text-align:left;
      }
      span.psw {
      float: right;
      padding-top: 0;
      padding-right: 15px;
      }
      /* Change styles for span on extra small screens */
      @media screen and (max-width: 300px) {
      span.psw {
      display: block;
      float: none;
      }
    </style>
  </head>
  <body>
    <form action="">
      <h1>නිලධාරි තොරතුරු කලමණාකරනය</h1>
      <hr/>
      <div class="container">
        <label for="uname"><strong>පරිශීලක නාමය</strong></label>
        <input type="text" placeholder="පරිශීලක නාමය" name="uname" required>
        <label for="password"><strong>මුරපදය</strong></label>
        <input type="password" placeholder="මුරපදය" name="password" required>
      </div>
      <button type="submit"  name="submit" id="submit"  value="login">ඇතුල් වන්න</button>
      <div class="container2" style="background-color: #eee">
        <label style="padding-left: 15px">
        <input type="checkbox"  checked="checked" name="remember">  මතකයේ තබාගන්න
        </label>
      </div>
    </form>
  </body>
</html>
<script src="script.js" type="text/javascript"></script>


<%
    Cookie cookie=null;
    Cookie[] cookies=null;
    cookies=request.getCookies();
    String scheme=request.getScheme();



    if(request.getParameter("submit") != null) {


        String username = request.getParameter("uname");
        String password = request.getParameter("password");


        if( username.equals(VariableStorage.getUsername())  && password.equals(VariableStorage.getPassword()) ){
            System.out.println("Login success!!");

            if (request.getParameter("submit") != null) {
                    //no secure and httponly flags
                    Cookie cookie1 = new Cookie("datar", "VFJDE3598ROPDL0900KVMKMDJSA289DNVCMX"); // create cookie object
                    cookie1.setMaxAge(60);    //set max age for cookie in seconds
                    cookie1.setDomain("localhost"); //set domain for cookie
                    cookie1.setPath("/OfficerDataManagement");  // set path
                    response.addCookie(cookie1);  //create cookie
                    response.sendRedirect("main.jsp");
                    }
                }
                else {
                    System.out.println("failed!!");
                }

        }

%>




