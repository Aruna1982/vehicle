<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,
																			 java.util.*,
																			 net.vehicle.*" errorPage="" %>
<% 
String vid = (String)session.getAttribute("vid");
System.out.println(vid);
ArrayList al=VehicleCommon.getDrivers();
ArrayList one = VehicleCommon.viewVehiclesByID(vid);
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
//-->
</script>

<div class="header">Vehicle Edit </div>
<h3>Following are the Vehicle Details.You can Edit the Details. </h3>
<br/>

<form id="form1" name="form1" method="post" action="do?MOD=BOK&ACT=EditVeh">
  <table width="90%" align="center" style="border:#D22929 solid 2px;padding:5px;" border="0" >
    <tr>
      <th colspan="3" scope="col"><div class="header">
          <div align="left">&nbsp;&nbsp;<%=(String)one.get(0)%></div>
              <input type="hidden" name="vid" value="<%=(String)one.get(0)%>" />
      </div></th>
    </tr>

  
   <tr>
      <td>&nbsp;</td>
      <td>Name</td>
      <td><label>  
      <input type="text" name="v_name" value="<%=(String)one.get(1)%>" size="30" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
      
   <tr>
      <td>&nbsp;</td>
      <td>Make</td>
      <td><label>  
          <input type="text" name="make" value="<%=(String)one.get(3)%>" />
      </label></td>
      <td>&nbsp;</td>
    </tr>

    <tr>
      <td>&nbsp;</td>
      <td>Fuel Type</td>
      <td><label>         
          <input type="text" name="fuel" size="8" value="<%=(String)one.get(4)%>" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
    
    <tr>
      <td>&nbsp;</td>
      <td>Vehicle Type</td>
      <td><label>
      <input type="text" name="v_type" value="<%=(String)one.get(2)%>" />
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
      <td>Vehicle Type </td>
      <td><label>
        <select name="status">
		<option value="A">&nbsp;Active</option>
                <option value="R">&nbsp;Repairing</option>
		<option value="S">&nbsp;Sold</option>
                <option value="O">&nbsp;Other</option>
		</select>
      </label></td>
      <td>&nbsp;</td>
    </tr>
    
    <tr>
      <td>&nbsp;</td>
      <td>Description</td>
      <td><label>
      <textarea name="v_desc" id="v_desc"></textarea>
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
          <input type="reset" name="VehReset" value="Reset" />
          </div>
      </label></td>

      <td><label>
         <input name="Submit" type="submit" onclick="return document.MM_returnValue"  value=" Update Vehicle"/>
      </label></td>
      <td>&nbsp;</td>
    </tr>   

  </table>
</form>

