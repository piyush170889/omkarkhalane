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

/**
 * Servlet implementation class DeletePatient
 */
@WebServlet("/DeletePatient")
public class DeletePatient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String Id = request.getParameter("id");
		String requestType = request.getParameter("requesttype");
		String dateOfAppointment = request.getParameter("dateOfAppointment");
		String deleteQuery = null,deleteQuery1 = null;
		//Create Database Connection
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		 if(requestType.equals("OPD")){
			//Check if only single record exists before delete
			try{
				deleteQuery = "delete from omk_db.omk_opd_appointments where opd_id=? and opd_datetime_of_appointment=?";
				
				PreparedStatement ps = con.prepareStatement(deleteQuery);
				ps.setString(1, Id);
				ps.setString(2, dateOfAppointment);
				int result = ps.executeUpdate();
				if(result >= 1){
					out.println("<script type=\"text/javascript\">alert('"+Id+" deleted successfully')</script>");
					utilities.CommonUtilities.returnToPatientManagement(response);
				}else{
					throw new Exception("Something went wrong whil;e deleting.. Cannot delete the record");
				}	
			}catch(Exception e){
				try {
					con.rollback();
					if(con != null)
						con.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				e.printStackTrace();
			}finally{
				try {
					con.commit();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			try{	
				deleteQuery1 = "delete from omk_db.omk_book_appointment where opd_id=? and b_datetime_of_appointment=?";
				
				PreparedStatement ps = con.prepareStatement(deleteQuery1);
				ps.setString(1, Id);
				ps.setString(2, dateOfAppointment);
				int result = ps.executeUpdate();
				if(result >= 1){
					out.println("<script type=\"text/javascript\">alert('"+Id+" deleted successfully')</script>");
					utilities.CommonUtilities.returnToPatientManagement(response);
				}else{
					throw new Exception("Something went wrong whil;e deleting.. Cannot delete the record");
				}	
			}catch(Exception e){
				try {
					con.rollback();
					if(con != null)
						con.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				e.printStackTrace();
			}finally{
				try {
					con.commit();
					if(con != null)
						con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			}
		}else if(requestType.equals("IPD")){
			try{
					deleteQuery = "delete from omk_db.omk_ipd_appointments where ipd_id=? and admitted_on_datetime=?";
					
					PreparedStatement ps = con.prepareStatement(deleteQuery);
					ps.setString(1, Id);
					ps.setString(2, dateOfAppointment);
					int result = ps.executeUpdate();
					if(result >= 1){
						out.println("<script type=\"text/javascript\">alert('"+Id+" deleted successfully')</script>");
						utilities.CommonUtilities.returnToPatientManagement(response);
					}else{
						throw new Exception("Something went wrong whil;e deleting.. Cannot delete the record");
					}	
			}catch(Exception e){
				try {
					con.rollback();
					if(con != null)
						con.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				e.printStackTrace();
			}finally{
				try {
					con.commit();
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			try{
			deleteQuery1 = "delete from omk_db.omk_book_appointment where opd_id=? and b_datetime_of_appointment=?";
			PreparedStatement ps = con.prepareStatement(deleteQuery);
			ps.setString(1, Id);
			ps.setString(2, dateOfAppointment);
			int result = ps.executeUpdate();
			if(result >= 1){
				out.println("<script type=\"text/javascript\">alert('"+Id+" deleted successfully')</script>");
				utilities.CommonUtilities.returnToPatientManagement(response);
			}else{
				throw new Exception("Something went wrong whil;e deleting.. Cannot delete the record");
			}	
	}catch(Exception e){
		try {
			con.rollback();
			if(con != null)
				con.close();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		e.printStackTrace();
	}finally{
		try {
			con.commit();
			if(con != null)
				con.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
		}
	}
}
