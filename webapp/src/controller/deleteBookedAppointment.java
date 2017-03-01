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
 * Servlet implementation class deleteBookedAppointment
 */
@WebServlet("/deleteBookedAppointment")
public class deleteBookedAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteBookedAppointment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String Id = request.getParameter("id");
		String requestType = request.getParameter("requesttype");
		String dateOfAppointment = request.getParameter("dateOfAppointment");
		String deleteQuery = null;
		boolean isBookingrecordUpdated = false;
		
		//Create Database Connection
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		if(requestType.equals("Booking")){
			deleteQuery = "delete from omk_db.omk_book_appointment where booking_id=? and b_datetime_of_appointment=? and srno<>0";
			isBookingrecordUpdated = true;
		}else if(requestType.equals("OPD")){
			//Check if only single record exists before delete
			String checkQuery = "select count(*) from omk_db.omk_opd_appointments where opd_id=?";
			try{
				PreparedStatement pst11 = con.prepareStatement(checkQuery);
				pst11.setString(1, Id);
				
				ResultSet rs11 = pst11.executeQuery();
				rs11.next();
				int rowCount = rs11.getInt(1);
				
				if(rowCount == 1){
					String updateBookingRecord = "update omk_book_appointment set b_opd_id=?, b_status=? where b_opd_id=? and srno<>0";
					PreparedStatement pst12 = con.prepareStatement(updateBookingRecord);
					pst12.setString(1, "Not Registered");
					pst12.setString(2, "Cancelled For OPD");
					pst12.setString(3, Id);
					
					int result12 = pst12.executeUpdate();
					
					if(result12 >= 1){
						isBookingrecordUpdated = true;
						deleteQuery = "delete from omk_db.omk_opd_appointments where opd_id=? and opd_datetime_of_appointment=? and srno<>0";
					}else{
						throw new Exception("More Than 1 record Exist. Cannot delete OPD Record. Please Contact administrator");
					}
				}else{
					isBookingrecordUpdated = true;
					deleteQuery = "delete from omk_db.omk_opd_appointments where opd_id=? and opd_datetime_of_appointment=? and srno<>0";
				}
			}catch(Exception e){
				try {
					con.rollback();
					if(con != null){
						con.close();
					}
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				out.println(e.getMessage());
			}
		}else if(requestType.equals("IPD")){
			//Check if only single record exists before delete
			String checkQuery = "select count(*) from omk_db.omk_ipd_appointments where ipd_id=?";
			try{
				PreparedStatement pst11 = con.prepareStatement(checkQuery);
				pst11.setString(1, Id);
				
				ResultSet rs11 = pst11.executeQuery();
				rs11.next();
				int rowCount = rs11.getInt(1);
				
				if(rowCount <= 1){
					String updateBookingRecord = "update omk_book_appointment set b_ipd_id=?, b_status=? where b_ipd_id=? and srno<>0";
					PreparedStatement pst12 = con.prepareStatement(updateBookingRecord);
					pst12.setString(1, "Not Registered");
					pst12.setString(2, "Cancelled For IPD");
					pst12.setString(3, Id);
					
					int result12 = pst12.executeUpdate();
					
					if(result12 == 1){
						isBookingrecordUpdated = true;
						deleteQuery = "delete from omk_db.omk_ipd_appointments where ipd_id=? and admitted_on_datetime=? and ipd_srno<>0";
					}else{
						throw new Exception("More Than 1 record Exist. Cannot delete IPD Record. Please Contact administrator");
					}
				}else{
					isBookingrecordUpdated = true;
					deleteQuery = "delete from omk_db.omk_ipd_appointments where ipd_id=? and admitted_on_datetime=? ipd_srno<>0";
				}
			}catch(Exception e){
				try {
					con.rollback();
					if(con != null){
						con.close();
					}
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				out.println(e.getMessage());
			}
		}
		
		try{
			if(isBookingrecordUpdated){
				PreparedStatement ps = con.prepareStatement(deleteQuery);
				ps.setString(1, Id);
				ps.setString(2, dateOfAppointment);
				
				int result = ps.executeUpdate();
				
				if(result == 1){
					out.println("<script type=\"text/javascript\">alert('"+Id+" deleted successfully')</script>");
					utilities.CommonUtilities.returnToDashboard(response);
				}else{
					throw new Exception("Something went wrong whil;e deleting.. Cannot delete the record");
				}
			}else{
				throw new Exception("Something Went wrong.Cannot delete "+Id);
			}
		}catch(Exception e){
			try {
				con.rollback();
				if(con != null){
					con.close();
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
