package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Connection_Provider;

@WebServlet("/EditOPDPatient")
public class EditOPDPatient extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		//GET OPD Parameters
		String opdId = request.getParameter("edit_opd_id").trim();
		String f_name = request.getParameter("f_opd_name").trim();
		String m_name = request.getParameter("m_opd_name").trim();
		String l_name = request.getParameter("l_opd_name").trim();
		String contact = request.getParameter("edit_opd_Contact").trim();
		String appointmentFor = request.getParameter("edit_opd_appointment_for");
		String admitdate = request.getParameter("edit_opd_date_of_admit").trim();
		String consultentDoctor = request.getParameter("edit_opd_consulting_doctor").trim();
		String referenceDoctor = request.getParameter("edit_opd_reference_doctor").trim();
		String orgDate = request.getParameter("orgDate");
		
		//GET Database Connection 
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();    
		
		try{			
			PreparedStatement ps = con.prepareStatement("update omk_db.omk_book_appointment set b_opd_id=?,f_name=?,m_name=?,l_name=?,patient_contact=? where b_opd_id=?");
			ps.setString(1, opdId);
			ps.setString(2, f_name);
			ps.setString(3, m_name);
			ps.setString(4, l_name);
			ps.setString(5, contact);
			ps.setString(6, opdId);
			
			
			
			int result = ps.executeUpdate();
			
			if(result == 1){
				PreparedStatement ps1 = con.prepareStatement("update omk_db.omk_opd_appointments set opd_datetime_of_appointment=?,opd_consulting_doctor=?,opd_reference_doctor=?,opd_appointment_for=? where opd_id=? and opd_datetime_of_appointment=? and srno<>0");
				ps1.setString(1, admitdate);
				ps1.setString(2, consultentDoctor);
				ps1.setString(3, referenceDoctor);
				ps1.setString(4, appointmentFor);
				ps1.setString(5, opdId);
				ps1.setString(6, orgDate);
				
			
				int result1 = ps1.executeUpdate();
				
				if(result1 == 1){
					out.println("<script type=\"text/javascript\">alert('"+opdId+" Updated successfully')</script>");
					utilities.CommonUtilities.returnToDashboard(response);
				}else{
					throw new Exception("Cannot Update "+opdId);
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
			e.printStackTrace();
			out.println("<h3 style=\"color:red;text-align:center;\">Something went wrong. Please contact your administrator. <br/>Error message: "+e.getMessage()+"</h3>");
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
