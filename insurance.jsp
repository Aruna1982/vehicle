<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,
																			 java.util.*,
																			 net.vehicle.*" errorPage="" %>
<% 
String vid = (String)session.getAttribute("vid");
ArrayList one = VehicleCommon.viewInsurance(vid);
System.out.println(vid);

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

function MM_validateForm() { 
  var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
  for (i=0; i<(args.length-2); i+=3) { 
    test=args[i+2]; val=MM_findObj(args[i]);
    if (val) { 
      nm=val.name; 
      if ((val=val.value)!="") {
        if (test.indexOf('isUse')!=-1) { 
             if (val == document.form1.Custname.value) errors+='- '+nm+' should not be same as Customer Name.\n';
             if (val.length > 15 || val.length < 8) errors+='- '+nm+' should be 8 to 15 characters in length.\n';
        } else if (test.indexOf('isEmail')!=-1) { 
          p=val.indexOf('@','.');
          if (p<1 || p==(val.length-1)) errors+='- '+nm+' must contain an e-mail address.\n';
        } else if (test.indexOf('isValid')!=-1) {
             if(val != document.form1.ConPassword.value) errors+='- '+nm+' and Confirm Password Not Match.\n'; 
             if (val.length > 15 || val.length < 10) errors+='- '+nm+' should be 10 to 15 characters in length.\n';
             if (val == document.form1.Username.value) errors+='- '+nm+' should not be same as user name.\n';
        } else if (test!='R') { num = parseFloat(val);
          if (isNaN(val)) {
              errors+='- '+nm+' must contain a number.. Exclude leading zero and retype..\n';
              }
          if (val.length != 9) {errors+='- '+nm+' should be 9 digits. Exclude leading zero and retype..\n';}
        } 
      } else if (test.charAt(0) == 'R') errors += '- '+nm+' is required.\n'; 
    }
  } 
  if (errors) alert('The following error(s) occurred:\n'+errors);
  document.MM_returnValue = (errors == '');
}

//-->
</script>

<div class="header">Insurance Edit </div>
<h3>Following are the Vehicle Insurance Details.You can Edit the Details. </h3>
<br/>

<form id="form1" name="form1" method="post" action="do?MOD=BOK&ACT=EditIns">
  <table width="90%" align="center" style="border:#D22929 solid 2px;padding:5px;" border="0" >
    <tr>
      <th colspan="3" scope="col"><div class="header">
          <div align="left">&nbsp;&nbsp;<%=(String)one.get(1)%></div>
              <input type="hidden" name="vid" value="<%=(String)one.get(1)%>" />
      </div></th>
    </tr>
    
   <tr>  
      <td>&nbsp;</td>
      <td>Insurance No</td>
      <td><label>  
      <input type="text" name="ino" value="<%=(String)one.get(0)%>" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
      
    <tr>
      <td>&nbsp;</td>
      <td>Agent Name </td>
      <td><label> 
          <input type="text" name="agt_name" value="<%=(String)one.get(2)%>" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
    
    <tr>
      <td>&nbsp;</td>
      <td>Company </td>
      <td><label> 
          <input type="text" name="c_name" value="<%=(String)one.get(3)%>" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
    
    <tr>
      <td>&nbsp;</td>
      <td>Start Date </td> 
      <td><label>
        <input name="sdate" type="text" id="sdate" value="<%=(String)one.get(4)%>" size="20" />
      <a href="javascript: void(0);" onMouseOver="if (timeoutId) clearTimeout(timeoutId);window.status='Show Calendar';return true;" onMouseOut="if (timeoutDelay) calendarTimeout();window.status='';" onClick="g_Calendar.show(event,'form1.sdate',true,'yyyy-mm-dd'); return false;"><img src="include/calendar.gif" name="imgCalendar" width="25" height="21" border="0" alt="" ></a>
      </label></td>
      <td>&nbsp;</td>
    </tr>
    
    <tr>
      <td>&nbsp;</td>
      <td>Expiry Date </td> 
      <td><label>
        <input name="edate" type="text" id="edate" value="<%=(String)one.get(5)%>" size="20" />
      <a href="javascript: void(0);" onMouseOver="if (timeoutId) clearTimeout(timeoutId);window.status='Show Calendar';return true;" onMouseOut="if (timeoutDelay) calendarTimeout();window.status='';" onClick="g_Calendar.show(event,'form1.edate',true,'yyyy-mm-dd'); return false;"><img src="include/calendar.gif" name="imgCalendar" width="25" height="21" border="0" alt="" ></a></label></td>
    <td>&nbsp;</td>
    </tr>
    
    <tr>
      <td>&nbsp;</td>
      <td>Insurance Value </td> 
      <td><label>
          <input type="text" name="insval" value="<%=(String)one.get(6)%>" size="30" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
   
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <div align="right">
          <input type="reset" name="insReset" value="Reset" />
          </div>
      </label></td>

      <td><label>
         <input name="Submit" type="submit" onclick="MM_validateForm('sdate','','R','edate','','R','c_name','','R','insval','','R');return document.MM_returnValue"  value=" Update Insurance"/>
      </label></td>
      <td>&nbsp;</td>
    </tr>   
    

  </table>
</form>