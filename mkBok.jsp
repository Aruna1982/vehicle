

<%@ page import="java.sql.*,java.util.*,net.vehicle.VehicleCommon"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<script type="text/JavaScript">
    
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  
  if(!d) d=document; 
  if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);
  }
  if(!(x=d[n])&&d.all) x=d.all[n]; 
  for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n);    
  return x;
}
function MM_validDate(){  
    var today = new Date();
    var curDate;
    var yyyy = today.getFullYear().toString();                                    
    var mm = (today.getMonth()+1).toString();          
    var dd  = today.getDate().toString();
    var err = '';
                            
    curDate = yyyy + '-' + (mm[1]?mm:"0"+mm[0]) + '-' + (dd[1]?dd:"0"+dd[0]);
    if(document.mkBok.sdate.value < curDate){
         err = alert('Starting Date is less than Current Date.\n');
         document.mkBok.sdate.value=""
         document.getElementById("sdate").focus();
         
         
    }
    document.MM_returnValue = (err == '');
    return err;            
}

function MM_getTime(){
    document.mkBok.stime.value = document.mkBok.sthour.value +':'+ document.mkBok.stmint.value
}

function MM_checkHight(){
    var errors=''
    if (document.mkBok.MaxHightT.value > 10.5 ){
        alert('Maximum Hight should be less than 10.5 feet.\n');
        document.mkBok.MaxHightT.value=""
        document.getElementById("MaxHightT").focus();
    }
}
function MM_checkLength(){
    var errors=''
    if (document.mkBok.MaxLengthT.value > 16.5) {
        alert('Maximum Length should be less than 16.5 feet.\n');
        document.mkBok.MaxLengthT.value=""
        document.getElementById("MaxLengthT").focus();
    }
}

function MM_validateForm() { 
  var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
  for (i=0; i<(args.length-2); i+=3) { 
    test=args[i+2]; val=MM_findObj(args[i]);
    if (val) { 
      nm=val.name; 
      if ((val=val.value)!="") {
        if (test.indexOf('isUse')!=-1) { 
        } else if (test.indexOf('isEmail')!=-1) { 
        } else if (test.indexOf('isValid')!=-1) {MM_validDate();return errors;
        } else if (test!='R') { num = parseFloat(val);
           if (isNaN(val)) errors+='- '+nm+' must contain a number....\n';
        } 
      } else  {
      if(nm=="sdate") errors += 'Start Date is required.\n';
      if(nm=="stime") errors += 'Start Time is required.\n';
      if(nm=="MaxHightT") errors += 'Maximum Hight Time is required.\n';
      if(nm=="MaxLengthT") errors += 'Maximum Length is required.\n';
      if(nm=="ItemWeight") errors += 'Item Weight Time is required.\n';}
    }
  } 
  if (errors) alert('The following error(s) occurred:\n'+errors);
  document.MM_returnValue = (errors == '');
}
//-->
</script>

<script>
function checkLocat(){
        var sloc, desloc;
        sloc = document.mkBok.StLoc.value;
        desloc = document.mkBok.DesLoc.value;
        if((sloc.length = 0) && (desloc.length = 0)){
            alert('Enter Locations Correctly');
        }
        if((sloc.length > 0) && (desloc.length > 0)){
            if(confirm('Want to check Location ?')){
		window.location.href = 'do?MOD=BOK&ACT=tripBook&StLoc='+sloc+ '&DesLoc='+desloc;}
	}
}

