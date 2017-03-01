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
 * Servlet implementation class EditReception
 */
@WebServlet("/EditReception")
public class EditReception extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditReception() {
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
		PrintWriter out  = response.getWriter();
		
		//DB Connection
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		try{
			String receptionId = request.getParameter("receptionId").trim();
			String receptionName = request.getParameter("receptionName").trim();
			String receptionAge = request.getParameter("receptionAge").trim();
			String receptionGender = request.getParameter("receptionGender").trim();
			if(receptionGender.equals("--Select--")){
				receptionGender="";
			}
			String receptiondateOfJoining = request.getParameter("receptionJoiningDate").trim();
			String receptionEducation = request.getParameter("receptionEducation").trim();
			String receptionAddress = request.getParameter("receptionAddress").trim();
			String receptionContact = request.getParameter("receptionContact").trim();
			String receptionEmail = request.getParameter("receptionEmail").trim();
			
			PreparedStatement ps = con.prepareStatement("update omk_reception_details set name=?, dateOfJoining=?, age=?, gender=?, contact=?,education=?, address=?, email=? where id=? and reception_srno<>0");
			
			ps.setString(1, receptionName);
			ps.setString(2, receptiondateOfJoining);
			ps.setString(3, receptionAge);
			ps.setString(4, receptionGender);
			ps.setString(5, receptionContact);
			ps.setString(6, receptionEducation);
			ps.setString(7, receptionAddress);
			ps.setString(8, receptionEmail);
			ps.setString(9, receptionId);
			
			
			
			int result = ps.executeUpdate();
			if(result==1){
				PreparedStatement ps1 = con.prepareStatement("update logo set email=? where emp_id=? and logo_srno<>0");
				ps1.setString(1, receptionEmail);
				ps1.setString(2, receptionId);
				
				
				int result1 = ps1.executeUpdate();
				
				if(result1 == 1){
					out.println("<script type=\"text/javascript\">alert('Reception Update successfully')</script>");
					utilities.CommonUtilities.returnToMaster(response);
				}else{
					throw new Exception("Unable to insert data");
				}
			}else{
				throw new Exception("Unable to insert data");
			}
				
				
			
		}catch(Exception e){
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			try {
				con.commit();
				if(con != null)
					con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
