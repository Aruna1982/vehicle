<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="javafx.scene.control.Alert" %> 
<%@ page import="javafx.scene.control.Alert.AlertType"%>

<% 
String op="";
Connection c=null;
int up_dt=0;
String uname = request.getParameter("Username");
String upass = request.getParameter("Password");
if(uname != null && upass != null) {
try{
	Class.forName("com.mysql.jdbc.Driver");
	c = DriverManager.getConnection("jdbc:mysql://localhost:3306/vdb?useSSL=false","root","rooted");
	String sql_sel = "select * from admin_users where uname='"+uname+"' and upass = '"+upass+"'";
	Statement st = c.createStatement();
	ResultSet rs= st.executeQuery(sql_sel);
	if(rs.next()){	
                String m_logged = rs.getString(7).trim();
                session.setAttribute("uname",rs.getString(2));
                session.setAttribute("ucateg",rs.getString(4));
                if (m_logged.equals("N")) {
                      String sql_upd = "UPDATE admin_users SET ulogged = 'Y' where uname='"+uname+"'";
		      up_dt= st.executeUpdate(sql_upd);
                      System.out.println(m_logged);      
                      op="YES";
                      session.setAttribute("content_page","content.jsp");
		      response.sendRedirect("template.jsp");
                }else{ 
                      op= "LOG";
                      String sql_upd = "UPDATE admin_users SET ulogged = 'N' where uname='"+uname+"'";
		      up_dt= st.executeUpdate(sql_upd);
                      
                }
                m_logged = "";

	}else {
		op="NO";
	}
	c.close();

}catch(Exception e){
	System.out.println(e);
}
}
 %>
 
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="include/admin.css" rel="stylesheet" type="text/css">
<link href="include/menu.css" rel="stylesheet" type="text/css">
<link href="include/main.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>TMS ADMIN</title>
<style>
html,body{
    height: 100%;
    text-align: center;
    font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
    font-size: small;
    color:#FA0;
    background-image: url(images/pattern.gif);
}
.style1 {
	font-size: 16px;
	font-weight: bold;
	color: #000066;
	text-decoration:underline;
}
.style3 {
	font-size: 18px;
	font-weight: bold;
	color: #D22929;
	text-decoration:blink;
}
.myBox {
    margin: 0.5in auto;
    color: #fff;
    width: 600px;
    padding: 20px;
    text-align: left;
    background-color: #EED9A8;
    border: 3px solid #fff;

    /* Do rounding (native in Firefox and Safari) */
    -webkit-border-radius: 20px;
    -moz-border-radius: 20px;
}
.style4 {color: #EED9A8}
.style5 {color: #D22929}
.style6 {color: #000066; font-weight: bold; }
</style>
<script type="text/JavaScript">
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_validateForm() { //v4.0
  var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
  for (i=0; i<(args.length-2); i+=3) { test=args[i+2]; val=MM_findObj(args[i]);
    if (val) { nm=val.name; if ((val=val.value)!="") {
      if (test.indexOf('isEmail')!=-1) { p=val.indexOf('@');
        if (p<1 || p==(val.length-1)) errors+='- '+nm+' must contain an e-mail address.\n';
      } else if (test!='R') { num = parseFloat(val);
        if (isNaN(val)) errors+='- '+nm+' must contain a number.\n';
        if (test.indexOf('inRange') != -1) { p=test.indexOf(':');
          min=test.substring(8,p); max=test.substring(p+1);
          if (num<min || max<num) errors+='- '+nm+' must contain a number between '+min+' and '+max+'.\n';
    } } } else if (test.charAt(0) == 'R') errors += '- '+nm+' is required.\n'; }
  } if (errors) alert('The following error(s) occurred:\n'+errors);
  document.MM_returnValue = (errors == '');
}

//-->
</script>
</head>

<body     onbeforeunload="ConfirmClose()" onunload="HandleOnClose()>

<div class="myBox">
<table width="" border="0"  align="center" style=" background:#EED9A8">
  <tr>
    <th width="45" scope="col">&nbsp;</th>
    <th width="498" scope="col">&nbsp;</th>
    <th width="43" scope="col">&nbsp;</th>
  </tr>
  <tr>
    <th colspan="3" bgcolor="#000066" scope="col"><div align="center"><span class="style3"><span class="style4"><marquee>JMovers Online System -Employees Section</marquee></span></span> </div></th>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td><form id="form1" name="form1" method="post" action="">
      <table width="100%" border="0" align="center">
        <tr>
          <th colspan="3" scope="col">
		  <%
		  if(op.equals("NO")){
		  	%>
			<h3><font color="#000000">Login Failed. Re-Login Again.</font></h3>
			<%
		  }else if(op.equals("LOG")){                        
                         op = "RLOG";
                        %>
			<h3><font color="#000000">You have not properly logged out from previous session...</font></h3>
                        <h3><font color="#000000">Re-enter User Name and Password to Login...</font></h3>
			<%
                                                   
                  }
                  %>
		  </th>
          </tr>
        <tr>
          <td width="46%" rowspan="8"><img src="images/nano_car1.jpg" width="213" height="193" /></td>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2"><div align="center"><span class="style1">Staff Login Panel </span> </div></td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td width="22%"><span class="style6">User Name :</span> 
            <span class="style5">
            <label></label>
            </span></td>
          <td width="32%"><label>
            <input name="Username" type="text" id="Username" />
          </label></td>
        </tr>
        <tr>
          <td><span class="style6">&nbsp;Password :
              <label>              </label>
          </span>
            <span class="style5">
            <label></label>
            </span></td>
          <td><label>
            <input name="Password" type="password" id="Password" />
          </label></td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">
		  
		  <div align="center">
            <input name="Submit2" type="submit" class="redButton" onclick="MM_validateForm('Username','','R','Password','','R');return document.MM_returnValue" value=" Log In "/>
          </div></td>
        </tr>
        <tr>
          <td colspan="2"><label>
            </label></td>
        </tr>
        <tr>
          <td colspan="3">&nbsp;</td>
          </tr>
      </table>
        </form>    </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</div>
</body>
</html>
