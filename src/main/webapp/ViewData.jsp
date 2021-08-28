<%-- 
    Document   : ViewData
    Created on : Jul 3, 2021, 10:28:59 PM
    Author     : UDISSSA1
--%>

<%@page import="com.samith.logging.getLogger"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
Map<String, String> OptionsList  = com.samith.configs.VariableStorage.getOptionsList();
//request.setAttribute("operation", "insert");
session.setAttribute("operation",  "insert");
%>
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
      padding: 10px 8px;
      margin: 8px 0;
      display: inline-block;
      border: 1px solid #ccc;
      box-sizing: border-box;
      }
      
      select {
      width: calc(100%);
      padding: 10px 0;
      }
      select {
      background: transparent;
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
        <title>නිලධාරී දත්ත බලන්න</title>
    </head>
    <body>
     <form action="ViewDataTable.jsp">
      <h1>නිලධාරී දත්ත බලන්න</h1>
      
      <fieldset>
        <legend>
          <h3>අවශ්‍ය නිලධාරින් පමනක් ලබාගැනිම</h3>
        </legend>
      <div class="formcontainer">
        <div class="container">
        <div></div>
              <div>
              <label><strong>පළමු විමසුම </strong></label>
              <select name="option1select" id="option1select">
              <%
                for (Map.Entry<String, String> entry : OptionsList.entrySet()) {
               %>
                    <option value=<%=entry.getKey()%>> <%=entry.getValue()%> </option>
              <%
                }
              %>      
             </select>
            </div>
             
             <div>
                 <input type="text" name="option1text">
             </div>
          </div>
           <div  class="container">
              <div>
              <label><strong>දෙවන විමසුම </strong></label>
              <select name="option2select" id="option2select">
              <%
                for (Map.Entry<String, String> entry : OptionsList.entrySet()) {
               %>
                    <option value=<%=entry.getKey()%>> <%=entry.getValue()%> </option>
              <%
                }
              %>     
             </select>
            </div>
              <div>
                 <input type="text" name="option2text">
             </div>
        </div>
        </div>
        </fieldset> 
          
      <fieldset>
        <legend>
          <h3>අවශ්‍ය විස්තර පමනක් තේරිම</h3>
        </legend>
        <div  class="terms-mailing">
          <div class="checkbox">
           <label> <input type="checkbox" name="IndexNumber" value="IndexNumber" checked><span>නිලධාරි අනු අංකය</span></label>
          </div>
           <br>
          <div class="checkbox">
           <label> <input type="checkbox" name="EmpName" value="EmpName" checked ><span>මුලකුරු සමග නම</span></label>
          </div>
           <br>
          <div class="checkbox">
           <label> <input type="checkbox" name="FullName" value="FullName" ><span>සම්පුර්න නම</span></label>
          </div>
           <br>
          <div class="checkbox">
           <label> <input type="checkbox" name="ContactNo" value="ContactNo"  checked ><span>දුරකථන අංකය</span></label>
          </div>
           <br>
          <div class="checkbox">
            <label><input type="checkbox" name="NIC" value="NIC" checked ><span>හැදුනුම්පත් අංකය</span></label>
          </div>
            <br>
          <div class="checkbox">
           <label> <input type="checkbox" name="Address" value="Address" ><span>ලිපිනය</span></label>
          </div>
            <br>
          <div class="checkbox">
            <label><input type="checkbox" name="Gender"  value="Gender" ><span>ස්ත්‍රි පුරුෂ භාවය</span></label>
          </div>
            <br>
          <div class="checkbox">
           <label> <input type="checkbox" name="BirthDay"   value="BirthDay" ><span>උපන් දිනය</span></label>
          </div>
            <br>
          <div class="checkbox">
            <label><input type="checkbox" name="Designation"    value="Designation" checked ><span>විෂය</span></label>
          </div>
            <br>
          <div class="checkbox">
            <label><input type="checkbox" name="OfficeType"    value="OfficeType"  checked ><span>තනතුර</span></label>
          </div>
            <br>
          <div class="checkbox">
           <label> <input type="checkbox" name="Grade"  value="Grade"   ><span>ශ්‍රේණිය</span></label>
          </div>
            <br>
          <div class="checkbox">
           <label> <input type="checkbox" name="OfficeLocation"   value="OfficeLocation"    checked><span>සේවා ස්තානය</span></label>
          </div>
            <br>
          <div class="checkbox">
            <label><input type="checkbox" name="OfficeLocationJoinDate"   value="OfficeLocationJoinDate"   ><span>සේවා ස්තානයට පත්වුනු දවස</span></label>
          </div>
            <br>
          <div class="checkbox">
            <label><input type="checkbox" name="ServiceArea" value="ServiceArea" ><span>කලාපය / සේවා ස්ථානය</span></label>
          </div>
            <br>
          <div class="checkbox">
            <label> <input type="checkbox" name="AreaFileNo"  value="AreaFileNo" checked > <span>ග්‍රාමනිලධාරි කොට්ථාශය</span></label>
          </div>
            <br>
          <div class="checkbox">
            <label><input type="checkbox" name="FirstAppointmentDate" value="FirstAppointmentDate"><span>මුල් පත්වීම් දිනය</span></label>
          </div>
            <br>
          <div class="checkbox">
            <label><input type="checkbox" name="SecondAppointmentDate" value="SecondAppointmentDate"><span>නියාමක පත්වීම</span></label>
          </div>
            <br>
          <div class="checkbox">
            <label><input type="checkbox" name="SamurdhiAuthAppointmentDate" value="SamurdhiAuthAppointmentDate"><span>සමෘද්ධි සංවර්ධන නිලධාරි (සමෘ.අධිකාරි) පත්වීම් දිනය</span></label>
          </div>
            <br>
          <div class="checkbox">
            <label><input type="checkbox" name="SalaryNo" value="SalaryNo"><span>වැටුප් අංකය</span></label>
          </div>
            <br>
          <div class="checkbox">
            <label><input type="checkbox" name="ServiceType" value="ServiceType"><span>සේවා</span></label>
          </div>
            <br>
          <div class="checkbox">
            <label><input type="checkbox" name="SalaryIncreamentDate" value="SalaryIncreamentDate"><span>වැටුප් වර්ධක දිනය</span></label>
          </div>
            <br>
          <div class="checkbox">
            <label><input type="checkbox" name="ETF" value="ETF"><span>පාරිතෝෂික ලෑබිම</span></label>
          </div>
            <br>
          <div class="checkbox">
            <label><input type="checkbox" name="PensionAge" value="PensionAge"><span>විශ්‍රාම ලබන වයස</span></label>
          </div>
            <br>
          <div class="checkbox">
            <label><input type="checkbox" name="PensionDate" value="PensionDate" checked><span>විශ්‍රාම ලබන  දිනය</span></label>
          </div>
            <br>
          <div class="checkbox">
            <label><input type="checkbox" name="AppointmentLetterRecived" value="AppointmentLetterRecived"><span>අන්තර්ග්‍රහණ පත්වීම් ලිපිය ලැබීම </span></label>
          </div>
            
           <br>
          <div class="checkbox">
            <label><input type="checkbox" name="FirstVoteChanged" value="FirstVoteChanged"><span>පලමුව මනාපය පලකීරීමෙන් පසු නැවත මනාපය වෙනස් කිරීම </span></label>
          </div>
           <br>
          <div class="checkbox">
            <label><input type="checkbox" name="VoteChangedAppointmentRecived" value="VoteChangedAppointmentRecived"><span>නැවත මනාපය වෙනස් කල පසු නව පත්වීම් ලිපිය ලැබීම </span></label>
          </div>
           <br>
          <div class="checkbox">
            <label><input type="checkbox" name="ETFRecivedDate" value="ETFRecivedDate"><span>පාරිතෝෂික මුදල ලබාගෙන ඇත්නම් දිනය </span></label>
          </div>
           <br>
          <div class="checkbox">
            <label><input type="checkbox" name="ETFAmount" value="ETFAmount"><span>පාරිතෝෂික මුදල </span></label>
          </div>
           <br>
          <div class="checkbox">
            <label><input type="checkbox" name="AreaFile" value="AreaFile"><span>කලාපය අනුව ගොණු අංකය </span></label>
          </div>
           
      </fieldset>     

      <button type="submit">නිලධාරී දත්ත බලමු</button>
      </form>
    <div class="container">
      <fieldset>
          <div>
             <a href="main.jsp">නැවත මුල් පිටුවට</a>
          </div>
      </fieldset>
      </div>
    </body>
</html>
