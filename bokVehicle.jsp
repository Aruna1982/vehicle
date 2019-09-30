<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,
																			 java.util.*,
																			 net.vehicle.*" errorPage="" %>
<% 
String vname = (String)session.getAttribute("vid");
ArrayList all = VehicleCommon.viewRentByID(vname);

//ArrayList al=VehicleCommon.getDrivers();
int size = all.size();
for(int i=0;i<size;i++){
ArrayList one=(ArrayList)all.get(i);
%>
<script type="text/JavaScript">
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_validDate(){  
    var today = new Date();
    var curDate;
    var yyyy = today.getFullYear().toString();                                    
    var mm = (today.getMonth()+1).toString();          
    var dd  = today.getDate().toString();
    var err = '';
                            
    curDate = yyyy + '-' + (mm[1]?mm:"0"+mm[0]) + '-' + (dd[1]?dd:"0"+dd[0]);
    if(document.form1.sdate.value < curDate){
         err = alert('Starting Date is less than Current Date.\n');
         document.form1.sdate.value=""
         document.getElementById("sdate").focus();
    } else if(document.form1.edate.value < document.form1.sdate.value){
         err = alert('End Date is less than Starting Date.\n');
         document.form1.edate.value=""
         document.getElementById("edate").focus();    
    } 
    document.MM_returnValue = (err == '');
    return err;            
}
function MM_validateForm() { 
  var i,p,q,nm,test,num,min,max,today,errors='',args=MM_validateForm.arguments;
  for (i=0; i<(args.length-2); i+=3) { 
    test=args[i+2]; val=MM_findObj(args[i]);
    if (val) { 
      nm=val.name; 
      if ((val=val.value)!="") {
        if (test.indexOf('isUse')!=-1) { 
        } else if (test.indexOf('isValid')!=-1) { MM_validDate();return errors;    
        } else if (test!='R') { num = parseFloat(val);
          if (isNaN(val)) {
              errors+='- '+nm+' must contain a number.. Exclude leading zero and retype..\n';
              }
        } 
      } else if (test.charAt(0) == 'R') errors += '- '+nm+' is required.\n'; 
    }
  } 
  if (errors) alert('The following error(s) occurred:\n'+errors);
  document.MM_returnValue = (errors == '');
}
-->
</script>

<div class="header">Vehicle Booking Details</div>
<h5>Following are the Vehicle Details. Fill the Form for Booking this vehicle type and submit it.<br/>
We will conform this booking within 2 Hours.</h5><br/>

<form id="form1" name="form1" method="post" action="do?MOD=BOK&ACT=doBok">
    
  <table width="90%" align="center" style="border:#D22929 solid 2px;padding:5px;" border="0" >
    <tr>
      <th colspan="3" scope="col"><div class="header">
          <div align="left">&nbsp;&nbsp;Booking Details</div>
      </div></th>
    </tr>
    
        <tr>
      <td width="36%"><strong>Vehicle Type:</strong>Car</td>
    </tr>
    
    <tr>
      <td><strong>Number : </strong>Pending...</td>
      
 
     <td width="21%" colspan="4" rowspan="18" ><img src="<%=(String)one.get(4)%>" width="220" height="120" /></td>
    </tr>




    <tr>
      <td colspan="2"><hr width="400px"  align="left" style="border:#990000 solid 2px;"/></td>
    </tr>
    
     <tr></tr>
    <tr>
      <td colspan="2"><strong>Starting  Location&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>:&nbsp;&nbsp;&nbsp; 
        <label>
         <input name="StLoc" type="text" id="StLoc" size="20"/>
         </label></td>
    </tr>
    
    <tr>
    <td colspan="2"><strong>Destination Location&nbsp;</strong>:&nbsp;&nbsp;&nbsp; 
        <label>
        <input name="DesLoc" type="text" id="DesLoc" size="20" /> 
                
    
     <td>&nbsp;</td>
    </tr>  
    
    <tr>
      <td colspan="2"><input type="hidden" name="v_name" value="<%=(String)one.get(0)%>" /></td>
    </tr>
    <tr>
      <td colspan="2"></td>
    </tr>
    <tr>
      <td colspan="2"><strong>Journey Start Date :</strong> 
        <label>
        <input name="sdate" type="text" id="sdate" size="20"  readonly="true"/>
      <a href="javascript: void(0);" onMouseOver="if (timeoutId) clearTimeout(timeoutId);window.status='Show Calendar';return true;" onMouseOut="if (timeoutDelay) calendarTimeout();window.status='';" onClick="g_Calendar.show(event,'form1.sdate',true,'yyyy-mm-dd'); return false;"><img src="include/calendar.gif" name="imgCalendar" width="25" height="21" border="0" alt="" ></a></label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2"><strong>Journey End Date:</strong>&nbsp;&nbsp;&nbsp; 
        <label>
        <input name="edate" type="text" id="edate" size="20"  readonly="true"/>
      <a href="javascript: void(0);" onMouseOver="if (timeoutId) clearTimeout(timeoutId);window.status='Show Calendar';return true;" onMouseOut="if (timeoutDelay) calendarTimeout();window.status='';" onClick="g_Calendar.show(event,'form1.edate',true,'yyyy-mm-dd'); return false;"><img src="include/calendar.gif" name="imgCalendar" width="25" height="21" border="0" alt="" ></a></label></td>
      <td>&nbsp;</td>
    </tr>
        <tr>
      <td colspan="3"><label><strong>Expected Journey In KiloMeters :</strong>
<input name="KiloMeters" type="text" id="KiloMeters" size="5" /> 
Km
</label></td>
    </tr>
    
    <tr>
      <td colspan="3"><label><strong>Expected Places to Stop :</strong>
      <input name="noStops" type="text" id="NoStops" size="5" /> 
     </label></td></tr>
     
      <tr><td>1.<input name="oneStops" type="text" id="oneStops" size="25" /> </td>  </tr>
            <tr><td>2.<input name="twoStops" type="text" id="twoStops" size="25" /> </td>  </tr>
                        <tr><td>3.<input name="threeStops" type="text" id="threeStops" size="25" /> </td>  </tr>
                              <tr><td>4.<input name="fourStops" type="text" id="fourStops" size="25" /> </td>  </tr>
                                    <tr><td>5.<input name="fiveStops" type="text" id="fiveStops" size="25" /> <strong>Maximum 5 Places</strong></td>  </tr>
                                 

    <tr>
 
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><label>
        <div align="right">
          <input type="reset" name="Submit2" value="Reset"   class="redButton"/>
          </div>
      </label></td>
      <td><label>
      
        <input name="Submit" type="submit"  class="redButton" onclick="MM_validateForm('edate','','RisValid','sdate','','RisValid','KiloMeters','','RisNaN');return document.MM_returnValue" value=" Book This Vehicle "/>
     </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>
<br/>
<% } %>




