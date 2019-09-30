package net.vehicle;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import javazoom.upload.*;
import java.util.Hashtable;
import java.sql.*;

public class VehicleServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		process(req, res);
	}// doGet

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		process(req, res);
	}// doGet

	public void process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String mod = req.getParameter("MOD");
		String act = req.getParameter("ACT");

		HttpSession session = req.getSession();
		if (mod.equals("MTN")) {

			if (act.equals("VclAdd")) {
				session.setAttribute("content_page", "addVehicle.jsp");
				res.sendRedirect("template.jsp");
			} else if (act.equals("RevAdd")) {
				session.setAttribute("content_page", "addvlicence.jsp");
				res.sendRedirect("template.jsp");

			} else if (act.equals("ElogOut")) {
				String uname = (String) session.getAttribute("uname");
				String sql_upd = "UPDATE admin_users SET ulogged = 'N' where uname='" + uname + "'";
				DBConnect.updateQuery(sql_upd);

				session.setAttribute("content_page", "content.jsp");
				res.sendRedirect("index.jsp");

			} else if (act.equals("clsSess")) {
				String uname = (String) session.getAttribute("uname");
				if (uname != null) {
					String sql_upd = "UPDATE admin_users SET ulogged = 'N' where uname='" + uname + "'";
					DBConnect.updateQuery(sql_upd);
				}
			} else if (act.equals("ViewVcl")) {
				session.setAttribute("content_page", "viewAllVehicles.jsp");
				res.sendRedirect("template.jsp");
			} else if (act.equals("DvrAdd")) {
				session.setAttribute("content_page", "addDriver.jsp");
				res.sendRedirect("template.jsp");
			} else if (act.equals("EmpAdd")) {
				session.setAttribute("content_page", "addEmployee.jsp");
				res.sendRedirect("template.jsp");
			} else if (act.equals("ViewDvr")) {
				session.setAttribute("content_page", "viewAllDrivers.jsp");
				res.sendRedirect("template.jsp");
			} else if (act.equals("FuelAdd")) {
				session.setAttribute("content_page", "addFuel.jsp");
				res.sendRedirect("template.jsp");
			} else if (act.equals("ViewFuel")) {
				session.setAttribute("content_page", "viewFuelExpences.jsp");
				res.sendRedirect("template.jsp");
			} else if (act.equals("OilAdd")) {
				session.setAttribute("content_page", "oilChangeDetail.jsp");
				res.sendRedirect("template.jsp");
			} else if (act.equals("ViewOil")) {
				session.setAttribute("content_page", "viewOilChanges.jsp");
				res.sendRedirect("template.jsp");
			} else if (act.equals("RepairAdd")) {
				session.setAttribute("content_page", "repairDetail.jsp");
				res.sendRedirect("template.jsp");
			} else if (act.equals("quesum")) { //
				session.setAttribute("content_page", "query_sum.jsp");
				res.sendRedirect("template.jsp");
			} else if (act.equals("quecus")) { //
				String cname = req.getParameter("cname");
				String status = req.getParameter("status");

				session.setAttribute("content_page", "query_cus.jsp");
				session.setAttribute("cname", cname);
				session.setAttribute("status", status);
				res.sendRedirect("template.jsp");
			} else if (act.equals("queveh")) { //
				session.setAttribute("content_page", "query_vehi.jsp");
				res.sendRedirect("template.jsp");
			} else if (act.equals("quedrv")) { //
				session.setAttribute("content_page", "query_drv.jsp");
				res.sendRedirect("template.jsp");
			} else if (act.equals("rDel")) { // rDel
				int rid = Integer.parseInt(req.getParameter("rid"));
				String sql = "DELETE FROM repair where id=" + rid;
				DBConnect.updateQuery(sql);
				session.setAttribute("content_page", "viewAllRepair.jsp");
				res.sendRedirect("template.jsp");
			} else if (act.equals("dDel")) { // rDel
				String did = req.getParameter("did");
				System.out.println(did);
				String sql = "UPDATE employees SET status = 'D' where emp_id= '" + did + "'";
				System.out.println(sql);
				DBConnect.updateQuery(sql);
				session.setAttribute("content_page", "viewAllDrivers.jsp");
				res.sendRedirect("template.jsp");
			} else if (act.equals("dExp")) { // rDel
				int did = Integer.parseInt(req.getParameter("did"));
				// String sql = "Select * where emp_id="+did;
				// DBConnect.updateQuery(sql);
				session.setAttribute("content_page", "viewAllDrivers.jsp");
				res.sendRedirect("template.jsp");
			} else if (act.equals("vDel")) { // rDel
				String vid = req.getParameter("vid");
				String sql = "UPDATE vmast SET status ='D' where v_no='" + vid + "'";
				DBConnect.updateQuery(sql);
				session.setAttribute("content_page", "viewAllVehicles.jsp");
				res.sendRedirect("template.jsp");
			} else if (act.equals("oDel")) { // rDel
				int oid = Integer.parseInt(req.getParameter("oid"));
				String sql = "DELETE FROM oil_detail where id=" + oid;
				DBConnect.updateQuery(sql);
				session.setAttribute("content_page", "viewOilChanges.jsp");
				res.sendRedirect("template.jsp");
			} else if (act.equals("fDel")) { // rDel
				int fid = Integer.parseInt(req.getParameter("fid"));
				String sql = "DELETE FROM fuel_details where fid=" + fid;
				DBConnect.updateQuery(sql);
				session.setAttribute("content_page", "viewFuelExpences.jsp");
				res.sendRedirect("template.jsp");
			} else if (act.equals("ViewRepair")) {
				session.setAttribute("content_page", "viewAllRepair.jsp");
				res.sendRedirect("template.jsp");
			} else if (act.equals("editVehicle")) {
				String vId = req.getParameter("vId");
				session.setAttribute("vid", vId);
				session.setAttribute("content_page", "editVehicle.jsp");
				res.sendRedirect("template.jsp");
			} else if (act.equals("editInsure")) {
				String vId = req.getParameter("vId");
				session.setAttribute("vid", vId);
				session.setAttribute("content_page", "insurance.jsp");
				res.sendRedirect("template.jsp");
			} else if (act.equals("editBook")) {
				String bid = req.getParameter("bid");
				session.setAttribute("bid", bid);
				session.setAttribute("content_page", "editBooking.jsp");
				res.sendRedirect("template.jsp");
			} else if (act.equals("ViewBook")) {
				session.setAttribute("content_page", "viewAllbooking.jsp");
				res.sendRedirect("template.jsp");

			} else if (act.equals("ViewRep")) {
				session.setAttribute("content_page", "reportsMain.jsp");
				res.sendRedirect("templateRep.jsp");

			} else if (act.equals("prtRep")) {
				String fdate = req.getParameter("fdate");
				session.setAttribute("fdate", fdate);
				String tdate = req.getParameter("tdate");
				session.setAttribute("tdate", tdate);
				String rept = req.getParameter("rept");

				session.setAttribute("content_page", rept + ".jsp");
				res.sendRedirect("template.jsp");

				// System.out.println("I m Here");
				// res.sendRedirect("customerrpt.jsp");
				// session.setAttribute("fdate",fdate);
				// session.setAttribute("tdate",tdate);

			} else if (act.equals("Admin")) {
				session.setAttribute("content_page", "content.jsp");
				res.sendRedirect("template.jsp");

			} else if (act.equals("AddEMP")) {
				String sql = "SELECT empno FROM number_gen";
				String Str_empNo = "00000";
				System.out.println(sql);
				Connection c = null;
				try {
					c = DBConnect.prepareConn();
					Statement st = c.createStatement();
					ResultSet rs = st.executeQuery(sql);
					if (rs.next() == true) {
						Integer Int_empNo = rs.getInt(1);
						Int_empNo = Int_empNo + 1;
						Str_empNo = String.format("%0" + 4 + "d", Int_empNo);
						System.out.println("Using String.format: " + Str_empNo);
						String sql_gen = " UPDATE number_gen set empno = " + Int_empNo;
						DBConnect.updateQuery(sql_gen);
					}
					c.close();
				} catch (Exception ex) {
					System.out.println(ex);
				}

				String ECat = req.getParameter("Ecateg");
				String FirstName = req.getParameter("FirstName");
				System.out.println("FirstName : " + FirstName);
				String LastName = req.getParameter("LastName");
				String UserName = req.getParameter("UName");
				String Address1 = req.getParameter("AddLine1");
				String Address2 = req.getParameter("AddLine2");
				String City = req.getParameter("City");
				String MobileNo = req.getParameter("MobileNo");
				String LicenseNo = req.getParameter("LicenseNo");
				String doe = req.getParameter("doe");
				String p1 = req.getParameter("Experience");
				System.out.println("P1 : " + p1);
				int Experience = Integer.parseInt(p1);
				System.out.println(Experience);
				String Note = req.getParameter("Note");

				Str_empNo = ECat.charAt(0) + Str_empNo;

				String sql_emp = "INSERT INTO employees (emp_id, emp_code, emp_fname, emp_lname, emp_add1, emp_add2, "
						+ "emp_city, emp_mob, emp_licno, emp_licexp, emp_exp, emp_notes, status,e_adddate,e_chgdate)"
						+ " VALUES('" + Str_empNo + "','" + ECat + "','" + FirstName + "','" + LastName + "','"
						+ Address1 + "'," + "'" + Address2 + "','" + City + "','" + MobileNo + "','" + LicenseNo + "','"
						+ doe + "'," + Experience + ",'" + Note + "','A',NOW(),'')";

				String sql_usr = "INSERT INTO admin_users (emp_id, uname, upass, ucateg, usr_add, usr_chg, ulogged)"
						+ " VALUES('" + Str_empNo + "','" + UserName + "','123', '" + ECat + "', NOW(),'','N')";

				System.out.println(sql_emp);
				System.out.println(sql_usr);
				int upd_emp = DBConnect.updateQuery(sql_emp);
				int upd_usr = DBConnect.updateQuery(sql_usr);
				if (upd_emp == 1 && upd_usr == 1) {
					session.setAttribute("content_page", "successDriver.jsp");
				} else {
					session.setAttribute("content_page", "failDriver.jsp");
				}
				res.sendRedirect("template.jsp");

			} else if (act.equals("AddDRV")) {

				String sql_emp = "SELECT empno FROM number_gen";
				String Str_empNo = "00000";
				System.out.println(sql_emp);
				Connection c = null;
				try {
					c = DBConnect.prepareConn();
					Statement st = c.createStatement();
					ResultSet rs = st.executeQuery(sql_emp);
					if (rs.next() == true) {
						Integer Int_empNo = rs.getInt(1);
						Int_empNo = Int_empNo + 1;
						Str_empNo = String.format("%0" + 4 + "d", Int_empNo);
						System.out.println("Using String.format: " + Str_empNo);
						String sql_gen = " UPDATE number_gen set empno = " + Int_empNo;
						DBConnect.updateQuery(sql_gen);
					}
					c.close();
				} catch (Exception ex) {
					System.out.println(ex);
				}

				String FirstName = req.getParameter("FirstName");
				System.out.println("FirstName : " + FirstName);
				String LastName = req.getParameter("LastName");
				String Address1 = req.getParameter("AddLine1");
				String Address2 = req.getParameter("AddLine2");
				String City = req.getParameter("City");
				String MobileNo = req.getParameter("MobileNo");
				String LicenseNo = req.getParameter("LicenseNo");
				String doe = req.getParameter("doe");
				String p1 = req.getParameter("Experience");
				System.out.println("P1 : " + p1);
				int Experience = Integer.parseInt(p1);
				System.out.println(Experience);
				String Note = req.getParameter("Note");

				String ECat = "DRIVER";
				String empNo = "D" + Str_empNo;

				String sql = "INSERT INTO employees (emp_id, emp_code, emp_fname, emp_lname, emp_add1, emp_add2, "
						+ "emp_city, emp_mob, emp_licno, emp_licexp, emp_exp, emp_notes, status,e_adddate,e_chgdate)"
						+ " VALUES('" + empNo + "','" + ECat + "','" + FirstName + "','" + LastName + "','" + Address1
						+ "'," + "'" + Address2 + "','" + City + "','" + MobileNo + "','" + LicenseNo + "','" + doe
						+ "'," + Experience + ",'" + Note + "','A',NOW(),'')";

				System.out.println(sql);
				int update = DBConnect.updateQuery(sql);
				if (update == 1) {
					session.setAttribute("content_page", "successDriver.jsp");
				} else {
					session.setAttribute("content_page", "failDriver.jsp");
				}
				res.sendRedirect("template.jsp");
			} else if (act.equals("AddDriver")) {

				String FirstName = req.getParameter("FirstName");
				System.out.println("FirstName : " + FirstName);
				String LastName = req.getParameter("LastName");
				String Address = req.getParameter("Address");
				String Image = "No";// req.getParameter("Image");
				String City = req.getParameter("City");
				String State = req.getParameter("State");
				String MobileNo = req.getParameter("MobileNo");
				String LicenseNo = req.getParameter("LicenseNo");
				String p1 = req.getParameter("Experiance");
				System.out.println("P1 : " + p1);
				int Experiance = Integer.parseInt(p1);
				System.out.println(Experiance);
				String Note = req.getParameter("Note");
				String doe = req.getParameter("doe");
				// String dImage = file;

				// dImage = "drivers/"+dImage;
				String sql = "INSERT INTO driver (name, l_name, address, image, city, state, mob, lic_no, exp, experiance, note)"
						+ " VALUES('" + FirstName + "','" + LastName + "','" + Address + "','" + Image + "','" + City
						+ "','" + State + "','" + MobileNo + "','" + LicenseNo + "','" + doe + "'," + Experiance + ",'"
						+ Note + "')";
				System.out.println(sql);
				int update = DBConnect.updateQuery(sql);
				if (update == 1) {
					session.setAttribute("content_page", "successDriver.jsp");
				} else {
					session.setAttribute("content_page", "failDriver.jsp");
				}
				res.sendRedirect("template.jsp");
			} else if (act.equals("AddFuel")) {
				String VehicleName = req.getParameter("VehicleName");
				String DriverName = req.getParameter("DriverName");
				String fdate = req.getParameter("fdate");
				String ftype = req.getParameter("ftype");
				String Quantity = req.getParameter("Quantity");
				String Cost = req.getParameter("Cost");
				String Note = req.getParameter("Note");
				String sql = "INSERT INTO fuel_details (v_name, d_name, date, f_type, qty, cost, note) " + "VALUES('"
						+ VehicleName + "','" + DriverName + "','" + fdate + "','" + ftype + "','" + Quantity + "',"
						+ Cost + ",'" + Note + "')";
				// System.out.println (sql);
				int update = DBConnect.updateQuery(sql);
				if (update == 1) {
					session.setAttribute("content_page", "successFuel.jsp");
				} else {
					session.setAttribute("content_page", "fail.jsp");
				}
				res.sendRedirect("template.jsp");
			} else if (act.equals("AddOil")) {
				String VehicleName = req.getParameter("VehicleName");
				String DriverName = req.getParameter("DriverName");
				String doe = req.getParameter("doe");
				String otype = req.getParameter("otype");
				String Odometer = req.getParameter("Odometer");
				int Cost = Integer.parseInt(req.getParameter("Cost"));
				String Note = req.getParameter("Note");
				String sql = "INSERT INTO oil_detail (v_name, d_name, date, cost, o_type, odometer, note) " + "VALUES('"
						+ VehicleName + "','" + DriverName + "','" + doe + "'," + Cost + ",'" + otype + "','" + Odometer
						+ "','" + Note + "')";
				// System.out.println (sql);
				int update = DBConnect.updateQuery(sql);
				if (update == 1) {
					session.setAttribute("content_page", "successOil.jsp");
				} else {
					session.setAttribute("content_page", "fail.jsp");
				}
				res.sendRedirect("template.jsp");
			} else if (act.equals("AddRepair")) {
				String VehicleName = req.getParameter("VehicleName");
				String DriverName = req.getParameter("DriverName");
				String doe = req.getParameter("doe");
				String GarageName = req.getParameter("GarageName");
				String Odometer = req.getParameter("Odometer");
				int Cost = Integer.parseInt(req.getParameter("Cost"));
				String Note = req.getParameter("Note");
				String sql = "INSERT INTO repair (v_name, g_name, d_name, date, odometer, cost, note) " + "VALUES('"
						+ VehicleName + "','" + GarageName + "','" + DriverName + "','" + doe + "','" + Odometer + "',"
						+ Cost + ",'" + Note + "')";
				// System.out.println (sql);
				int update = DBConnect.updateQuery(sql);
				if (update == 1) {
					session.setAttribute("content_page", "successRepair.jsp");
				} else {
					session.setAttribute("content_page", "fail.jsp");
				}
				res.sendRedirect("template.jsp");
			} else if (act.equals("AddRev")) {
				String VehicleNo = req.getParameter("VehicleName");
				System.out.println(VehicleNo);
				String revNo = req.getParameter("revNo");
				String dol = req.getParameter("doi");
				String dole = req.getParameter("doe");
				int revcost = Integer.parseInt(req.getParameter("revcost"));

				String emino = req.getParameter("emino");
				String doemi = req.getParameter("dot");
				String doexemi = req.getParameter("dote");
				int emicost = Integer.parseInt(req.getParameter("emicost"));

				String upd_rev = "UPDATE vehicle_rev SET rev_stat = 'E', emi_stat = 'E',  WHERE  rev_stat = 'A' AND v_no '"
						+ VehicleNo;
				DBConnect.updateQuery(upd_rev);
				System.out.println(upd_rev);

				String sql = "INSERT INTO vehicle_rev (v_no, rev_no, rev_dos, rev_doe, rev_cost, rev_stat,emi_no, emi_dos, emi_doe, emi_cost, emi_stat) "
						+ "VALUES('" + VehicleNo + "','" + revNo + "','" + dol + "','" + dole + "','" + revcost
						+ "','A'," + emino + ",'" + doemi + "','" + doexemi + "'," + emicost + "','A')";
				System.out.println(sql);
				int update = DBConnect.updateQuery(sql);
				if (update == 1) {
					session.setAttribute("content_page", "successRepair.jsp");
				} else {
					session.setAttribute("content_page", "fail.jsp");
				}
				res.sendRedirect("template.jsp");
			} else if (act.equals("AddVehicle")) {
				// add image code...
				MultipartFormDataRequest mreq = null;
				Hashtable ht = null;
				String file = "";
				UploadFile uFile = null;
				try {
					mreq = new MultipartFormDataRequest(req);
					ht = mreq.getFiles();
					uFile = (UploadFile) ht.get("Image");
					UploadBean upBean = new UploadBean();
					upBean.setFolderstore(req.getRealPath("cars"));
					upBean.store(mreq, "Image");
					file = uFile.getFileName();
					System.out.println("File : " + file);
				} catch (Exception ex) {
					System.out.println(ex);
				}

				String VehicleNo = mreq.getParameter("VehicleNo");
				String VehicleName = mreq.getParameter("VehicleName");
				String Make = mreq.getParameter("Make");
				String ftype = mreq.getParameter("ftype");
				double Cost = Double.parseDouble(mreq.getParameter("Cost"));
				// String cImage = mreq.getParameter("Image");
				String vtype = mreq.getParameter("vtype");
				int noofseats = Integer.parseInt(mreq.getParameter("NoofSeat"));
				int payload = Integer.parseInt(mreq.getParameter("Payload"));
				String dname = mreq.getParameter("dname");

				String InsuranceID = mreq.getParameter("InsuranceID");
				String InsurerName = mreq.getParameter("InsurerName");
				String CompanyName = mreq.getParameter("CompanyName");
				String doi = mreq.getParameter("doi");
				String doe = mreq.getParameter("doe");
				String status = mreq.getParameter("status");
				String description = mreq.getParameter("v_desc");
				double insval = Double.parseDouble(mreq.getParameter("insval"));

				String cImage = file;
				cImage = "image/" + cImage;
				String sql = "INSERT INTO vmast (v_no, v_name, v_make, v_fueltype,v_cost, v_image, v_type, v_noofSeat, v_payload, v_driver,status,veh_desc)"
						+ "VALUES('" + VehicleNo + "','" + VehicleName + "','" + Make + "','" + ftype + "'," + Cost
						+ ",'" + cImage + "','" + vtype + "','" + noofseats + "','" + payload + "','" + dname + "','"
						+ status + "','" + description + "')";
				// String upd_ins ="UPDATE veh_insurance SET ins_status = 'E' WHERE ins_status =
				// 'A' AND v_no '"+VehicleNo;
				// DBConnect.updateQuery(upd_ins);

				String sql_ins = "INSERT INTO veh_insurance (ins_no, v_no, ins_agtname, ins_company,ins_date, ins_expdate, ins_value, ins_status)"
						+ "VALUES('" + InsuranceID + "','" + VehicleNo + "','" + InsurerName + "','" + CompanyName
						+ "','" + doi + "','" + doe + "','" + insval + "','A')";

				int update = DBConnect.updateQuery(sql);
				int update_ins = DBConnect.updateQuery(sql_ins);
				if (update == 1 && update_ins == 1) {
					session.setAttribute("content_page", "successVehicle.jsp");
				} else {
					session.setAttribute("content_page", "fail.jsp");
				}
				res.sendRedirect("template.jsp");
			}
		} // if
		else if (mod.equals("BOK")) { // *******************************
			if (act.equals("View")) { //
				session.setAttribute("content_page", "view.jsp");
				session.setAttribute("view", req.getParameter("v"));
				res.sendRedirect("index.jsp");
			} else if (act.equals("Home")) { //
				session.setAttribute("content_page", "ucontent.jsp");
				res.sendRedirect("index.jsp");
			} else if (act.equals("bok")) { //
				String vid = req.getParameter("vid");
				String uname = (String) session.getAttribute("u_name");
				if (uname != null) {
					session.setAttribute("content_page", "bokVehicle.jsp");
					session.setAttribute("vid", vid);
					System.out.println(vid);
				} else {
					session.setAttribute("content_page", "uLogin.jsp");
				}
				res.sendRedirect("index.jsp");
			} else if (act.equals("bMove")) { //

				String uname = (String) session.getAttribute("u_name");
				if (uname != null) {
					session.setAttribute("content_page", "mkBok.jsp");
				} else {
					session.setAttribute("content_page", "uLogin.jsp");
				}
				res.sendRedirect("indexloc.jsp");
			} else if (act.equals("locate")) { //
				String akey = req.getParameter("api_key");
				session.setAttribute("content_page", "mylocat.jsp");
				session.setAttribute("api_key", akey);
				res.sendRedirect("index.jsp");
			} else if (act.equals("trip")) { //
				String StLoc = req.getParameter("StLoc");
				String DesLoc = req.getParameter("DesLoc");

				session.setAttribute("content_page", "trackMove.jsp");
				session.setAttribute("StLoc", StLoc);
				session.setAttribute("DesLoc", DesLoc);
				res.sendRedirect("index.jsp");
			} else if (act.equals("tripBook")) { //
				String StLoc = req.getParameter("StLoc");
				String DesLoc = req.getParameter("DesLoc");

				session.setAttribute("content_page", "trackMove.jsp");
				session.setAttribute("StLoc", StLoc);
				session.setAttribute("DesLoc", DesLoc);
				res.sendRedirect("index.jsp");

			} else if (act.equals("backBook")) { //
				String StLoc = req.getParameter("StLoc");
				String DesLoc = req.getParameter("DesLoc");
				session.setAttribute("content_page", "mkBok.jsp");
				session.setAttribute("StLoc", StLoc);
				session.setAttribute("DesLoc", DesLoc);
				res.sendRedirect("index.jsp");
			} else if (act.equals("Logout")) { //
				session.removeAttribute("u_id");
				session.removeAttribute("u_name");
				session.setAttribute("content_page", "ucontent.jsp");
				res.sendRedirect("index.jsp");
			} else if (act.equals("DisVeh")) { //
				session.setAttribute("content_page", "mkBok.jsp");
				res.sendRedirect("index.jsp");
			} else if (act.equals("CCal")) { //
				session.setAttribute("content_page", "CostCal.jsp");
				res.sendRedirect("index.jsp");
			} else if (act.equals("contact")) { //
				session.setAttribute("content_page", "contacts.jsp");
				res.sendRedirect("index.jsp");
			} else if (act.equals("About")) { //
				session.setAttribute("content_page", "about.jsp");
				res.sendRedirect("index.jsp");
			} else if (act.equals("Rates")) { //
				session.setAttribute("content_page", "rates.jsp");
				res.sendRedirect("index.jsp");
			} else if (act.equals("OurServ")) { //
				session.setAttribute("content_page", "ourServe.jsp");
				res.sendRedirect("index.jsp");
			} else if (act.equals("Reg")) { //
				session.setAttribute("content_page", "Register.jsp");
				res.sendRedirect("index.jsp");
			} else if (act.equals("bokUser")) { //
				String statbox = req.getParameter("statbox");
				session.setAttribute("content_page", "bokUser.jsp");

				session.setAttribute("statbox", statbox);
				res.sendRedirect("index.jsp");
			}

			else if (act.equals("Login")) { //
				session.setAttribute("content_page", "uLogin.jsp");
				res.sendRedirect("index.jsp");

			} else if (act.equals("doBok")) { //

				String uname = (String) session.getAttribute("u_name");
				Connection c = null;
				int update = 0;
				String MobileNo = "";

				try {
					c = DBConnect.prepareConn();
					Statement st = c.createStatement();
					String sql_no = "SELECT bookno FROM number_gen";
					String Str_bookNo = "00000000000";
					System.out.println(sql_no);
					ResultSet rs = st.executeQuery(sql_no);
					if (rs.next() == true) {
						Integer Int_bookNo = rs.getInt(1);
						Int_bookNo = Int_bookNo + 1;
						Str_bookNo = String.format("%0" + 8 + "d", Int_bookNo);
						System.out.println("Using String.format: " + Str_bookNo);
						String sql_gen = " UPDATE number_gen set bookno = " + Int_bookNo;
						update = DBConnect.updateQuery(sql_gen);

						Str_bookNo = "RENT" + Str_bookNo;
						String sql_mob = "SELECT cust_mobile FROM Customers where cust_uname ='" + uname + "'";
						System.out.println(sql_mob);

						ResultSet rs_mob = st.executeQuery(sql_mob);
						if (rs_mob.next() == true) {
							MobileNo = (rs_mob.getInt(1) + "");
							System.out.println(MobileNo);

							String sdate = req.getParameter("sdate");
							String edate = req.getParameter("edate");
							String vname = (String) session.getAttribute("vid");
							// String vname = req.getParameter("v_name");
							int NoOfDays = 0;
							String KiloMeters = req.getParameter("KiloMeters");

							String sql = "INSERT INTO bookings (book_id, cust_uname, v_name, d_name, sdate, edate, nod, km, status, book_date, start_loc, end_loc,book_chag) "
									+ " VALUES ('" + Str_bookNo + "','" + uname + "','" + vname + "','','" + sdate
									+ "','" + edate + "'," + NoOfDays + ",'" + KiloMeters + "','P',NOW(),'','','0')";
							System.out.println(sql);
							update = DBConnect.updateQuery(sql);
							if (update == 1) {
								sendsms.smsmain(MobileNo, Str_bookNo, "RBok");
								session.setAttribute("content_page", "bokSuccess.jsp");
							} else {
								session.setAttribute("content_page", "bokFail.jsp");
							}
							res.sendRedirect("index.jsp");
						}
					}
					c.close();
				} catch (Exception ex) {
					System.out.println(ex);
				}

			} else if (act.equals("doMoveBk")) {// BOOKING FOR MOVEMENTS

				String uname = (String) session.getAttribute("u_name");
				String StartDt = req.getParameter("sdate");
				String sql_cnt = "SELECT count(*) FROM bookings where status != 'C' and sdate ='" + StartDt + "'";
				System.out.println(sql_cnt + "Hello");
				Connection c = null;
				int update = 0;
				String MobileNo = "";
				String bk_Stat = "P";
				try {
					c = DBConnect.prepareConn();
					Statement st = c.createStatement();
					ResultSet rs_c = st.executeQuery(sql_cnt);
					if (rs_c.next() == true) {
						Integer Int_cnt = rs_c.getInt(1);
						System.out.println(Int_cnt + "Count");
						if (Int_cnt <= 4) {
							bk_Stat = "P";
						}
						String sql_no = "SELECT bookno FROM number_gen";
						String Str_bookNo = "00000000000";
						System.out.println(sql_no);
						ResultSet rs = st.executeQuery(sql_no);
						if (rs.next() == true) {
							Integer Int_bookNo = rs.getInt(1);
							Int_bookNo = Int_bookNo + 1;
							Str_bookNo = String.format("%0" + 8 + "d", Int_bookNo);
							System.out.println("Using String.format: " + Str_bookNo);
							String sql_gen = " UPDATE number_gen set bookno = " + Int_bookNo;
							update = DBConnect.updateQuery(sql_gen);

							Str_bookNo = "MOVE" + Str_bookNo;

							String sql_mob = "SELECT cust_mobile FROM Customers where cust_uname ='" + uname + "'";
							System.out.println(sql_mob);

							ResultSet rs_mob = st.executeQuery(sql_mob);
							if (rs_mob.next() == true) {
								MobileNo = (rs_mob.getInt(1) + "");
								System.out.println(MobileNo);

								String sdate = req.getParameter("sdate");
								String stime = req.getParameter("stime");
								String StLoc = req.getParameter("StLoc");
								String DestLoc = req.getParameter("DestLoc");

								String sql = "INSERT INTO bookings (book_id, cust_uname, v_name, d_name, sdate, edate, nod, km, status, book_date, start_loc, end_loc,book_chag) "
										+ " VALUES ('" + Str_bookNo + "','" + uname + "','','','" + sdate + "','"
										+ stime + "','0','0','" + bk_Stat + "',NOW(),'" + StLoc + "','" + DestLoc
										+ "','0')";
								System.out.println(sql);
								update = DBConnect.updateQuery(sql);
							}
							if (update == 1) {
								if (bk_Stat == "P") {
									sendsms.smsmain(MobileNo, Str_bookNo, "ABok");
									session.setAttribute("content_page", "bokSuccess.jsp");
								} else {
									sendsms.smsmain(MobileNo, Str_bookNo, "PBok");
									session.setAttribute("content_page", "bokPending.jsp");
								}

							} else {
								session.setAttribute("content_page", "bokFail.jsp");
							}
							res.sendRedirect("index.jsp");
						}
					}
					c.close();
				} catch (Exception ex) {
					System.out.println(ex);
				}
			} else if (act.equals("uEdit")) {
				session.setAttribute("content_page", "uEdit.jsp");
				res.sendRedirect("index.jsp");

			} else if (act.equals("EditVeh")) { // EDIT Vehicle INFORMATION
				String vid = req.getParameter("vid");
				String vname = req.getParameter("v_name");
				String make = req.getParameter("make");
				String fuel = req.getParameter("fuel");
				String vtype = req.getParameter("v_type");
				String dname = req.getParameter("dname");
				String status = req.getParameter("status");
				String vdesc = req.getParameter("v_desc");
				String sql = "UPDATE  vmast SET v_name='" + vname + "', v_make='" + make + "', v_fuelType='" + fuel
						+ "', v_type='" + vtype + "', v_driver='" + dname + "'," + " status='" + status + "',veh_desc='"
						+ vdesc + "'" + " WHERE v_no='" + vid + "'";
				System.out.println(sql);
				int up = DBConnect.updateQuery(sql);
				if (up == 1) {
					session.setAttribute("content_page", "successOil.jsp");
				} else {
					session.setAttribute("content_page", "failDriver.jsp");
				}
				res.sendRedirect("template.jsp");

			} else if (act.equals("EditIns")) { // EDIT Vehicle INFORMATION
				String vid = req.getParameter("vid");
				String ino = req.getParameter("ino");
				String agt = req.getParameter("agt_name");
				String cname = req.getParameter("c_name");
				String sdate = req.getParameter("sdate");
				String edate = req.getParameter("edate");
				String insval = req.getParameter("insval");
				String sql = "UPDATE  veh_insurance SET ins_no='" + ino + "', ins_agtname='" + agt + "', ins_company='"
						+ cname + "', ins_date='" + sdate + "', ins_expdate='" + edate + "'," + " ins_value=" + insval
						+ " WHERE v_no='" + vid + "'";
				System.out.println(sql);
				int up = DBConnect.updateQuery(sql);
				if (up == 1) {
					session.setAttribute("content_page", "successOil.jsp");
				} else {
					session.setAttribute("content_page", "failDriver.jsp");
				}
				res.sendRedirect("template.jsp");

			} else if (act.equals("makebook")) {
				String bid = req.getParameter("bid");
				String vname = req.getParameter("vname");
				String dname = req.getParameter("dname");
				String stat = req.getParameter("action");
				double distance = Double.parseDouble(req.getParameter("distance"));
				double charge = Double.parseDouble(req.getParameter("charge"));
				String sql = "UPDATE bookings SET status = '" + stat + "', v_name = '" + vname + "', d_name = '" + dname
						+ "', km = '" + distance + "', book_chag = '" + charge + "' WHERE book_id = '" + bid + "'";
				System.out.println(sql);

				int up = DBConnect.updateQuery(sql);
				if (up == 1) {
					session.setAttribute("content_page", "successOil.jsp");
				} else {
					session.setAttribute("content_page", "failDriver.jsp");
				}
				res.sendRedirect("template.jsp");

			} else if (act.equals("doEdit")) { // EDIT CUSTOMER INFORMATION
				String uid = (String) session.getAttribute("u_id");
				String cusname = req.getParameter("Custname");
				String uname = req.getParameter("Username");
				String upass = req.getParameter("Password");
				String add1 = req.getParameter("Address");
				String add2 = req.getParameter("City");
				String city = req.getParameter("District");
				String c_sex = req.getParameter("CustSex");
				String mob = req.getParameter("Mobile");
				String email = req.getParameter("Email");
				String sql = "UPDATE  Customers SET cust_name='" + cusname + "', cust_uname='" + uname
						+ "', cust_upass='" + upass + "', cust_add1='" + add1 + "', cust_add2='" + add2 + "',"
						+ " cust_city='" + city + "',cust_sex='" + c_sex + "', cust_mobile='" + mob + "', cust_email='"
						+ email + "',cust_chgdate='NOW()'" + " WHERE cust_id='" + uid + "'";
				System.out.println(sql);
				int up = DBConnect.updateQuery(sql);
				if (up == 1) {
					session.setAttribute("content_page", "uEditSuccess.jsp");
				} else {
					session.setAttribute("content_page", "uEditFail.jsp");
				}
				res.sendRedirect("index.jsp");
//			}
//                        else if(act.equals("CurLoc")){
//				session.setAttribute("content_page","CurLoc.jsp");
//				res.sendRedirect("index.jsp");
			} else if (act.equals("doReg")) { // CUSTOMER REGISTRATION

				String sql_no = "SELECT custno FROM number_gen";
				String Str_custNo = "00000";
				System.out.println(sql_no);
				Connection c = null;
				try {
					c = DBConnect.prepareConn();
					Statement st = c.createStatement();
					ResultSet rs = st.executeQuery(sql_no);
					if (rs.next() == true) {
						Integer Int_custNo = rs.getInt(1);
						Int_custNo = Int_custNo + 1;
						Str_custNo = String.format("%0" + 7 + "d", Int_custNo);
						System.out.println("Using String.format: " + Str_custNo);
						String sql_gen = " UPDATE number_gen set custno = " + Int_custNo;
						DBConnect.updateQuery(sql_gen);
					}
					c.close();
				} catch (Exception ex) {
					System.out.println(ex);
				}
				Str_custNo = "U" + Str_custNo;

				String Custname = req.getParameter("Custname");
				String Username = req.getParameter("Username");
				String Password = req.getParameter("Password");
				String Address1 = req.getParameter("Address1");
				String Address2 = req.getParameter("Address2");
				String City = req.getParameter("City");
				String CustSex = req.getParameter("CustSex");
				String CustGroup = req.getParameter("CustGroup");
				String MobileNo = req.getParameter("MobileNo");
				String Email = req.getParameter("Email");
				String sql = "INSERT INTO Customers (cust_id, cust_name, cust_uname, cust_upass, cust_add1, cust_add2, cust_city,cust_sex,cust_group,cust_mobile,cust_email,"
						+ "cust_status,cust_adddate,cust_chgdate)" + " VALUES ('" + Str_custNo + "','" + Custname
						+ "','" + Username + "','" + Password + "','" + Address1 + "','" + Address2 + "'," + "'" + City
						+ "','" + CustSex + "','" + CustGroup + "','" + MobileNo + "','" + Email + "', 'A',NOW(),'')";
				System.out.println(sql);
				int i = DBConnect.updateQuery(sql);
				if (i == 1) {
					sendsms.smsmain(MobileNo, Username, "Reg"); // SMS to Registered User
					session.setAttribute("content_page", "regSuccess.jsp");
				} else {
					session.setAttribute("content_page", "regFail.jsp");
				}
				res.sendRedirect("index.jsp");

			} else if (act.equals("doLog")) { // CUSTOMER LOGIN
				String Username = req.getParameter("Username");
				String Password = req.getParameter("Password");
				String sql = "SELECT cust_id, cust_uname FROM customers WHERE cust_uname='" + Username
						+ "' AND cust_upass='" + Password + "'";
				System.out.println(sql);
				Connection c = null;
				try {
					c = DBConnect.prepareConn();
					Statement st = c.createStatement();
					ResultSet rs = st.executeQuery(sql);
					if (rs.next() == true) {
						session.setAttribute("u_id", "" + rs.getString(1));
						session.setAttribute("u_name", rs.getString(2));

						session.setAttribute("content_page", "ucontent.jsp");
						res.sendRedirect("index.jsp");
						System.out.println("I Tried");
					} else {
						session.setAttribute("content_page", "logFail.jsp");
						res.sendRedirect("index.jsp");
					}
					c.close();
				} catch (Exception ex) {
					System.out.println(ex);
					System.out.println("I Failed");
				}
			} // if
		} // else if
	}// doGet
}// class
