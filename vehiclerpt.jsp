<%-- 
    
    Created on : Jun 17, 2017, 8:53:32 PM
    Author     : Aruna Sanjeewa
--%>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page  import="java.io.*"%> 
<%@ page  import="java.sql.Connection"%> 
<%@ page  import="java.sql.DriverManager"%>
<%@ page  import="java.util.HashMap"%>
<%@ page  import="java.util.Map"%>
<%@ page  import="net.sf.jasperreports.engine.*"%>


<%@ page  import="net.sf.jasperreports.engine.JasperCompileManager"%>;
<%@ page  import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@ page  import="net.sf.jasperreports.engine.JasperPrint"%>
<%@ page  import="net.sf.jasperreports.engine.JasperReport"%>
<%@ page  import="net.sf.jasperreports.view.JasperViewer"%>

<%@ page  import="java.sql.*"%> 
<%@ page  import="java.util.*"%> 
<%@ page  import="java.lang.*"%> 
<%@ page  import="net.vehicle.*"%><%
            Connection conn = null;
            conn = DBConnect.prepareConn();

            File reportFile = new File(application.getRealPath("rep_vehicle.jasper"));//your report_name.jasper file
            Map parameters = new HashMap();
            byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conn);
 
            OutputStream outStr = response.getOutputStream();
            response.reset();
                    
            
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            System.out.println ("Before outStream");
            System.out.println("start jsp: " + response.isCommitted());

            System.out.println("start jsp: " + response.isCommitted());

            outStr.write(bytes, 0, bytes.length);
            outStr.flush();
            outStr.close();
        %>
