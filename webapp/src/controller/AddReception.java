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
 * Servlet implementation class AddReception
 */
@WebServlet("/AddReception")
public class AddReception extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddReception() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		String receptionId = request.getParameter("receptionId");
		String receptionName = request.getParameter("receptionName");
		String dateOfJoining = request.getParameter("receptionJoiningDate");
		String receptionAge = request.getParameter("receptionAge");
		String receptionGender = request.getParameter("receptionGender");
		if(receptionGender.equals("--Select--")){
			receptionGender="";
		}
		String receptionContact = request.getParameter("receptionContact");
		String receptionEducation = request.getParameter("receptionEducation");
		String receptionAddress = request.getParameter("receptionAddress");
		String receptionUserName = request.getParameter("receptionUserName");
		String receptionPassword = request.getParameter("receptionPassword");
		String email = request.getParameter("E-mail");
		
		try{
			String sql = "insert into omk_db.omk_reception_details(id,name,dateOfJoining,age,gender,contact,education,address,email) values(?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, receptionId);
			ps.setString(2, receptionName);
			ps.setString(3, dateOfJoining);
			ps.setString(4, receptionAge);
			ps.setString(5, receptionGender);
			ps.setString(6, receptionContact);
			ps.setString(7, receptionEducation);
			ps.setString(8, receptionAddress);
			ps.setString(9, email);
			
			int result = ps.executeUpdate();
			
			if(result == 1){
				PreparedStatement ps1 = con.prepareStatement("insert into omk_db.logo(UserID,UserType,UserLevel,Password,emp_id,email) values(?,?,?,?,?,?)");
				ps1.setString(1, receptionUserName);
				ps1.setString(2, "Reception");
				ps1.setString(3, "3");
				ps1.setString(4, receptionPassword);
				ps1.setString(5, receptionId);
				ps1.setString(6, email);
				
				int result1 = ps1.executeUpdate();
				
				if(result1 == 1){
					out.println("<script type=\"text/javascript\">alert('Reception Added successfully')</script>");
					utilities.CommonUtilities.returnToMaster(response);
				}else{
					throw new Exception("Unable to create login credentials");
				}
			}else{
				throw new Exception("Unable to insert data");
			}
		} catch(Exception e){
			try {
				con.rollback();
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
	}

}
