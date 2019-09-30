<html>
<head>
<title>JMovers PVT LTD</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="include/admin.css" rel="stylesheet" type="text/css">
<link href="include/menu.css" rel="stylesheet" type="text/css">
<link href="include/main.css" rel="stylesheet" type="text/css">
<link rel="STYLESHEET" type="text/css" href="include/calendar.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script language="JavaScript" type="text/javascript" src="include/simplecalendar.js"></script>


  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<script>
function CloseSession(){
       
            //if(confirm('Want to Close this session - index ?')) {
              //  window.location.href = 'do?MOD=MTN&ACT=clsSess';
            //}
}
</script>

<style type="text/css">
<!--
html,body{
    text-align: center;
    background-image: url(images/pattern.gif);
}
.style1 {
	font-size: 16px;
	font-weight: bold;
	color: #000066;
}
.white{
color:#FFFFFF;
}
.style2 {color: #EED9A8}

-->
</style>
</head>
<body onbeforeunload="CloseSession()">
<div class="">
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="1" class="graybox">

  <tr>
    <td colspan="2">
	  <%@ include file="include/header.jsp" %>
	  </td>
  </tr>
  <tr>
    <td colspan="2"  bgcolor="#000066" style="height:25px;"><span class="style1">
      <marquee truespeed="truespeed">
	  <span class="style2">Call IT help desk 0112377244 for logging support ....</span>
      </marquee></span></td>
  </tr>
  <tr>
    <td width="20%" valign="top" bgcolor="#EED9A8" class="navArea"><p>&nbsp;</p>
     <%@ include  file="include/umenu.jsp" %>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>

    </td>
    
    <td width="80%" valign="top" class="contentArea">
        <table width="100%" border="0" cellspacing="0" cellpadding="20">
        <tr>
          <td>
<%
String ename = (String)session.getAttribute("uname");
System.out.print(ename);
String conPage=(String)session.getAttribute("content_page");
System.out.print("conPage ==> "+conPage);
if(conPage!=null){
%>
<jsp:include page="<%=conPage%>"/>
<%
}
else {
%>
<jsp:include page="ucontent.jsp"/>
<%
}
%></td>
        </tr>
      </table></td>
  </tr>
</table></div>
        

        
<p>&nbsp;</p>
<div class="white">
<p align="center">Copyright 2016 - 2019 - <b>National Savings Bank.</b> - All Rights Reserved <br>
<p align="center">Head Office, Savings House, 255, Galle Road, Colombo 3, Sri Lanka Tel: 011-2573008-15, Fax: 011-2379333, E-mail: manager.transport@nsb.lk<br>
</div>
</body>
</html>
