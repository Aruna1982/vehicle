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

<form id="form1" name="form1" method="post" action="do?MOD=MTN&ACT=AddEMP&e=Ecateg" >
  <table width="80%" border="0" align="center">
    <tr>
      <th colspan="5" scope="col"><div class="header">
        <div align="left">Add Employee Details </div>
      </div></th>
    </tr>
    <tr>
      <td width="15%">&nbsp;</td>
      <td width="23%">&nbsp;</td>
      <td width="3%">&nbsp;</td>
      <td width="38%">&nbsp;</td>
      <td width="21%">&nbsp;</td>
    </tr>
    <tr>
        
        
    <tr>
      <td>&nbsp;</td>
      <td>Fuel Type </td>
      <td>:</td>
      <td><label>
        <select name="Ecateg">
		<option value="Manage">MANAGER</option>
		<option value="Clerk">CLERK</option>
		<option value="Recept">RECEPTIONIST</option>
		<option value="Admin">ADMINISTRATOR</option>
        </select>
      </label></td>
      <td>&nbsp;</td>
    </tr>
    
    
      <td>&nbsp;</td>
      <td>Driver First  Name </td>
      <td>:</td>
      <td><label>
        <input name="FirstName" type="text" id="FirstName" size="30" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Driver Last Name  </td>
      <td>:</td>
      <td><label>
        <input name="LastName" type="text" id="LastName" size="30" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
    
    <tr>
      <td>&nbsp;</td>
      <td>System Username</td>
      <td>:</td>
      <td><label>
        <input name="UName" type="text" id="UName" size="30" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
    
    <tr>
      <td>&nbsp;</td>
      <td>Address Line 1</td>
      <td>:</td>
      <td><label>
        <input name="AddLine1" type="text" id="AddLine1" size="40" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Address Line 2</td>
      <td>:</td>
      <td><label>
        <input name="AddLine2" type="text" id="AddLine2" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>City </td>
      <td>:</td>
      <td><label>
        <input name="City" type="text" id="City" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Mobile No. </td>
      <td>:</td>
      <td><label>
        <input name="MobileNo" type="number" id="MobileNo" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Date of Birth</td>
      <td>:</td>
      <td><label>
        <input type="text" name="dob"  readonly="true"/>
       <a href="javascript: void(0);" onMouseOver="if (timeoutId) clearTimeout(timeoutId);window.status='Show Calendar';return true;" onMouseOut="if (timeoutDelay) calendarTimeout();window.status='';" onClick="g_Calendar.show(event,'form1.dob',true,'yyyy-mm-dd'); return false;"><img src="include/calendar.gif" name="imgCalendar" width="34" height="21" border="0" alt="" ></a></label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Year of Experience  </td>
      <td>:</td>
      <td><label>
        <input type="number" name="Experience" />
		
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Note</td>
      <td>:</td>
      <td><label>
        <textarea name="Note" cols="30" rows="5" id="Note"></textarea>
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
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <div align="right">
          <input type="reset" name="Submit2" value="Reset"  class="redButton"/>
          </div>
      </label></td>
      <td>&nbsp;</td>
      <td><label>
        <input name="Submit" type="submit" class="redButton" onclick="MM_validateForm('FirstName','','R','LastName','','R','UName','','R','AddLine1','','R','City','','R','MobileNo','','RisNaN','LicenseNo','','R','Experiance','','RisNaN');return document.MM_returnValue" value="Add Employee" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>
<hr width="600px" style="background:#D22929; border:#D22929 solid 2px;"/>