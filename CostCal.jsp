<%-- 
    Document   : CostCal
    Created on : Mar 17, 2017, 10:29:00 AM
    Author     : g.s.perera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CostCal</title>
    </head>
    <body>
      
        <div class="header">Vehicle Booking Cost Calculation for Movements</div>
        <h3>You can calculate your Gross Cost for the Movements done with us.<br>Our Packages provide the BEST price in Sri Lanka...</br>Note :</br></h3> 
        <h5>Final Charge may change according to the actual distance of the transportation. </br>Others will be fixed for the package.</h5><br/>

<form id="form1" name="form1" method="post" action="do?MOD=BOK&ACT=doBok">
  <table width="90%" align="center" style="border:#D22929 solid 2px;padding:5px;" border="0" >
   

    <tr>
      <td colspan="2"><hr width="400px"  align="left" style="border:#990000 solid 2px;"/></td>
    </tr>

    <tr>
      <td colspan="2"><strong>Package&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>:&nbsp;&nbsp;&nbsp; 
          <label>
              
              <select name="vType">
                  <option>Package 1- Dimo Batta</option>
                  <option>Package 2- Foton Lorry</option>
                  <option>Package 3- Toyota Lorry</option>
              </select>

      </label></td>
      <td><br></td>
    </tr>
    <tr>
        
    </br><td colspan="2"><hr width="400px"  align="left" style="border:#990000 solid 2px;"/></td>
    </tr>    
    <tr>
      <td colspan="2"><strong>Fixed Charge&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>:&nbsp;&nbsp;&nbsp;
        <label>
        <input name="FixedChag" type="text" id="NoOfSeats" size="5" />
        </label></td>
      <td>&nbsp;</td>
    </tr>
          
    <tr>
      <td colspan="2"><strong>Variable Charge&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>:&nbsp;&nbsp;&nbsp;
        <label>
        <input name="VariChag" type="text" id="NoOfSeats" size="5" />
        </label></td>
      <td>&nbsp;</td>
    </tr>
    


    <tr>
      <td colspan="2"><strong>Fuel Surcharge&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>:&nbsp;&nbsp;&nbsp;
        <label>
        <input name="FuelChag" type="text" id="NoOfSeats" size="5" />
        </label></td>
      <td>&nbsp;</td>
    </tr>
    
    <tr>
      <td colspan="2"><strong>Delivery/Assistance Charge&nbsp;</strong>:&nbsp;&nbsp;&nbsp;
        <label>
        <input name="DeliChag" type="text" id="Payload" size="5" />
        </label></td>
      <td>&nbsp;</td>
    </tr>
    
    <tr>
      <td colspan="2"><strong>Traveling Distance&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>:&nbsp;&nbsp;&nbsp;
        <label>
        <input name="DistChag" type="text" id="Payload" size="5" />
        </label></td>
      <td>&nbsp;</td>
    </tr>


    
    <tr>
      <td colspan="2"><hr width="400px"  align="left" style="border:#990000 solid 2px;"/></td>
    </tr>
    
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;&nbsp;</td>
    <td>&nbsp;&nbsp;&nbsp;<a href="javascript:bookThisVehicle)%>)">Calculate Cost</a></td>
    <td>&nbsp;</td>
    

    
  </tr>
    <tr>
      <td colspan="2">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>
</html>
