<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,
																			 java.util.*,
																			 net.vehicle.*" errorPage="" %>


<html>
    <body>
       <h3 align="center">Summarization</h3>
        
    <form id="form1" name="form1" method="post">
<% 
String summary = request.getParameter("summary");
String type = request.getParameter("type");
String fdate = request.getParameter("fdate");
String tdate = request.getParameter("tdate");
System.out.print(summary);
ArrayList al2 = query.viewSummary(summary,type,fdate,tdate);

int size = al2.size();
//for(int i=0;i<size;i++){
//ArrayList one=(ArrayList)al1.get(i);
%>

<script>
    
  function PrintReport() {
    window.print();
  }

</script>



       
        

    
    <table  align="center">
        
   
    <tr>
      <td colspan="2">Summarize By</td>
      <td>:</td>
      <td><label>
        <select name="summary" >
        <option value="v_name">Vehicle</option>
	<option value="cust_uname">Customer</option>
	<option value="d_name">Driver</option>
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
      </div>
    </tr>
    </table> 
        
  <table width="75%" align="center"  border="1">
  <tr>
    <th bgcolor="#ccccff" scope="col"><span class="style10">Transport Type</span></th>
    <th bgcolor="#ccccff" scope="col"><span class="style10">Identity</span></th>
    <th bgcolor="#ccccff" scope="col"><span class="style10">Status</span></th>
    <th bgcolor="#ccccff" scope="col"><span class="style10">No of Bookings</span></th>
    <th bgcolor="#ccccff" scope="col"><span class="style10">Total Distance</span></th>
    <th bgcolor="#ccccff" scope="col"><span class="style10">Total Value</span></th>
  </tr>

<%
for(int j=0;j<size;j++){
ArrayList two=(ArrayList)al2.get(j);
%>
<tr style="height:30px; padding:4px;">
    <td><div align="center"><%=(String)two.get(0)%></div></td>
    <td><div align="center"><%=(String)two.get(1)%></div></td>
    <td><div align="center"><%=(String)two.get(2)%></div></td>
    <td><div align="center"><%=(String)two.get(3)%></div></td>
    <td><div align="center"><%=(String)two.get(4)%></div></td>
    <td><div align="center"><%=(String)two.get(5)%></div></td>
</tr>
<% } %>

</table>     
    </form>
    </body>
</html>
