package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Connection_Provider;

/**
 * Servlet implementation class EditAppointment
 */
@WebServlet("/EditAppointment")
public class EditAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditAppointment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String bookId = request.getParameter("bookingid").trim();
		String m_name = request.getParameter("m_name").trim();
		String l_name = request.getParameter("l_name").trim();
		String f_name = request.getParameter("f_name").trim();
		String bookcontact = request.getParameter("patient_contact_no").trim();
		String bookAge = request.getParameter("patient_age").trim();
		String bookGender = request.getParameter("patient_gender").trim();
		if(bookGender.equals("--Select--")){
			bookGender="";
		}
		String bookAddress = request.getParameter("patient_address").trim();
		String bookOccupation = request.getParameter("patient_occupation").trim();
		String bookDate = request.getParameter("date_of_appointment").trim();
		String dept = request.getParameter("dept").trim();
		if(dept.equals("--Select--")){
			dept="";
		}
		String c_doc = request.getParameter("c_doc").trim();
		if(c_doc.equals("--Select--")){
			c_doc="";
		}
		String orgDate = request.getParameter("reg_original_datetime").trim();
		//GET Database Connection 
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		try{
			PreparedStatement ps = con.prepareStatement("update omk_db.omk_book_appointment set f_name=?,m_name=?,l_name=?, patient_contact=?, patient_age=?, patient_gender=?, patient_address=?, patient_occupation=?, b_datetime_of_appointment=?,appointment_for=?,consulting_doctor=? where booking_id=?");
			ps.setString(1, f_name);
			ps.setString(2, m_name);
			ps.setString(3, l_name);
			ps.setString(4, bookcontact);
			ps.setString(5, bookAge);
			ps.setString(6, bookGender);
			ps.setString(7, bookAddress);
			ps.setString(8, bookOccupation);
			ps.setString(9, bookDate);
			ps.setString(10, dept);
			ps.setString(11, c_doc);
			ps.setString(12, bookId);
			
			int result = ps.executeUpdate();
			
			if(result == 1){
				String checkIfOPDexistsSql = "select b_opd_id from omk_book_appointment where booking_id=?";
				PreparedStatement ps1 = con.prepareStatement(checkIfOPDexistsSql);
				ps1.setString(1, bookId);
				ResultSet rs = ps1.executeQuery();
				rs.next();
				if(rs.getString(1).equals("Not Registered")){
				out.println("<script type=\"text/javascript\">alert('"+bookId+" Updated successfully')</script>");
					utilities.CommonUtilities.returnToDashboard(response);
				}else if(rs.getString(1).substring(0, 2).equals("OP")){
					String updateOPDRecord = "update omk_opd_appointments set opd_datetime_of_appointment=?,opd_appointment_for=?,opd_consulting_doctor=? where opd_id=? and opd_datetime_of_appointment=? and srno<>0";
					PreparedStatement ps2 = con.prepareStatement(updateOPDRecord);
					ps2.setString(1, bookDate);
					ps2.setString(2, dept);
					ps2.setString(3, c_doc);
					ps2.setString(4, rs.getString(1));
					ps2.setString(5, orgDate);
					
					int result2 = ps2.executeUpdate();
					
					if(result2 == 1){
						out.println("<script type=\"text/javascript\">alert('"+bookId+" Updated successfully')</script>");
						utilities.CommonUtilities.returnToDashboard(response);
					}else{
						throw new Exception("OPD Record not Updated.");
					}
				}
			}else{
				throw new Exception();
			}
		}catch(Exception e){
//			out.println(utilities.CommonUtilities.popUpErrorMessage(e));
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			out.println("<h3 style=\"color:red;text-align:center;\">Something went wrong. Please contact your administrator. <br/>Error message: "+e.getMessage()+"</h3>");
			e.printStackTrace();
		}finally{
			try{
				con.commit();
				if(con != null)
					con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}

}
