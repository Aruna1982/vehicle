package net.vehicle;

import java.sql.*;
import java.util.*;


public class VehicleCommon {
	
  
	public static ArrayList getDrivers() {
		Connection c=null;
		ArrayList al=new ArrayList();
		try {
    		String sql="SELECT emp_fname,emp_lname FROM employees WHERE emp_code = 'Driver' ORDER BY emp_fname";
    		c = DBConnect.prepareConn();
    		Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				al.add(rs.getString(1)+ " "+rs.getString(2));
			}
			DBConnect.closeConn(c);		    		
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return al;
	}
        

	public static ArrayList getAvailability(String sdt) {
		Connection c=null;
		ArrayList al=new ArrayList();
		try {
    		String sql="SELECT * FROM bookings WHERE v_type='"+sdt+"' AND status <> 'C' ";
    		c = DBConnect.prepareConn();
    		Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				al.add(rs.getString(1));
			}
			DBConnect.closeConn(c);		    		
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return al;
	}
                
        
	
	public static ArrayList getVType() {
		Connection c=null;
		ArrayList al=new ArrayList();
		try {
    		String sql="SELECT DISTINCT(v_name) FROM vmast WHERE v_type= 'Lorries' ";
    		c = DBConnect.prepareConn();
    		Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				al.add(rs.getString(1));
			}
			DBConnect.closeConn(c);		    		
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return al;
	}
        
        
	
	public static ArrayList getVehicles() {
		Connection c=null;
		ArrayList al=new ArrayList();
		try {
    		String sql="SELECT DISTINCT(v_name) FROM vmast ORDER BY v_name";
    		c = DBConnect.prepareConn();
    		Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				al.add(rs.getString(1));
			}
			DBConnect.closeConn(c);		    		
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return al;
	}
	
	//--------------------------------------------------------------------------
	
