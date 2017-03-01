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
 * Servlet implementation class ChangePass
 */
@WebServlet("/ChangePass")
public class ChangePass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePass() {
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
		// TODO Auto-generated method stub

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		try{
			String username = request.getParameter("Username").trim();
			String newpass1= request.getParameter("NewPassword1").trim();
			PreparedStatement ps = con.prepareStatement("select * from logo where UserID=?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				PreparedStatement pst=con.prepareStatement("update logo set Password=? where UserID=?");
				pst.setString(1, newpass1);
				pst.setString(2, username);
				int result=pst.executeUpdate();
				if(result>0){
					out.println("<script type=\"text/javascript\">alert('Password change successfully')</script>");
					utilities.CommonUtilities.returnToLogin(response);
				}
			}else{
				out.println("<script type=\"text/javascript\">alert('Wrong username')</script>");
				utilities.CommonUtilities.returnToChangePass(response);
			}
		}catch(Exception e){
			try {
				con.rollback();
			}catch (SQLException e1) {
				e1.printStackTrace();
			}
			out.println("<h3 style=\"color:red;text-align:center;\">Something went wrong. Please contact your administrator. </h3>");
			e.printStackTrace();
		}finally{
			try{
				con.commit();
				if(con != null){
					con.close();
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}

}
