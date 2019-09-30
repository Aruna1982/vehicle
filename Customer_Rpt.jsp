<%-- 
    Document   : Customer_Rpt
    Created on : Jun 15, 2017, 10:17:23 PM
    Author     : g.s.perera
--%>

<%@ page contentType="application/pdf" language="java" %>
<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import ="java.io.OutputStream"%>
<%@ page import ="java.io.FileOutputStream"%>
<%@ page import ="net.sf.jasperreports.view.JasperViewer"%>
<%@ page import ="net.sf.jasperreports.engine.xml.JRXmlLoader"%>
<%@ page import ="net.sf.jasperreports.engine.design.JasperDesign"%>

<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>


<%
    Connection conn=null;
     try {
        //Connecting to the MySQL database
 
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vdb", "root", "");
 
        //Loading Jasper Report File from Local file system
 
        //String jrxmlFile = session.getServletContext().getRealPath(request.getContextPath())+"/Customer_Rpt.jrxml";
        String jrxmlFile="C:\\Users\\g.s.perera\\Desktop\\MPM Ass\\vehicle\\web\\rep_customer.jrxml";
        System.out.println(jrxmlFile);
        InputStream input = new FileInputStream(jrxmlFile);
        JasperDesign jasperDesign = JRXmlLoader.load(input);
System.out.println("Compiling Report Designs");        
//input.reset();
        //Generating the report
       // Map<String, String> parameters = new HashMap<String, String>();
       // parameters.put("ReportTitle", "PDF JasperReport");
        JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
        System.out.println("Compiling Report Designs");
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, conn);
 System.out.println("Compiling Report Designs 2");
        
        
        //Exporting the report as a PDFrr
 
        //JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
 
        //Exporting the report
OutputStream output = new FileOutputStream("C:/test.pdf");
JasperExportManager.exportReportToPdfStream(jasperPrint, output);
//JasperExportManager.exportToPdfFile(jasperPrint, output);
JasperViewer.viewReport(jasperPrint);
System.out.println("Report Generation Complete");




    } catch (FileNotFoundException e) {
        e.printStackTrace();
    } catch (JRException e) {
        e.printStackTrace();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    finally {
        if(conn!=null){
            conn.close();
        }
    }
%>

