package com.samith.configs;


import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author UDISSSA1
 */
public class VariableStorage {

    public static List<String> getAgeList() {
        AgeList.clear();
        AgeList.add("45");  
        AgeList.add("50");  
        AgeList.add("55");  
        AgeList.add("60");  
        AgeList.add("65");
        return AgeList;
    }
    
    public static List<String> getGenderList() {
        GenderList.clear();
        GenderList.add("ස්ත්‍රි"); 
        GenderList.add("පුරුෂ"); 
        return GenderList;
    }
    
    public static List<String> getOfficerTypeList() {
        OfficerTypeList.clear();
        OfficerTypeList.add("නිලධාරි"); 
        OfficerTypeList.add("කලමණාකාර"); 
        return OfficerTypeList;
    }

    public static List<String> getServiceTypeList() {
        ServiceTypeList.clear();
        ServiceTypeList.add("මුල්_සේවා"); 
        ServiceTypeList.add("නව_සේවා"); 
        return ServiceTypeList;
    }
    
    public static List<String> getETFTypeList() {
        ETFTypeList.clear();
        ETFTypeList.add("ලබා_ඇත"); 
        ETFTypeList.add("ලබා_නැත"); 
        return ETFTypeList;
    }

    public static List<String> getOfficeLocationList() {
        OfficeLocationList.clear();
        OfficeLocationList.add("වසම");
        OfficeLocationList.add("බැංකුව");
        OfficeLocationList.add("බැංකු සමිතිය");
        OfficeLocationList.add("මුලස්තානය");
        return OfficeLocationList;
    }
    
    public static List<String> getServiceAreaList() {
        ServiceAreaList.clear();
        ServiceAreaList.add("මඩවල");
        ServiceAreaList.add("වැත්තැව");
        ServiceAreaList.add("උඩුව");
        ServiceAreaList.add("ගලගෙදර");
        ServiceAreaList.add("නියංගොඩ");
        
        return ServiceAreaList;
    }
    
    public static List<String> getAreaFileNoList() {
        AreaFileNoList.clear();
        AreaFileNoList.add("==============මඩවල");
        AreaFileNoList.add("දෙහිදෙනිය");
        AreaFileNoList.add("කිරින්දිවැල්පොල");
        AreaFileNoList.add("තහල්පිටිය");
        AreaFileNoList.add("උඩහෙනෙපොල");
        AreaFileNoList.add("පොහොලියද්ද");
        AreaFileNoList.add("නිකතන්න");
        AreaFileNoList.add("ඇටඹේගොඩ");
        AreaFileNoList.add("හද්දාපිටිය");
        AreaFileNoList.add("දමුනුගස්තැන්න");
        AreaFileNoList.add("දෙල්ගස්යාය");
        AreaFileNoList.add("කොපිවත්ත");
        AreaFileNoList.add("උඩපිටිය");
        AreaFileNoList.add("කන්දේකුඹුර");
        AreaFileNoList.add("==============වැත්තැව");
        AreaFileNoList.add("මිනිගමුව");
        AreaFileNoList.add("තැන්නෙවෙල");
        AreaFileNoList.add("මිනිගමුව ඉහල");
        AreaFileNoList.add("හියදල");
        AreaFileNoList.add("හියදල වල්පොල");
        AreaFileNoList.add("වැත්තැව");
        AreaFileNoList.add("පෞල්පාව");
        AreaFileNoList.add("හිත්ගොඩ වල්පොල");
        AreaFileNoList.add("කුරගම");
        AreaFileNoList.add("කුරගම උතුරු");
        AreaFileNoList.add("පරණගම");
        AreaFileNoList.add("ගුණදාහ");
        AreaFileNoList.add("==============උඩුව");
        AreaFileNoList.add("නාරන්වල");
        AreaFileNoList.add("උදලාගම");
        AreaFileNoList.add("උඩුව");
        AreaFileNoList.add("පොත්තිල");
        AreaFileNoList.add("මැදගොඩ පහල");
        AreaFileNoList.add("මැදගොඩ ඉහල");
        AreaFileNoList.add("කිනිගම නැගෙනහිර");
        AreaFileNoList.add("කිනිගම බටහිර");
        AreaFileNoList.add("කළුවන");
        AreaFileNoList.add("කන්නදේනිය");
        AreaFileNoList.add("පුබ්බිලිය");
        AreaFileNoList.add("බරන්දර");
        AreaFileNoList.add("ඔපල්ල");
        AreaFileNoList.add("==============ගලගෙදර");
        AreaFileNoList.add("ගලගෙදර නැගෙනහිර");
        AreaFileNoList.add("ගලගෙදර බටහිර");
        AreaFileNoList.add("රොක්හිල්");
        AreaFileNoList.add("අක්කරවත්ත");
        AreaFileNoList.add("බොනකොට්");
        AreaFileNoList.add("පෙතිගෙවෙල");
        AreaFileNoList.add("ගංගෝඩපිටිය");
        AreaFileNoList.add("මඩිගෙ දකුණ");
        AreaFileNoList.add("මඩිගෙ බටහිර");
        AreaFileNoList.add("කොබ්බෙගල");
        AreaFileNoList.add("අම්බගහහේන");
        AreaFileNoList.add("ගලබාව");
        AreaFileNoList.add("මීගහහේන උතුර");
        AreaFileNoList.add("මීගහහේන දකුණ");
        AreaFileNoList.add("==============නියංගොඩ");
        AreaFileNoList.add("නියංගොඩ");
        AreaFileNoList.add("දියපලගොඩ");
        AreaFileNoList.add("අදුන්ගම පල්කුඹුර");
        AreaFileNoList.add("ඈතමුල්ල");
        AreaFileNoList.add("බන් අංග");
        AreaFileNoList.add("ගැලෙනවත්ත");
        AreaFileNoList.add("කුඹුරේගම");
        AreaFileNoList.add("අලවත්තේගම");
        AreaFileNoList.add("කදන්හෙන නැගෙනහිර");
        AreaFileNoList.add("නාමල්තැන්න");
        AreaFileNoList.add("මාරවනගොඩ");
        AreaFileNoList.add("නියබෙපොල");
        AreaFileNoList.add("ඉඩමෙගම");
        AreaFileNoList.add("හේනේගම පල්කුඹුර");
        AreaFileNoList.add("පල්ලෙකොටුව");
        
        return AreaFileNoList;
    }
    
