<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,
																			 java.util.*,
																			 net.vehicle.*" errorPage="" %>
<%
String id = (String)session.getAttribute("u_id");
ArrayList all = VehicleCommon.viewUserDetails(id);
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
             if (val.length > 15 || val.length < 8) errors+='- '+nm+' should be 10 to 15 characters in length.\n';
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

<form id="form1" name="form1" method="post" action="do?MOD=BOK&ACT=doEdit">
  <table width="60%" border="0" align="center" cellpadding="5" cellspacing="2">
    <tr>
      <th colspan="5" scope="col"><div class="header">Edit Customer Details</div></th>
    </tr>
    <tr>
      <td width="11%">&nbsp;</td>
      <td width="29%">First Name </td>
      <td width="2%">:</td>
      <td width="38%"><label>
        <input name="Custname" type="text" id="Custname" value="<%=(String)all.get(0)%>" />
      </label></td>
      <td width="20%">&nbsp;</td>
    </tr>
    <tr>
      <td width="11%">&nbsp;</td>
      <td width="29%">Last Name </td>
      <td width="2%">:</td>
      <td width="38%"><label>
        <input name="Username" type="text" id="Username" value="<%=(String)all.get(1)%>" />
      </label></td>
      <td width="20%">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Password</td>
      <td>:</td>
      <td><label>
        <input name="Password" type="password" id="Password" value="<%=(String)all.get(2)%>" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
    
    <tr>
      <td>&nbsp;</td>
      <td><font color="#D22929">*</font> Confirm Password</td>
      <td>:</td>
      <td><input name="ConPassword" type="password" id="ConPassword" /><keygen name="ucsc"></td>
      <td>&nbsp;</td>
    </tr>
    
    <tr>
      <td>&nbsp;</td>
      <td>Address</td>
      <td>:</td>
      <td><label>
        <input name="Address1" type="text" id="Address1"  value="<%=(String)all.get(3)%>" size="30"/>
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>City</td>
      <td>:</td>
      <td><input name="Address2" type="text" id="Address2"  value="<%=(String)all.get(4)%>"/></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>District</td>
      <td>:</td>
      <td><input name="City" type="text" id="City"  value="<%=(String)all.get(5)%>"/></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Sex</td>
      <td>:</td>
      <td><input name="CustSex" type="text" id="CustSex"  value="<%=(String)all.get(6)%>"/></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Mobile No. </td>
      <td>:</td>
      <td><input name="Mobile" type="number" id="Mobile" value="<%=(String)all.get(7)%>" /></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Email</td>
      <td>:</td>
      <td><label>
        <input name="Email" type="email" id="Email" value="<%=(String)all.get(8)%>" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <div align="right">
          <input type="reset" name="ResetUE" value="Reset" />
        </div>
      </label></td>
      <td colspan="2"><label>
        <input name="Submit" type="submit" onclick="MM_validateForm('Custname','','R','Username','','R','Password','','R','Address1','','R','Address2','','R','City','','R','CustSex','','R','Mobile','','R','Email','','R');return document.MM_returnValue" value="User Edit" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="5">&nbsp;</td>
    </tr>
  </table>
</form>
