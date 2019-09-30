<%-- 
    Document   : index
    Created on : Jun 17, 2017, 8:53:32 PM
    Author     : g.s.perera
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
    
            String fdate = request.getParameter("fdate");
            String tdate = request.getParameter("tdate"); 
            
            Connection conn = null;
            conn = DBConnect.prepareConn();
            
            String sql = "SELECT fuel_details.`v_name` AS fuel_details_v_name, fuel_details.`d_name` AS fuel_details_d_name, fuel_details.`date` AS fuel_details_date,"+
            " fuel_details.`f_type` AS fuel_details_f_type, fuel_details.`qty` AS fuel_details_qty, fuel_details.`cost` AS fuel_details_cost "+
            " FROM `fuel_details` fuel_details WHERE date BETWEEN '"+fdate+"' AND '"+tdate+ "' ORDER BY v_name ";	
            
            System.out.print(sql);
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery(sql);
            JRResultSetDataSource fueldet =new JRResultSetDataSource(rs);

            File reportFile = new File(application.getRealPath("rep_fuel.jasper"));//your report_name.jasper file
            Map parameters = new HashMap();
            byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, fueldet);
 
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