</script>

    <div class="header">Vehicle Booking Details - Movements</div>
    <h5>Please make your booking for Office or House Movements by filling the following details. </h5><br/>

    <form id="form1" name="mkBok" method="post" action="do?MOD=BOK&ACT=doMoveBk">
        
        
    <table align="center">
    <tr>
      <th colspan="5" scope="col"><div class="header">Book For Movements</div></th>
    </tr>
    
    <tr>
      <td colspan="2"><hr width="400px"  align="left" style="border:#990000 solid 2px;"/></td>
    </tr>
    
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
                 <a href="javascript:checkLocat()">Take a Trip</a>
    
     <td>&nbsp;</td>
    </tr>  
    


    <tr>
      <td colspan="2"><strong>Journey Start Date :</strong> 
        <label>
            <input name="sdate" type="text" id="sdate" size="20"  readonly="true" />
      <a href="javascript: void(0);" onMouseOver="if (timeoutId) clearTimeout(timeoutId);window.status='Show Calendar';return true;" onMouseOut="if (timeoutDelay) calendarTimeout();window.status='';" onClick="g_Calendar.show(event,'mkBok.sdate',true,'yyyy-mm-dd'); return false;"><img src="include/calendar.gif" name="imgCalendar" width="25" height="21" border="0" alt="" ></a></label></td>
      <td>&nbsp;</td>
    </tr>
    
    <tr>
    <td colspan="2"><strong>Journey Start  Time&nbsp;&nbsp;&nbsp;&nbsp;</strong>:&nbsp;&nbsp;&nbsp; 
        <label>
         
            <select name="sthour" onchange="MM_getTime()">
            <option>05</option>
            <option>06</option>
            <option>07</option>
            <option>08</option>
            <option>09</option>
            <option>10</option>
            <option>11</option>
            <option>12</option>
            <option>13</option>
            <option>14</option>
            <option>15</option>
            <option>16</option>
            <option>17</option>
            <option>18</option>
            <option>19</option>
            <option>20</option>
        </select>
        
        
            : <select name="stmint" onchange="MM_getTime()">
            <option>00</option>
            <option>15</option>
            <option>30</option>
            <option>45</option>
        </select>
        
            <input type="text" name="stime" value="05:00" size="10" />
            
        </label></td>
     <td>&nbsp;</td>
    </tr>
   
  
 
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    
    <tr>
      <td colspan="2"><hr width="400px"  align="left" style="border:#990000 solid 2px;"/></td>
    </tr>
    
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>

    </tr>
   
    <tr>
      <td colspan="2"><strong>Need Assistants&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>:&nbsp;&nbsp;&nbsp;
        <label>
        <input type="checkbox" name="NeedAsist" value="ON" />
        </label></td>
      <td>&nbsp;</td>
    </tr>
    
    <tr>
      <td colspan="2"><strong>Item Max Hight&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>:&nbsp;&nbsp;&nbsp;
        <label>
            <input name="MaxHightT" type="number" id="MaxHightT" size="5" onchange="MM_checkHight()" /> Feet
        </label>
       <td>&nbsp;</td>
    </tr>
    
    <tr>
      <td colspan="2"><strong>Item  Max Length&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>:&nbsp;&nbsp;&nbsp;
        <label>
            <input name="MaxLengthT" type="number" id="MaxLengthT" size="5" onchange="MM_checkLength()"/> Feet
        </label>
       <td>&nbsp;</td>
    </tr>
          
    <tr>
      <td colspan="2"><strong>Item  Weight&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>:&nbsp;&nbsp;&nbsp;
        <label>
        <input name="ItemWeight" type="number" id="ItemWeight" size="5" /> Kg
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
      
      <td>&nbsp;</td>
      <td><label>      
        <div align="right">
          <input type="reset" name="ResetBook" value="Reset" />
        </div>
      </label></td>
      <td>&nbsp;</td>

      <td><label>
        <div align="center">
        <input name="Submit" type="submit" onclick="MM_validateForm('sdate','','RisValid','stime','','R','MaxHightT','','RisNum','MaxLengthT','','RisNum','ItemWeight','','RisNum');return document.MM_returnValue" value="Book Now" />
        </div>
      </label></td>


  <tr>
      <td colspan="2">&nbsp;</td>
      <td>&nbsp;</td>
  </tr>
  </table>
</form>



