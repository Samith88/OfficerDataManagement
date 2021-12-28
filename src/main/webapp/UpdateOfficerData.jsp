<%-- 
    Document   : UpdateOfficerData
    Created on : Jun 29, 2021, 8:23:47 PM
    Author     : UDISSSA1
--%>

<%@page import="com.samith.logging.getLogger"%>
<%@page import="java.util.List"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.SortedMap"%>
<%@page import="com.samith.base.Officer"%>
<%@page import="com.samith.controller.OfficerDataProcessor"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
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
OfficerDataProcessor officerDataProcessor=new OfficerDataProcessor();
request.setCharacterEncoding("UTF-8");
Officer officer = officerDataProcessor.getOfficerAllByIndexNumber(request.getParameter("IndexNumber"));
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
List<String> IsActive = com.samith.configs.VariableStorage.getIsActive(); 
List<String> EmailSendYN = com.samith.configs.VariableStorage.getEmailSendYN();
//request.setAttribute("operation", "update");
//session.setAttribute("operation",  "update");
//session.setAttribute("OfficerEntryId",  officer.getOfficerEntryId());
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
      <h1>නිලධාරි තොරතුරු නැවත සැකසිම</h1>
      <fieldset>
        <legend>
          <h3>පුද්ගලික තොරතුරු</h3>
        </legend>
        <div  class="personal-details">
          <div>
            <div><label>නිලධාරි අංකය(වෙනස් නොකරන්න)</label><input type="text" name="OfficerEntryId" value="<%=officer.getOfficerEntryId()%>" ></div>
            <div><label>අනු අංකය*</label><input type="text" name="IndexNumber" value="<%=officer.getIndexNumber()%>"  required></div>
            <div><label>මුලකුරු සමග නම*</label><input type="text" name="EmpName" value="<%=officer.getEmpName()%>"  required></div>
            <div><label>සම්පුර්න නම</label><input type="text" name="FullName" value="<%=officer.getFullName()%>"></div>
            <div><label>හැදුනුම්පත් අංකය*</label><input type="text" name="NIC" value="<%=officer.getNIC()%>"  required></div>
          </div>
          <div>
            <div>
              <label>ස්ත්‍රි පුරුෂ භාවය</label>
                <select name="Gender">
                    <%
                        String selected="";
                        for (int i = 0; i < GenderList.size(); i++) {
                    %>
                    <option value=<%=GenderList.get(i)%><% if(GenderList.get(i).equals(officer.getGender()) ){selected=" selected";} %> <%=selected%><%selected="";%>><%=GenderList.get(i)%></option>
                    <%
                        }
                    %>
             </select>
            </div>
             <div><label>උපන් දිනය</label><input type="date" name="BirthDay" value="<%=officer.getBirthDay()%>"  required></div>
            <div><label>දුරකථන අංකය</label><input type="text" name="ContactNo" value="<%=officer.getContactNo()%>"></div>
             <div><label>ලිපිනය</label><input type="text" name="Address" value="<%=officer.getAddress()%>" ></div>
             <div><label>විද්යුත් ලිපිනය</label><input type="text" name="Email" value="<%=officer.getEmail()%>"></div>
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
                    <option value=<%=DesignationList.get(i)%><% if(DesignationList.get(i).equals(officer.getDesignation())  ){selected=" selected";} %><%=selected%><%selected="";%>><%=DesignationList.get(i)%></option>
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
                    <option value=<%=OfficerTypeList.get(i)%><% if(OfficerTypeList.get(i).equals(officer.getOfficeType())){selected=" selected";} %><%=selected%><%selected="";%>><%=OfficerTypeList.get(i)%></option>
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
                    <option value=<%=GradeList.get(i)%><% if(GradeList.get(i).equals(officer.getGrade())){selected=" selected";} %><%=selected%><%selected="";%>><%=GradeList.get(i)%></option>
                    <%
                        }
                    %>
             </select>
           </div>
             
          <div>
              <label>  සක්‍රිය බව  </label>
                <select name="IsActive">
                    <%
                        for (int i = 0; i < IsActive.size(); i++) {
                    %>
                    <option value=<%=IsActive.get(i)%><% if(IsActive.get(i).equals(officer.getIsActive())){selected=" selected";} %><%=selected%><%selected="";%>><%=IsActive.get(i)%></option>
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
                    <option value=<%=OfficeLocationList.get(i)%><% if(OfficeLocationList.get(i).equals(officer.getOfficeLocation())){selected=" selected";} %> <%=selected%><%selected="";%>><%=OfficeLocationList.get(i)%></option>
                    <%
                        }
                    %>
           </select>
           </div>
           <div><label>සේවා ස්තානයට පත්වුනු දවස</label><input type="date" name="OfficeLocationJoinDate" value="<%=officer.getOfficeLocationJoinDate()%>"></div>
           <div><label>කලාපය / සේවා ස්ථානය</label>
           <select name="ServiceArea" id="ServiceArea">
                    <%
                        for (int i = 0; i < ServiceAreaList.size(); i++) {
                    %>
                    <option value=<%=ServiceAreaList.get(i)%><% if(ServiceAreaList.get(i).equals(officer.getServiceArea())  ){selected=" selected";} %> <%=selected%><%selected="";%>><%=ServiceAreaList.get(i)%></option>
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
                    <option value=<%=AreaFileNoList.get(i)%><% if(AreaFileNoList.get(i).equals(officer.getAreaFileNo())){selected=" selected";} %> <%=selected%><%selected="";%>><%=AreaFileNoList.get(i)%></option>
                    <%
                        }
                    %>
           </select>
           </div>
           <div><label>කලාපය අනුව ගොණු අංකය</label><input type="text" name="AreaFile"  value="<%=officer.getAreaFile()%>"></div>
        </div>
      </fieldset>
      <fieldset>
        <legend>
          <h3>පත්වීම් තොරතුරු</h3>
        </legend>
        <div  class="account-details">
            <div><label>මුල් පත්වීම් දිනය </label><input type="date" name="FirstAppointmentDate" value="<%=officer.getFirstAppointmentDate()%>"></div>
            <div><label>නියාමක පත්වීම </label><input type="date" name="SecondAppointmentDate" value="<%=officer.getSecondAppointmentDate()%>"></div>
            <div><label>සමෘද්ධි සංවර්ධන නිලධාරි (සමෘ.අධිකාරි) පත්වීම් දිනය </label><input type="date" name="SamurdhiAuthAppointmentDate"  value="<%=officer.getSamurdhiAuthAppointmentDate()%>"></div>
       
           <div>
              <label>අන්තර්ග්‍රහණ පත්වීම් ලිපිය ලැබීම</label>
                <select name="AppointmentLetterRecived">
                    <%
                        for (int i = 0; i < YesNoList.size(); i++) {
                    %>
                     <option value=<%=YesNoList.get(i)%><% if(YesNoList.get(i).equals(officer.getAppointmentLetterRecived())){selected=" selected";} %> <%=selected%><%selected="";%>><%=YesNoList.get(i)%></option>
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
                     <option value=<%=YesNoList.get(i)%><% if(YesNoList.get(i).equals(officer.getFirstVoteChanged())){selected=" selected";} %> <%=selected%><%selected="";%>><%=YesNoList.get(i)%></option>
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
                     <option value=<%=YesNoList.get(i)%><% if(YesNoList.get(i).equals(officer.getVoteChangedAppointmentRecived())){selected=" selected";} %> <%=selected%><%selected="";%>><%=YesNoList.get(i)%></option>
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
          <div><label>වැටුප් අංකය</label><input type="text" name="SalaryNo" value="<%=officer.getSalaryNo()%>"></div>
           <div>
              <label>සේවා</label>
                <select name="ServiceType">
                    <%
                        for (int i = 0; i < ServiceTypeList.size(); i++) {
                    %>
                    <option value=<%=ServiceTypeList.get(i)%><% if(ServiceTypeList.get(i).equals(officer.getServiceType())){selected=" selected";} %><%=selected%><%selected="";%>><%=ServiceTypeList.get(i)%></option>
                    <%
                        }
                    %>
             </select>
            </div>
             <div><label>වැටුප් වර්ධක දිනය </label><input type="date" name="SalaryIncreamentDate" value="<%=officer.getSalaryIncreamentDate()%>"></div>
           <div>
              <label>පාරිතෝෂික ලෑබිම</label>
                <select name="ETF">
                    <%
                        for (int i = 0; i < ETFTypeList.size(); i++) {
                    %>
                    <option value=<%=ETFTypeList.get(i)%><% if(ETFTypeList.get(i).equals(officer.getETF())){selected=" selected";} %> <%=selected%><%selected="";%>><%=ETFTypeList.get(i)%></option>
                    <%
                        }
                    %>
             </select>
            </div>
              <div><label>පාරිතෝෂික මුදල ලබාගෙන ඇත්නම් දිනය</label><input type="date" name="ETFRecivedDate" value="<%=officer.getETFRecivedDate()%>"></div>
              <div><label>පාරිතෝෂික මුදල</label><input type="number" name="ETFAmount" value="<%=officer.getETFAmount()%>"></div>
                 
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
                    <option value=<%=AgeList.get(i)%>   <% if(AgeList.get(i).equals(officer.getPensionAge())){selected=" selected";} %>  <%=selected%><%selected="";%>><%=AgeList.get(i)%></option>
                    <%
                        }
                    %>
            </select>
           </div>
          <div><label>විශ්‍රාම ලබන  දිනය </label><input type="date" name="PensionDate" value="<%=officer.getPensionDate()%>"></div>
        </div>
      </fieldset>
        
        
      <fieldset>
        <legend>
          <h3>අමතර තොරතුරු (වෙනස් කිරිමට පෙර දනුවත් වෙන්න)</h3>
        </legend>
        <div  class="account-details">
           <div>
              <label>විශ්‍රාම විද්යුත් ලිපිය යවන ලදි</label>
                <select name="PensionEmailSend">
                    <%
                        for (int i = 0; i < EmailSendYN.size(); i++) {
                    %>
                    <option value=<%=EmailSendYN.get(i)%><% if(EmailSendYN.get(i).equals(officer.getPensionEmailSend())){selected=" selected";} %><%=selected%><%selected="";%>><%=EmailSendYN.get(i)%></option>
                    <%
                        }
                    %>
             </select>
            </div>
              <div><label>අවසාන වැටුප්  වැඩිවීම් ලිපිය යැවු වර්ෂය</label><input type="number" name="SalaryIncreamentEmailSendYear" value="<%=officer.getSalaryIncreamentEmailSendYear()%>"></div>
              <div><label>අවසාන සාරාන්ශ  වැටුප්  වැඩිවීම් ලිපිය යැවු වර්ෂය</label><input type="number" name="SalaryIncreamentEmailSendYearAll" value="<%=officer.getSalaryIncreamentEmailSendYearAll()%>"></div>
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
        <button type="submit" name="submit" value="update">තොරතුරු නැවත ඇතුලත් කිරිම</button>
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