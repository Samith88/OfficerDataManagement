<%-- 
    Document   : main.jsp
    Created on : Jun 27, 2021, 5:41:29 PM
    Author     : UDISSSA1
--%>

<%@page import="com.samith.logging.getLogger"%>
<%@page  contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="com.samith.configs.VariableStorage"%>

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
<!DOCTYPE html>
<html>
  <head>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
    <title>නිලධාරි තොරතුරු කලමණාකරනය</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <form action="EnterOfficerData.jsp">
      <div>
      <div class="container">
       <h1>නිලධාරි තොරතුරු කලමණාකරනය</h1>
        <label for="EnterOfficerData"><strong>නිලධාරි තොරතුරු ඇතුලත් කිරිම </strong></label>
      </div>
      <button id="EnterOfficerData" type="submit"><strong>නිලධාරි තොරතුරු ඇතුලත් කිරිම</strong></button>
     </form>
      
    <form action="ViewData.jsp">
      <div>
      <div class="container">
        <label for="ViewOfficer"><strong>නිලධාරි තොරතුරු දැක්ම </strong></label>
      </div>
      <button id="ViewOfficer" type="submit"><strong>නිලධාරි තොරතුරු දැක්ම</strong></button>
     </form>
      
    <form action="UpdateOfficerData.jsp">
      <div class="formcontainer">
      <hr/>
      <div class="container">
        <label for="IndexNumber"><strong>නිලධාරි අනු අංකය </strong></label>
        <input type="text" placeholder="අනු අංකය" name="IndexNumber" required>
      </div>
      <button type="submit">නැවත සැකසිම</button>
      </form>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  </body>
</html>

    