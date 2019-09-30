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

function MM_validateForm() { 
  var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
  for (i=0; i<(args.length-2); i+=3) { 
    test=args[i+2]; val=MM_findObj(args[i]);
    if (val) { 
      nm=val.name; 
      if ((val=val.value)!="") {
        if (test.indexOf('isUse')!=-1) { 
             if (val == document.form1.Custname.value) errors+='- '+nm+' should not be same as Customer Name.\n';
             if (val.length > 5 || val.length < 4) errors+='- '+nm+' should be 4 to 5 characters in length.\n';
        } else if (test.indexOf('isEmail')!=-1) { 
          p=val.indexOf('@','.');
          if (p<1 || p==(val.length-1)) errors+='- '+nm+' must contain an e-mail address.\n';
        } else if (test.indexOf('isValid')!=-1) {
             if(val != document.form1.ConPassword.value) errors+='- '+nm+' and Confirm Password Not Match.\n'; 
             if (val.length > 15 || val.length < 6) errors+='- '+nm+' should be 6 to 15 characters in length.\n';
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

<h5 align="justify">
If you want to make a Booking through our Online System, please Register your self first.<br/>
If you are already Registered please <a href="do?MOD=BOK&ACT=Login">Login In</a> to Book the vehicle for your Trips.</h5>
<form id="form1" name="form1" method="post" action="do?MOD=BOK&ACT=doReg">
    
  <table align="center">
    <tr>
      <th colspan="5" scope="col"><div class="header">Customer Registration Form</div></th>
    </tr>
    <tr>
      <td width="20%">&nbsp;</td>
      <td width="29%">&nbsp;</td>
      <td width="2%">&nbsp;</td>
      <td width="29%">&nbsp;</td>
      <td width="20%">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><font color="#D22929">*</font> Customer Name</td>
      <td>:</td>
      <td><label>
        <input name="Custname" type="text" id="Custname"  />
          </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><font color="#D22929">*</font> EPF No</td>
      <td>:</td>
      <td><label>
        <input name="Username" type="number" id="Username" size ="10" />(Will be User Name)
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><font color="#D22929">*</font> Password</td>
      <td>:</td>
      <td><input name="Password" type="password" id="Password" /><keygen name="ucsc">
      </td>
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
      <td>&nbsp;&nbsp;&nbsp;Address Line1</td>
      <td>:</td>
      <td><input name="Address1" type="text" id="Address1" /></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;&nbsp;&nbsp;Address Line1</td>
      <td>:</td>
      <td><input name="Address2" type="text" id="Address2" /></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;&nbsp;&nbsp;Division or Branch</td>
      <td>:</td>
      <td><input name="City" type="text" id="City" size ="40"/></td>
      <td>&nbsp;</td>
    </tr>

    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;&nbsp;&nbsp;Sex</td>
      <td>:</td>
      <td><select name="CustSex">
        <option>Male</option>
        <option>Female</option>
          </select></td>
      <td>&nbsp;</td>
    </tr>
        <tr>
      <td>&nbsp;</td>
      <td>&nbsp;&nbsp;&nbsp;User Group</td>
      <td>:</td>
      <td><select name="CustGroup">
        <option>User</option>
        <option>Manager</option>
        <option>Transport Manager</option>
          </select></td>
      <td>&nbsp;</td>
    </tr>  
    <tr>
      <td>&nbsp;</td>
      <td><font color="#D22929">*</font> Mobile No.</td>
      <td>:</td>
      <td><input name="MobileNo" type="number" id="MobileNo" size ="10"/></td>
      <td>&nbsp;</td>
    </tr>
    
    <tr>
      <td>&nbsp;</td>
      <td><font color="#D22929">*</font> E-mail </td>
      <td>:</td>
      <td><input name="Email" type="email" id="Email" size ="50" /></td>
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
      <td>
        <div align="right">
          <input type="reset" name="ResetReg" value="Reset" />
        </div>
      </td>
      
      <td>&nbsp;</td>
      <td><label>
        <input name="Submit" type="submit" onclick="MM_validateForm('Custname','','R','Username','','RisUse','Password','','RisValid','City','','R','Address1','','R','CustSex','','R','CustGroup','','R','MobileNo','','RisNaN','Email','','RisEmail','Address','','R');return document.MM_returnValue" value="Register Now" />
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
      <td colspan="5"><div class="header">&nbsp;</div></td>
    </tr>
  </table>
</form>
