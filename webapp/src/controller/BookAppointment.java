package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Connection_Provider;

/**
 * Servlet implementation class BookAppointment
 */
@WebServlet("/BookAppointment")
public class BookAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookAppointment() {
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
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		//GET Booking Parameters
		String bookingId = request.getParameter("bookingid").trim();
		String f_name = request.getParameter("f_name").trim();
		String m_name = request.getParameter("m_name").trim();
		String l_name = request.getParameter("l_name").trim();
		String contactNo = request.getParameter("patient_contact_no").trim();
		String patient_age = request.getParameter("patient_age").trim();
		
		String patientGender = request.getParameter("patient_gender").trim();
		if(patientGender.equals("--Select--")){
			patientGender="";
		}
		String patient_address = request.getParameter("patient_address").trim();
		String patientOccupation = request.getParameter("patient_occupation").trim();
		String dateOfAppointment  = request.getParameter("date_of_appointment").trim();
		if(dateOfAppointment.equals("")){
			out.print("<script type=\"text/javascript\">alert('Please Enter Date of Appointment ');</script>");
			out.print("<script type=\"text/javascript\">self.location.href='dashboard.jsp?current=dashboard';</script>");
		}
		String dept  = request.getParameter("dept").trim();
		if(dept.equals("--Select--")){
			dept="";
		}
		String c_doc  = request.getParameter("c_doc").trim();
		if(c_doc.equals("--Select--")){
			c_doc="";
		}
//		String baseURI = request.getHeader("referer");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		String curDate = sdf.format(new Date());
		
		//GET Database Connection
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		try{
			
			String checkPatientSql = "select b_opd_id,b_ipd_id,booking_id from omk_book_appointment where patient_contact=? and f_name=?";
			PreparedStatement ps10 = con.prepareStatement(checkPatientSql);
			ps10.setString(1, contactNo);
			ps10.setString(2, f_name);
			
			ResultSet rs = ps10.executeQuery();
			if(rs.next()){
				if((rs.getString(1).equals("Not Registered"))){
					if(!(rs.getString(2).equals("Not Registered")))
						response.sendRedirect("PatientDetails.jsp?id="+rs.getString(2)+"&pd=IPD&isPrsent=prsernt&current=PatientManagement");
				}else{
					response.sendRedirect("PatientDetails.jsp?id="+rs.getString(1)+"&pd=OPD&isPrsent=prsernt&current=PatientManagement");
				}
			}
			
			String sql = "insert into omk_db.omk_book_appointment(booking_id,b_opd_id,b_ipd_id,f_name,patient_contact,patient_age,patient_gender,patient_address,patient_occupation,b_datetime_of_appointment,b_status,booking_date,m_name,l_name,appointment_for,consulting_doctor) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, bookingId);
			ps.setString(2, "Not Registered");
			ps.setString(3, "Not Registered");
			ps.setString(4, f_name);
			ps.setString(13, m_name);
			ps.setString(14, l_name);
			ps.setString(15, dept);
			ps.setString(16, c_doc);
			ps.setString(5, contactNo);
			ps.setString(6, patient_age);
			ps.setString(7, patientGender);
			ps.setString(8, patient_address);
			ps.setString(9, patientOccupation);
			ps.setString(10, dateOfAppointment);
			ps.setString(11, "Not Registered");
			ps.setString(12, curDate);
			
			int result = ps.executeUpdate();
			
			if(result == 1){
				out.println(utilities.CommonUtilities.popUpSuccessMessage());
				utilities.CommonUtilities.returnToDashboard(response);
			}else{
				throw new Exception("Unable to insert data");
			}
		} catch(Exception e){
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			out.println(e.getMessage());
		}finally{
			try {
				con.commit();
				if(con != null){
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	
	}

}
