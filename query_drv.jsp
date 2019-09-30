<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,
																			 java.util.*,
																			 net.vehicle.*" errorPage="" %>


<html>
    <body>
       <h3>Driver Schedule Information</h3>
        
    <form id="form1" name="form1" method="post">
<% 

String dname = request.getParameter("dname");
String status = request.getParameter("action");
String type = request.getParameter("type");
String fdate = request.getParameter("fdate");
String tdate = request.getParameter("tdate");
ArrayList al1 = query.viewDriverBook(dname,status,type,fdate,tdate);
ArrayList al=VehicleCommon.getDrivers();
int size = al1.size();
%>


<script>
    
  function PrintReport() {
    window.print();
  }

</script>

       
           
    <table class="table table-hover" align="left">
        
    <tr>
      <td colspan="2">Driver Name</td>
      <td>:</td>
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
      <td colspan="2">Booking Status</td>
      <td>:</td>
      <td><label>
        <select name="action" >
        <option value="P','A','C','R">All</option>
	<option value="P">Pending</option>
	<option value="A">Approved</option>
        <option value="C">Completed</option>
	<option value="R">Rejected</option>
	</select>
      </label></td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
    </tr>   

    <tr>
      <td colspan="2">Transport Type</td>
      <td>:</td>
      <td><label>
        <select name="type" >
        <option value="MOVE','RENT">All</option>
	<option value="MOVE">Movement</option>
	<option value="RENT">Rent</option>
	</select>
      </label></td>
       <td>&nbsp;</td>
    </tr>   
    
    <tr>
        <td colspan="2">Report From Date</td> 
        <td>:</td>
        <td><label>
        <input name="fdate" type="text" id="fdate" size="20"/>
        <a href="javascript: void(0);" onMouseOver="if (timeoutId) clearTimeout(timeoutId);window.status='Show Calendar';return true;" onMouseOut="if (timeoutDelay) calendarTimeout();window.status='';" onClick="g_Calendar.show(event,'form1.fdate',true,'yyyy-mm-dd'); return false;"><img src="include/calendar.gif" name="imgCalendar" width="25" height="21" border="0" alt="" ></a>
        </label></td>
      <td>&nbsp;</td>
    </tr>
    
    <tr>
      <td colspan="2">Report To Date:</td> 
      <td>:</td>
      <td><label>
        <input name="tdate" type="text" id="tdate" size="20" />
        <a href="javascript: void(0);" onMouseOver="if (timeoutId) clearTimeout(timeoutId);window.status='Show Calendar';return true;" onMouseOut="if (timeoutDelay) calendarTimeout();window.status='';" onClick="g_Calendar.show(event,'form1.tdate',true,'yyyy-mm-dd'); return false;"><img src="include/calendar.gif" name="imgCalendar" width="25" height="21" border="0" alt="" ></a>
      </label></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    
    <tr>
      <div align="center">
      <td>&nbsp;</td>
      <td><label>        
        <input type="reset" name="reset" value="Reset" class="redButton" />
      </label></td>
      <td>&nbsp;</td>
      <td><label>
        <input name="submit" type="submit" class="redButton" onclick="" value="Generate Report" />
      </label></td>
      <td>&nbsp;</td>
      <td><label>
        <input name="print" type="submit" class="redButton" onclick="PrintReport()" value="Print Report" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
    
    <tr>      
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    
    </table> 


</table>     
    <tr>      
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>

   <table width="70%" align="center"  border="1">
  <tr>
    <th bgcolor="#6666ff" scope="col"><span class="style10">Booked ID</span></th>
    <th bgcolor="#6666ff" scope="col"><span class="style10">Customer</span></th>
    <th bgcolor="#6666ff" scope="col"><span class="style10">Vehicle ID</span></th>
    <th bgcolor="#6666ff" scope="col"><span class="style10">Traveled Date</span></th>
    <th bgcolor="#6666ff" scope="col"><span class="style10">Traveled Distance</span></th>
    <th bgcolor="#6666ff" scope="col"><span class="style10">Tour Value</span></th>
  </tr>

<%
for(int i=0;i<size;i++){
ArrayList one=(ArrayList)al1.get(i);
%>

<tr style="height:30px; padding:4px;">
    <td><div align="center"><%=(String)one.get(0)%></div></td>
    <td><div align="center"><%=(String)one.get(1)%></div></td>
    <td><div align="center"><%=(String)one.get(2)%></div></td>
    <td><div align="center"><%=(String)one.get(3)%></div></td>
    <td><div align="center"><%=(String)one.get(4)%></div></td>
    <td><div align="center"><%=(String)one.get(5)%></div></td>
    
</tr>
<% } %>

</table> 
    
    
    </form>
    </body>
</html>
