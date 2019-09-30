<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,
																			 java.util.*,
																			 net.vehicle.*" errorPage="" %>
<html>
<body>
<form method="post">
<%
//HttpServletRequest req;
String cuname = (String)session.getAttribute("u_name");
String statbox = (String)request.getParameter("statbox");
String test= request.getParameter("statbox");


System.out.println(test);
ArrayList all = VehicleCommon.viewBookingCust(cuname,statbox);

int size = all.size();
%>																			 
<style type="text/css">
<!--
.style10 {color: #EED9A8; font-weight: bold; font-size: 14px; }
-->
</style>

<script>
    function getOption() {  
        
        var txt = document.getElementById("statbox");
        txt.value = document.getElementById("statList").value;
     
     // var txt = document.getElementById("statList").value;
    // System.out.println(txt);
    } 
    
</script>

<div class="header">View Your Booking Status</div>
<h5>View Your Previous Booking status Here.<br/>
If you want to CANCEL you booking <a href="do?MOD=BOK&ACT=Login">Click Here.</a></h5>
<br/>

<label>Select Status : </label> 
<select id="statList" onchange="getOption()">
    <option value="A">Active</option>
    <option value="P">Pending</option>
    <option value="C">Completed</option>
</select>

<input type="text" id="statbox" name="statbox"  value="A" size="1" />

<input name="Submit" type="submit" value="Submit">

<table width="95%" align="center"  class="table table-hover" border = 1>
  <tr>
    <th  scope="col"><span class="style10">Booking ID</span></th>
    <th  scope="col"><span class="style10">Vehicle Name</span></th>
    <th  scope="col"><span class="style10">Start Date</span></th>
    <th  scope="col"><span class="style10">Start Time </span></th>
    <th  scope="col"><span class="style10">Kilometer</span></th>
    <th  scope="col"><span class="style10">Status(A-Active/P-Pending)</span></th>
  </tr>
  <%
for(int i=0;i<size;i++){
ArrayList one=(ArrayList)all.get(i);
%>
  <tr style="height:30px; padding:4px;">
    <td><div align="center"><%=(String)one.get(0)%></div></td>
    <td><div align="center"><%=(String)one.get(1)%></div></td>
    <td><div align="center"><%=(String)one.get(2)%></div></td>
    <td><div align="center"><%=(String)one.get(3)%></div></td>
    <td><div align="center"><%=(String)one.get(4)%>&nbsp;Km.</div></td>
    <td><div align="center"><%=(String)one.get(5)%></div></td>
  </tr>
  <% } %>
</table>
</body>
</form>