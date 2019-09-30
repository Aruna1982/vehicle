<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,
																			 java.util.*,
																			 net.vehicle.*" errorPage="" %>
<% 
String bid = (String)session.getAttribute("bid");
System.out.println(bid);
ArrayList al=VehicleCommon.getDrivers();
ArrayList al1=VehicleCommon.getVehicles();   
ArrayList one = VehicleCommon.viewBookID(bid);
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

function MM_validateForm() { //v4.0
  var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
  for (i=0; i<(args.length-2); i+=3) { test=args[i+2]; val=MM_findObj(args[i]);
    if (val) { nm=val.name; if ((val=val.value)!="") {
      if (test.indexOf('isEmail')!=-1) { p=val.indexOf('@');
        if (p<1 || p==(val.length-1)) errors+='- '+nm+' must contain an e-mail address.\n';
      } else if (test!='R') { num = parseFloat(val);
        if (isNaN(val)) errors+='- '+nm+' must contain a number.\n';
        if (test.indexOf('inRange') != -1) { p=test.indexOf(':');
          min=test.substring(8,p); max=test.substring(p+1);
          if (num<min || max<num) errors+='- '+nm+' must contain a number between '+min+' and '+max+'.\n';
    } } } else if (test.charAt(0) == 'R') errors += '- '+nm+' is required.\n'; }
  } if (errors) alert('The following error(s) occurred:\n'+errors);
  document.MM_returnValue = (errors == '');
}

//-->
</script>


<div class="header">Vehicle Edit </div>
<h3>Following are the Vehicle Details.You can Edit the Details. </h3>
<br/>

<form id="form1" name="form1" method="post" action="do?MOD=BOK&ACT=makebook">

  <table width="90%" align="center" style="border:#D22929 solid 2px;padding:5px;" border="0" >
    <tr>
      <th colspan="3" scope="col"><div class="header">
          <div align="left">&nbsp;&nbsp;Booking ID : <%=(String)one.get(0)%></div>
              <input type="hidden" name="bid" value="<%=(String)one.get(0)%>" />
      </div></th>
    </tr>
    
   <tr>
      <td>&nbsp;</td>
      <td>Customer Username</td>
      <td><label>  
      <input type="text" name="uname" value="<%=(String)one.get(1)%>" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
       
     <tr>
      <td>&nbsp;</td>
      <td>Driver Name </td>
      <td><label>
        <select name="dname" id="dname">
		<%
		for(int j=0;j<al.size();j++){
		%>
		<option value="<%=(String)al.get(j)%>"><%=(String)al.get(j)%></option>
		<% } %>
        </select>
      </label></td>
      <td>&nbsp;</td>
    </tr>
    
    <tr>
      <td>&nbsp;</td>
      <td>Vehicle No</td>
      <td><label> 
      <select name="vname"  id="vname">
		<%
                for(int i=0;i<al1.size();i++){
		%>
		<option value="<%=(String)al1.get(i)%>">&nbsp;<%=(String)al1.get(i)%></option>
		<% } %>
        </select>
      </label></td>
      <td>&nbsp;</td>
    </tr>

   <tr>
      <td>&nbsp;</td>
      <td>Traveled Distance</td>
      <td><label>  
      <input type="number" name="distance"/>
      </label></td>
      <td>&nbsp;</td>
    </tr>
    
   <tr>
      <td>&nbsp;</td>
      <td>Booking Charge</td>
      <td><label>  
      <input type="number" name="charge"/>
      </label></td>
      <td>&nbsp;</td>
    </tr>
    
    <tr>
      <td>&nbsp;</td>
      <td>Booking Status</td>
      <td><label> 
      <select name="action" id="action">
	<option value="P">Pending</option>
	<option value="A">Approved</option>
	<option value="R">Rejected</option>
        <option value="C">Completed</option>
      </select>
      </label></td>
      <td>&nbsp;</td>
    </tr>
    
    
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><label>
        

    
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <div align="right">
          <input type="reset" name="BkReset" value="Reset" />
          </div>
      </label></td>

      <td><label>
         <input name="Submit" type="submit" onclick="MM_validateForm('distance','','R','charge','','R');return document.MM_returnValue"  value=" Update Booking"/>
      </label></td>
      <td>&nbsp;</td>
    </tr>
    
    
  </table>
</form>

