
package net.vehicle;

import java.sql.*;
import java.io.IOException;
import java.util.*;


public class query {
    
	public static ArrayList viewCustomerBook(String cid, String stat, String type, String fdate, String tdate) {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			String sql= "SELECT book_id, v_name, d_name, sdate, km, book_chag FROM bookings "
                                + "WHERE cust_uname ='"+cid
                                +"'  AND status in ('"+stat
                                +"') AND substring(book_id,1,4) in ('"+type 
                                +"') AND sdate between '"+fdate+"' AND '"+tdate+"'";
                        System.out.print(sql);
			c = DBConnect.prepareConn();
    		        Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getString(1));
				one.add(rs.getString(2));
				one.add(rs.getString(3));
				one.add(rs.getString(4));
				one.add(rs.getString(5));
                                one.add(rs.getString(5));
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}
        
        
	public static ArrayList viewVehicleBook(String vid, String stat, String type, String fdate, String tdate) {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			String sql= "SELECT book_id, cust_uname, d_name, sdate, km, book_chag FROM bookings "
                                + "WHERE v_name ='"+vid
                                +"'  AND status in ('"+stat
                                +"') AND substring(book_id,1,4) in ('"+type 
                                +"') AND sdate between '"+fdate+"' AND '"+tdate+"'";
                        System.out.print(sql);
                        
			c = DBConnect.prepareConn();
    		        Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getString(1));
				one.add(rs.getString(2));
				one.add(rs.getString(3));
				one.add(rs.getString(4));
				one.add(rs.getString(5));
                                one.add(rs.getString(5));
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}        
        
        
        	public static ArrayList viewDriverBook(String did, String stat, String type, String fdate, String tdate) {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			String sql= "SELECT book_id, cust_uname,v_name, sdate, km, book_chag FROM bookings "
                                + "WHERE d_name ='"+did
                                +"'  AND status in ('"+stat
                                +"') AND substring(book_id,1,4) in ('"+type 
                                +"') AND sdate between '"+fdate+"' AND '"+tdate+"'";
                        System.out.print(sql);
                        
			c = DBConnect.prepareConn();
    		        Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getString(1));
				one.add(rs.getString(2));
				one.add(rs.getString(3));
				one.add(rs.getString(4));
				one.add(rs.getString(5));
                                one.add(rs.getString(6));
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	} 
                
                
        public static ArrayList viewSummary(String summary, String type, String fdate, String tdate) {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
                     String sql= "SELECT substring(book_id,1,4) ," +summary+ " , status, count(*), sum(km), sum(book_chag) FROM bookings "
                                + "WHERE substring(book_id,1,4) in ('"+type
                                +"') AND sdate between '"+fdate+"' AND '"+tdate
                                +"' GROUP BY  1,2,3";
                   
                     System.out.print(sql);

                    
			c = DBConnect.prepareConn();
    		        Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getString(1));
				one.add(rs.getString(2));
				one.add(rs.getString(3));
				one.add(rs.getString(4));
				one.add(rs.getString(5));
                                one.add(rs.getString(6));
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	} 
        
}