	public static ArrayList viewAllFuelDetails() {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			String sql="SELECT * FROM fuel_details ORDER BY v_name";
			c = DBConnect.prepareConn();
    		        Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getString(2));
				one.add(rs.getString(3));
				one.add(rs.getString(4));
				one.add(rs.getString(5));
				one.add(rs.getString(6));
				one.add(rs.getInt(7)+"");
				one.add(rs.getInt(1)+"");
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}//viewAllFuelDetails 
	//--------------------------------------------------------------------------
	
	public static ArrayList viewAllOilChanges() {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			String sql="SELECT * FROM oil_detail ORDER BY v_name";
			c = DBConnect.prepareConn();
    		        Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getInt(1)+"");
				one.add(rs.getString(2));
				one.add(rs.getString(3));
				one.add(rs.getString(4));
				one.add(rs.getInt(5)+"");
				one.add(rs.getString(6));
				one.add(rs.getString(7));
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}//viewAllFuelDetails
	//--------------------------------------------------------------------------
	public static ArrayList viewAllRepair() {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			String sql="SELECT * FROM repair ORDER BY v_name";
			c = DBConnect.prepareConn();
    		Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getInt(1)+"");
				one.add(rs.getString(2));
				one.add(rs.getString(3));
				one.add(rs.getString(4));
				one.add(rs.getString(5));
				one.add(rs.getString(6));
				one.add(rs.getInt(7)+"");
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}//viewAllFuelDetails
        
        
        	public static ArrayList viewAllDrivers() {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			String sql="SELECT * FROM employees WHERE emp_code = 'Driver' AND status = 'A'";
                        System.out.println(sql);
			c = DBConnect.prepareConn();
    		Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getString(1));
                                one.add(rs.getString(3));
				one.add(rs.getString(4));
				one.add(rs.getInt(8)+"");
				one.add(rs.getString(9));
				one.add(rs.getString(10));
				one.add(rs.getInt(11)+"");
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}//viewAllFuelDetails
                
	//---------------------------------------------------------------------------------
	public static ArrayList viewAllDriversExp(Integer id) {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			String sql="SELECT * FROM employees WHERE emp_code = 'Driver' AND status = 'A' AND exp_exp="+id;
                        System.out.println(sql);
			c = DBConnect.prepareConn();
    		Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getString(1));
                                one.add(rs.getString(3));
				one.add(rs.getString(4));
				one.add(rs.getInt(8)+"");
				one.add(rs.getString(9));
				one.add(rs.getString(10));
				one.add(rs.getInt(11)+"");
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}//viewAllFuelDetails
	
	//---------------------------------------------------------------------------------
	public static ArrayList viewAllVehicles() {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			String sql="SELECT * FROM vmast WHERE status='A' ORDER BY v_name ";
			c = DBConnect.prepareConn();
    		Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getString(1));
				one.add(rs.getString(2));
				one.add(rs.getString(4));
				one.add(rs.getString(5));
				one.add(rs.getString(3));
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}//viewAllFuelDetails

	//---------------------------------------------------------------------------------
	public static ArrayList viewVehiclesByTypeRent(String type) {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			String sql="SELECT * FROM vmast WHERE v_type='"+type+"' ORDER BY v_name";
			c = DBConnect.prepareConn();
    		        Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
                                
				one.add(rs.getString(2));
				one.add(rs.getString(7));
				one.add(rs.getString(8));
				one.add(rs.getString(9));
				one.add(rs.getInt(8));
                one.add(rs.getString(12));
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}//viewAllFuelDetails
	//-------------------------------------
 	public static ArrayList viewVehiclesByType(String type) {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			String sql="SELECT * FROM vmast WHERE v_type='"+type+"' ORDER BY v_name";
			c = DBConnect.prepareConn();
    		Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getInt(1)+"");
				one.add(rs.getString(2));
				one.add(rs.getString(3));
				one.add(rs.getString(4));
				one.add(rs.getString(5));
				one.add(rs.getString(7));
				one.add(rs.getInt(8));
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}//viewAllFuelDetails
       
        
	public static ArrayList viewRentByID(String vid) {
		ArrayList all=new ArrayList();
                
		Connection c=null;
		try {
			String sql="SELECT * FROM vmast WHERE v_type= 'Rent Cars' AND v_name='"+vid+"'";
                        System.out.println(sql);
			c = DBConnect.prepareConn();
    		        Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getString(1));			
				one.add(rs.getString(2));	
				one.add(rs.getString(4));
				one.add(rs.getString(5));
				one.add(rs.getString(7));
				one.add(rs.getInt(8)+"");			
				one.add(rs.getString(12));
				all.add(one);
				
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}//vie       
        
	public static ArrayList viewVehiclesByID2(String vid) {
		ArrayList all=new ArrayList();
                
		Connection c=null;
		try {
			String sql="SELECT v_no,v_name FROM vmast WHERE v_no='"+vid+"'";
                        System.out.println(sql);
			c = DBConnect.prepareConn();
    		        Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getString(1));			
				one.add(rs.getString(2));
				all.add(one);
				
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}//vie
        
        
	public static ArrayList viewVehiclesByID(String id) {
		ArrayList one=new ArrayList();
		Connection c=null;
		try {
			String sql="SELECT * FROM vmast WHERE v_no= '"+id+"'";  
                        //String sql="select vmast.v_no,v_name,v_type,v_make,v_fuelType,ins_no,ins_agtname,ins_company,ins_date,ins_expdate "+
                        //"from vmast, veh_insurance where vmast.v_no = veh_insurance.v_no and vmast.v_no= '"+id+"'";
                        System.out.println(sql);
			c = DBConnect.prepareConn();
    		        Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
                                               
			while(rs.next()) {
				one.add(rs.getString(1));
				one.add(rs.getString(2));
				one.add(rs.getString(3));
				one.add(rs.getString(4));
				one.add(rs.getString(5));
				one.add(rs.getString(6));
				one.add(rs.getString(7));
				one.add(rs.getString(8));
				one.add(rs.getString(9));
				one.add(rs.getString(10));
                                
 				one.add(rs.getString(11));
				one.add(rs.getString(12));
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return one;
	}//viewAllFuelDetails      
        
	public static ArrayList viewInsurance(String id) {
		ArrayList one=new ArrayList();
		Connection c=null;
		try {
			String sql="SELECT * FROM veh_insurance WHERE ins_status = 'A' AND v_no= '"+id+"'";  
                        System.out.println(sql);
			c = DBConnect.prepareConn();
    		        Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
                                               
			while(rs.next()) {
				one.add(rs.getString(1));
				one.add(rs.getString(2));
				one.add(rs.getString(3));
				one.add(rs.getString(4));
				one.add(rs.getString(5));
				one.add(rs.getString(6));
				one.add(rs.getString(7));
                                one.add(rs.getString(8));
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return one;
	}//viewAllFuelDetails           
        
        
  	//--------------------------------------View all Bookigs  for Customer-------------------------
	public static ArrayList viewBookingCust(String id,String opt) {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			String sql="SELECT * FROM bookings WHERE cust_uname='"+id+"' AND status='"+opt+"' ORDER BY book_date DESC";
                        System.out.println(sql);
			c = DBConnect.prepareConn();
    		        Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
                                one.add(rs.getString(1));  
				one.add(rs.getString(3));
				one.add(rs.getString(5));
				one.add(rs.getString(6));
				
				one.add(rs.getDouble(8)+"");
				one.add(rs.getString(9));
                               
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}     
        
        
	//-------------------------------------EDIT USER PROFILE-------------------
	public static ArrayList viewBookingByID(String cid) {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			String sql="SELECT * FROM bookings WHERE cust_id="+cid+" ORDER BY status";
			c = DBConnect.prepareConn();
    		        Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
                                one.add(rs.getString(1));
                                one.add(rs.getString(11));
				one.add(rs.getString(4));
				one.add(rs.getString(5));
				one.add(rs.getString(6));
				one.add(rs.getString(7));
				one.add(rs.getInt(9)+"");
				one.add(rs.getString(10));
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}//-------------------------------------END OF EDIT USER PROFILE-------------------
        
	//--------------------------------
	public static ArrayList viewAllBooking(String bktype,String bkstat) {
		ArrayList all=new ArrayList();
		Connection c=null;
		try {
			String sql="SELECT * FROM bookings WHERE status ='"+bkstat+"'  AND substring(book_id,1,4)='"+bktype+"' ORDER BY book_id";
                        System.out.println(sql);
			c = DBConnect.prepareConn();
    		        Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				ArrayList one = new ArrayList();
				one.add(rs.getString(1));
				one.add(rs.getString(2));
				one.add(rs.getString(5));
				one.add(rs.getString(6));
				one.add(rs.getString(9));
                                one.add(rs.getString(10));
				all.add(one);
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return all;
	}             
        
	//--------------------------------
	public static ArrayList viewBookID(String bid) {
		ArrayList one=new ArrayList();
		Connection c=null;
		try {
			String sql="SELECT * FROM bookings WHERE book_id ='"+bid+"'";
                        System.out.println(sql);
			c = DBConnect.prepareConn();
    		        Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				
				one.add(rs.getString(1));
				one.add(rs.getString(2));
	         		
			}
			DBConnect.closeConn(c); 
 
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return one;
	}
        

	//-------------------------------------EDIT USER PROFILE-------------------
	public static ArrayList viewUserDetails(String id) {
		ArrayList one=new ArrayList();
		Connection c=null;
		try {
			String sql="SELECT * FROM customers WHERE cust_id='"+id+"'";
                        System.out.println (sql);
			c = DBConnect.prepareConn();
    		        Statement st=c.createStatement();
			ResultSet rs =st.executeQuery(sql);
			while(rs.next()) {
				one.add(rs.getString(2));
                                one.add(rs.getString(3));
				one.add(rs.getString(4));
				one.add(rs.getString(5));
				one.add(rs.getString(6));
				one.add(rs.getString(7));
				one.add(rs.getString(8));
                                one.add(rs.getString(9)); 
                                one.add(rs.getString(10));	
			}
			DBConnect.closeConn(c);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return one;
	}
        //-------------------------------------END OF EDIT USER PROFILE-------------------
}