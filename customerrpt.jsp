<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,
java.util.*,
net.vehicle.*" errorPage="" %>


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


<%@ page  import="java.lang.*"%> 




<%
    
            String fdate = request.getParameter("fdate");
            String tdate = request.getParameter("tdate");   

            Connection conn = null;
            conn = DBConnect.prepareConn();                        

         
            
             
             String sql="SELECT cust_id AS customers_cust_id , cust_name AS customers_cust_name, cust_uname AS customers_cust_uname, "+
                        "cust_city AS customers_cust_city, cust_sex AS customers_cust_sex, cust_mobile AS customers_cust_mobile, cust_email AS customers_cust_email, cust_status AS customers_cust_status"+
                        " FROM customers WHERE cust_status = 'A' AND cust_adddate BETWEEN '"+fdate+"' AND '"+tdate+ "' ORDER BY cust_id ";
            
           //String sql="SELECT cust_id AS customers_cust_id , cust_name AS customers_cust_name, cust_uname customers_cust_uname, "+
            //          "cust_city customers_cust_city, cust_sex customers_cust_sex, cust_mobile customers_cust_mobile, cust_email customers_cust_email, cust_status customers_cust_status"+
              //        " FROM customers WHERE cust_status = 'A' ORDER BY cust_id ";
            
           
           
            System.out.print(sql);
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery(sql);
            JRResultSetDataSource customers=new JRResultSetDataSource(rs);
            
            
            //JasperPrint jp;
           // jp = JasperFillManager.fillReport("C:/Users/g.s.perera/Desktop/MPM Ass/vehicle/web/rep_customer.jasper", new HashMap(), customers);
           // JasperViewer jv = new JasperViewer(jp);
           // jv.setVisible(true);
           // conn.close();
            
            
            
            
            File reportFile = new File(application.getRealPath("rep_customer.jasper"));//your report_name.jasper file
            System.out.println ("I m Ok");
            Map parameters = new HashMap();
            
            //HashMap<String, Object> map = new HashMap<String, Object>();
            // map.put("fdate","2017-06-30");
            //map.put("actionCode", actionCode);
            //parameters.put("30/06/2017");
            
            byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, customers);
            System.out.println ("i m still ok");
            
            
            OutputStream outStr = response.getOutputStream();
            //response.reset();
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            outStr.write(bytes, 0, bytes.length);
            outStr.flush();
            outStr.close();
            conn.close();
        %>
        