    public static Map<String, String> getOptionsList() {
        OptionsList.clear();
        OptionsList.put("IndexNumber","අනු අංකය");
        OptionsList.put("EmpName","මුලකුරු සමග නම ");
        OptionsList.put("FullName","සම්පුර්න නම");
        OptionsList.put("ContactNo","දුරකථන අංකය");
        OptionsList.put("BirthDay","උපන් දිනය");
        OptionsList.put("NIC","හැදුනුම්පත් අංකය");
        OptionsList.put("Gender","ස්ත්‍රි පුරුෂ භාවය");
        OptionsList.put("Address","ලිපිනය");
        OptionsList.put("OfficeType","නිලධාරි වර්ගය");
        OptionsList.put("Designation","තනතුර");
        OptionsList.put("Grade","ශ්‍රේණිය");
        OptionsList.put("OfficeLocation","සේවා ස්තානය");
        OptionsList.put("OfficeLocationJoinDate","සේවා ස්තානයට පත්වුනු දවස");
        OptionsList.put("AreaFileNo","ග්‍රාමනිලධාරි කොට්ථාශය");
        OptionsList.put("ServiceArea","කලාපය / සේවා ස්ථානය");
        OptionsList.put("FirstAppointmentDate","මුල් පත්වීම් දිනය");
        OptionsList.put("SecondAppointmentDate","නියාමක පත්වීම");
        OptionsList.put("SamurdhiAuthAppointmentDate","සමෘද්ධි සංවර්ධන නිලධාරි (සමෘ.අධිකාරි) පත්වීම් දිනය");
        OptionsList.put("SalaryNo","වැටුප් අංකය");
        OptionsList.put("SalaryIncreamentDate","වැටුප් වර්ධක දිනය");
        OptionsList.put("ServiceType","සේවා");
        OptionsList.put("ETF","පාරිතෝෂික ලෑබිම");
        OptionsList.put("PensionAge","විශ්‍රාම ලබන වයස ");
        OptionsList.put("PensionDate","විශ්‍රාම ලබන  දිනය ");
        return OptionsList;
    }

    public static String getUsername() {
        return username;
    }

    public static String getPassword() {
        return password;
    }

    private static final List<String> AgeList =new ArrayList<String>();
    private static final List<String> GenderList =new ArrayList<String>();
    private static final List<String> OfficerTypeList =new ArrayList<String>();
    private static final List<String> ServiceTypeList =new ArrayList<String>();
    private static final List<String> ETFTypeList =new ArrayList<String>();
    private static final List<String> OfficeLocationList =new ArrayList<String>();
    private static final List<String> ServiceAreaList =new ArrayList<String>();
    private static final List<String> AreaFileNoList=new ArrayList<String>();
    private static final Map<String, String> OptionsList = new LinkedHashMap<String, String>();
    private static final String username="inosam";
    private static final String password="inosam";

}
