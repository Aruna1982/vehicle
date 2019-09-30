<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,
																			 java.util.*,
																			 net.vehicle.*" errorPage="" %>
<%
String view = (String)session.getAttribute("view");
session.removeAttribute(view);

ArrayList all = VehicleCommon.viewVehiclesByTypeRent("Rent Cars");
int size = all.size();
%>
<script>
function bookThisVehicle(id){
	if(confirm('Want to Book this Vehicle Type ?')){
		window.location.href = 'do?MOD=BOK&ACT=bok&vid='+id;
		//alert('do?MOD=BOK&ACT=bok&vid='+id);
	}
}
</script>
<%
int count =0;
for(int i=0;i<size;i++){
count=count+1;
ArrayList one=(ArrayList)all.get(i);
%>


              
  <table>
  
  <tr>
    <th colspan="3" scope="col"><div class="header"> 
      <div align="left">&nbsp;<%=count%>)&nbsp;<%=(String)one.get(0)%></div>
    </div></th>
  </tr>
    <div><tr>&nbsp</tr>
  <tr>&nbsp</tr>
  <tr>&nbsp</tr>
  <tr>&nbsp</tr></div>
  
  <tr>
    <td colspan="2"><strong>Description :</strong>   <%=(String)one.get(5)%> </td>
  </tr>
  
    <tr>
    <td width="21%" rowspan="6"><img src="<%=(String)one.get(1)%>" width="220" height="120" /></td>
  </tr>

  <tr>
    <td colspan="2"><strong>No of Seats : </strong><%=one.get(2)%></td>
  </tr>
    <tr>
    <td colspan="2"><strong>No of Vehicles : </strong><%=one.get(3)%></td>
  </tr>


  
  

  <tr>
    <td>&nbsp;&nbsp;</td>
    <td>&nbsp;&nbsp;&nbsp;<a href="javascript:bookThisVehicle('<%=(String)one.get(0)%>')">Book Vehicle</a></td>
    <td>&nbsp;</td>
  </tr>
</table>
<br/>
<% } %>