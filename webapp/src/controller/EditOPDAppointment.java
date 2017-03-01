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
 * Servlet implementation class EditOPDAppointment
 */
@WebServlet("/EditOPDAppointment")
public class EditOPDAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditOPDAppointment() {
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
		
		//GET OPD Parameters
		String opdId = request.getParameter("edit_opd_id").trim();
		String opdAppointmentFor = request.getParameter("edit_opd_appointment_for").trim();
		if(opdAppointmentFor.equals("--Select--")){
			opdAppointmentFor = "";
		}
		String opdDateOfAppointment = request.getParameter("edit_opd_date_of_appointment").trim();
		String opdConsultingDoctor = request.getParameter("edit_opd_consulting_doctor").trim();
		if(opdConsultingDoctor.equals("--Select--")){
			opdConsultingDoctor = "";
		}
		String opdReferenceDoctor = request.getParameter("edit_opd_reference_doctor").trim();
		if(opdReferenceDoctor.equals("--Select--")){
			opdReferenceDoctor = "";
		}
		String originalDateOfAppointment = request.getParameter("edit_opd_date_of_appointment_org").trim();
		
		//GET Database Connection 
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		try{			
			PreparedStatement ps = con.prepareStatement("update omk_db.omk_opd_appointments set opd_appointment_for=?,opd_datetime_of_appointment=?,opd_consulting_doctor=?,opd_reference_doctor=? where opd_id=? and opd_datetime_of_appointment=?");
			ps.setString(1, opdAppointmentFor);
			ps.setString(2, opdDateOfAppointment);
			ps.setString(3, opdConsultingDoctor);
			ps.setString(4, opdReferenceDoctor);
			ps.setString(5, opdId);
			ps.setString(6, originalDateOfAppointment);
			
			int result = ps.executeUpdate();
			
			if(result == 1){
				ps.close();
				//Check if Appointment is New or Follow Up
				// If New then update booking record else pop-up success message
				PreparedStatement ps1 = con.prepareStatement("select opd_appointment_type from omk_opd_appointments where opd_id=? and opd_datetime_of_appointment=?");
				ps1.setString(1, opdId);
				ps1.setString(2, opdDateOfAppointment);
				
				ResultSet rs1 = ps1.executeQuery();
				rs1.next();
				if(rs1.getString(1).equals("New")){	
					String updateBookingDetails = "update omk_book_appointment set b_datetime_of_appointment=? where b_opd_id=? and b_datetime_of_appointment=? and srno<>0";
					PreparedStatement pst5 = con.prepareStatement(updateBookingDetails);
					pst5.setString(1, opdDateOfAppointment);
					pst5.setString(2, opdId);
					pst5.setString(3, originalDateOfAppointment);
					
					int result1 = pst5.executeUpdate();
					
					if(result1 >=1){			
						out.println("<script type=\"text/javascript\">alert('"+opdId+" Updated successfully')</script>");
						utilities.CommonUtilities.returnToDashboard(response);
					} else{
						throw new Exception("Cannot Update "+opdId);
					}
				} else{
					out.println("<script type=\"text/javascript\">alert('"+opdId+" Updated successfully')</script>");
					utilities.CommonUtilities.returnToDashboard(response);
				}
			}else{
				throw new Exception("Cannot Update "+opdId);
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
