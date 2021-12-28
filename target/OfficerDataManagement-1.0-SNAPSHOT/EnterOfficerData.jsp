<%-- 
    Document   : EnterOfficerData
    Created on : Jun 27, 2021, 11:56:14 AM
    Author     : UDISSSA1
--%>

<%@page import="com.samith.logging.getLogger"%>
<%@page import="com.samith.configs.VariableStorage"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
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
request.setCharacterEncoding("UTF-8");
List<String> AgeList = com.samith.configs.VariableStorage.getAgeList();
List<String> GenderList = com.samith.configs.VariableStorage.getGenderList();
List<String> OfficerTypeList = com.samith.configs.VariableStorage.getOfficerTypeList();
List<String> ServiceTypeList  = com.samith.configs.VariableStorage.getServiceTypeList();
List<String> ETFTypeList=com.samith.configs.VariableStorage.getETFTypeList();
List<String> OfficeLocationList = com.samith.configs.VariableStorage.getOfficeLocationList();
List<String> ServiceAreaList  = com.samith.configs.VariableStorage.getServiceAreaList();
List<String> AreaFileNoList  = com.samith.configs.VariableStorage.getAreaFileNoList();
List<String> DesignationList = com.samith.configs.VariableStorage.getDesignationList();
List<String> GradeList = com.samith.configs.VariableStorage.getGradeList();
List<String> YesNoList = com.samith.configs.VariableStorage.getYesNoList();
//request.setAttribute("operation", "insert");
//session.setAttribute("operation",  "insert");
%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html" contentType="text/html;charset=UTF-8" >
    <title>නිලධාරි තොරතුරු ඇතුලත් කිරිම</title>
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
          <h3>පුද්ගලික තොරතුරු</h3>
        </legend>
        <div  class="personal-details">
          <div>
              <div><label>අනු අංකය*</label><input type="text" name="IndexNumber"  required></div>
            <div><label>මුලකුරු සමග නම*</label><input type="text" name="EmpName" required></div>
            <div><label>සම්පුර්න නම*</label><input type="text" name="FullName" ></div>
            <div><label>හැදුනුම්පත් අංකය*</label><input type="text" name="NIC" required></div>
          </div>
          <div>
            <div>
              <label>ස්ත්‍රි පුරුෂ භාවය</label>
              <select name="Gender" id="Gender">
                    <%
                         String selected="";
                        for (int i = 0; i < GenderList.size(); i++) {
                    %>
                    <option value=<%=GenderList.get(i)%>><%=GenderList.get(i)%></option>
                    <%
                        }
                    %>      
             </select>
            </div>
             <div><label>දුරකථන අංකය</label><input type="text" name="ContactNo"></div>
             <div><label>උපන් දිනය</label><input type="date" name="BirthDay" required></div>
             <div><label>ලිපිනය</label><input type="text" name="Address" ></div>
             <div><label>විද්යුත් ලිපිනය</label><input type="text" name="Email"></div>
          </div>
        </div>
      </fieldset>
      <fieldset>
        <legend>
          <h3>නිලතල තොරතුරු</h3>
        </legend>
        <div  class="account-details">

          <div>
              <label>විෂය</label>
                <select name="Designation">
                    <%
                        for (int i = 0; i < DesignationList.size(); i++) {
                    %>
                    <option value=<%=DesignationList.get(i)%>><%=DesignationList.get(i)%></option>
                    <%
                        }
                    %>
             </select>
           </div>
          
          <div>
              <label>තනතුර</label>
                <select name="OfficeType">
                    <%
                        for (int i = 0; i < OfficerTypeList.size(); i++) {
                    %>
                    <option value=<%=OfficerTypeList.get(i)%>><%=OfficerTypeList.get(i)%></option>
                    <%
                        }
                    %>
             </select>
           </div>
          
          <div>
              <label>  ශ්‍රේණිය  </label>
                <select name="Grade">
                    <%
                        for (int i = 0; i < GradeList.size(); i++) {
                    %>
                    <option value=<%=GradeList.get(i)%>><%=GradeList.get(i)%></option>
                    <%
                        }
                    %>
             </select>
           </div>
          
          
        </div>
      </fieldset>
      <fieldset>
        <legend>
          <h3>කලාප තොරතුරු</h3>
        </legend>
        <div  class="account-details">
           <div><label>සේවා ස්තානය</label>
           <select name="OfficeLocation" id="OfficeLocation">
                    <%
                        for (int i = 0; i < OfficeLocationList.size(); i++) {
                    %>
                    <option value=<%=OfficeLocationList.get(i)%>><%=OfficeLocationList.get(i)%></option>
                    <%
                        }
                    %>
           </select>
           </div>
           <div><label>සේවා ස්තානයට පත්වුනු දවස</label><input type="date" name="OfficeLocationJoinDate"></div>
           <div><label>කලාපය / සේවා ස්ථානය</label>
           <select name="ServiceArea" id="ServiceArea">
                    <%
                        for (int i = 0; i < ServiceAreaList.size(); i++) {
                    %>
                    <option value=<%=ServiceAreaList.get(i)%>><%=ServiceAreaList.get(i)%></option>
                    <%
                        }
                    %>
           </select>
           </div>
           <div><label>ග්‍රාමනිලධාරි කොට්ථාශය</label>
           <select name="AreaFileNo" id="AreaFileNo">
                    <%
                        for (int i = 0; i < AreaFileNoList.size(); i++) {
                    %>
                    <option value=<%=AreaFileNoList.get(i)%> ><%=AreaFileNoList.get(i)%></option>
                    <%
                        }
                    %>
           </select>
           </div>
           <div><label>කලාපය අනුව ගොණු අංකය</label><input type="text" name="AreaFile"></div>
        </div>
      </fieldset>
      <fieldset>
        <legend>
          <h3>පත්වීම් තොරතුරු</h3>
        </legend>
        <div  class="account-details">
            <div><label>මුල් පත්වීම් දිනය </label><input type="date" name="FirstAppointmentDate"></div>
            <div><label>නියාමක පත්වීම </label><input type="date" name="SecondAppointmentDate"></div>
            <div><label>සමෘද්ධි සංවර්ධන නිලධාරි (සමෘ.අධිකාරි) පත්වීම් දිනය </label><input type="date" name="SamurdhiAuthAppointmentDate"></div>
            
           <div>
              <label>අන්තර්ග්‍රහණ පත්වීම් ලිපිය ලැබීම</label>
                <select name="AppointmentLetterRecived">
                    <%
                        for (int i = 0; i < YesNoList.size(); i++) {
                    %>
                    <option value=<%=YesNoList.get(i)%>><%=YesNoList.get(i)%></option>
                    <%
                        }
                    %>
             </select>
            </div>            
            
           <div>
              <label>පලමුව මනාපය පලකීරීමෙන් පසු නැවත මනාපය වෙනස් කිරීම </label>
                <select name="FirstVoteChanged">
                    <%
                        for (int i = 0; i < YesNoList.size(); i++) {
                    %>
                    <option value=<%=YesNoList.get(i)%>><%=YesNoList.get(i)%></option>
                    <%
                        }
                    %>
             </select>
            </div>        
            
           <div>
              <label>නැවත මනාපය වෙනස් කල පසු නව පත්වීම් ලිපිය ලැබීම </label>
                <select name="VoteChangedAppointmentRecived">
                    <%
                        for (int i = 0; i < YesNoList.size(); i++) {
                    %>
                    <option value=<%=YesNoList.get(i)%>><%=YesNoList.get(i)%></option>
                    <%
                        }
                    %>
             </select>
            </div>   
             
        </div>
      </fieldset>
      <fieldset>
        <legend>
          <h3>වැටුප් විස්තර</h3>
        </legend>
        <div  class="account-details">
          <div><label>වැටුප් අංකය</label><input type="text" name="SalaryNo"></div>
           <div>
              <label>සේවා</label>
                <select name="ServiceType">
                    <%
                        for (int i = 0; i < ServiceTypeList.size(); i++) {
                    %>
                    <option value=<%=ServiceTypeList.get(i)%>><%=ServiceTypeList.get(i)%></option>
                    <%
                        }
                    %>
             </select>
            </div>
             <div><label>වැටුප් වර්ධක දිනය </label><input type="date" name="SalaryIncreamentDate"></div>
           <div>
              <label>පාරිතෝෂික ලෑබිම</label>
                <select name="ETF">
                    <%
                        for (int i = 0; i < ETFTypeList.size(); i++) {
                    %>
                    <option value=<%=ETFTypeList.get(i)%>><%=ETFTypeList.get(i)%></option>
                    <%
                        }
                    %>
             </select>
            </div>
             <div><label>පාරිතෝෂික මුදල ලබාගෙන ඇත්නම් දිනය</label><input type="date" name="ETFRecivedDate"></div>
              <div><label>පාරිතෝෂික මුදල</label><input type="number" name="ETFAmount"></div>
        </div>
      </fieldset>
      
  <fieldset>
        <legend>
          <h3>විශ්‍රාම  තොරතුරු</h3>
        </legend>
        <div  class="account-details">
          <div><label>විශ්‍රාම ලබන වයස </label>
            <select name="PensionAge">
                    <%
                        for (int i = 0; i < AgeList.size(); i++) {
                    %>
                    <option value=<%=AgeList.get(i)%>   <% if(AgeList.get(i).equals(VariableStorage.getDefaultPentionAge() )){%> selected<%}%>    ><%=AgeList.get(i)%></option>
                    <%
                        }
                    %>
            </select>
           </div>
        </div>
      </fieldset>
      
      <fieldset>
        <legend>
          <h3>තොරතුරු තහවුරු කිරිම</h3>
        </legend>
        <div  class="terms-mailing">
          <div class="checkbox">
            <input type="checkbox" name="checkbox" required><span>තොරතුරු තහවුරු කරන ලදි</span>
          </div>
      </fieldset>
      <button type="submit" name="submit" value="insert">තොරතුරු ඇතුලත් කිරිම</button>
    </form>
    </div> 
    <div>
      <fieldset>
        <div   class="account-details">
          <div>
             <a href="main.jsp">නැවත මුල් පිටුවට</a>
          </div>
      </fieldset>
      </div>
  </body>
</html>