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
 * Servlet implementation class deleteService
 */
@WebServlet("/deleteService")
public class deleteService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteService() {
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
//		String userid = request.getParameter("userid");
		String requestType = request.getParameter("requesttype");
		String deleteQuery = null;
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		if(requestType.equals("service")){
			deleteQuery = "delete from omk_service_details where serviceId=? and service_sr_no<>0";
		}else if(requestType.equals("doctor")){
			deleteQuery = "delete from omk_doctor_details where doc_id=? and doc_srno<>0";
		}else if(requestType.equals("reception")){
			deleteQuery = "delete from omk_reception_details where id=? and reception_srno<>0";
		}else if(requestType.equals("room")){
			deleteQuery = "delete from omk_room where room_id=? and sr_no<>0";
		}
		
		try {
			PreparedStatement ps =con.prepareStatement(deleteQuery);
			ps.setString(1, Id);
			
			int result = ps.executeUpdate();
			
			if(requestType.equals("service") || requestType.equals("doctor") || requestType.equals("room") ){
				if(result==1){
					out.println("<script type=\"text/javascript\">alert('"+Id+" deleted successfully')</script>");
					utilities.CommonUtilities.returnToMaster(response);
				}else{
					throw new Exception("Cannot delete record");
				}
			}else{
				if(result == 1){
					PreparedStatement ps1 =con.prepareStatement("delete from logo where emp_id=? and logo_srno<>0");
					ps1.setString(1, Id);
					
					int result1 = ps1.executeUpdate();
					if(result1 == 1){
						out.println("<script type=\"text/javascript\">alert('"+Id+" deleted successfully')</script>");
						utilities.CommonUtilities.returnToMaster(response);
					}else{
						throw new Exception("Something went wrong while deleting login credentials. Cannot delete the record");
					}
				}else{
					throw new Exception("Something went wrong while deleting reception record. Cannot delete the record");
				}
			}
		}catch(Exception e){
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			out.println(e.getMessage());
		}finally{
			try {
				con.commit();
				if(con != null)
					con.close();
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
