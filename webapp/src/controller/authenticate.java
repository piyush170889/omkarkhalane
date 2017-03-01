package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utilities.CommonUtilities;
import dao.Connection_Provider;

/**
 * Servlet implementation class authenticate
 */
@WebServlet("/authenticate")
public class authenticate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private HttpSession session;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public authenticate() {
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
		
		Connection_Provider dao = new Connection_Provider();
		Connection con = dao.getConnection();
		
		try{
			String username = request.getParameter("Username").trim();
			String userpass = request.getParameter("Password").trim();
			PreparedStatement ps = con.prepareStatement("select * from logo where UserID=? and Password=?");
			ps.setString(1, username);
			ps.setString(2, userpass);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
					session = request.getSession(false);
					if(session == null){
						session = request.getSession();
						session.setMaxInactiveInterval(4*60*60);
					}else{						
						session.setMaxInactiveInterval(4*60*60);
					}
					session.setAttribute("username", username);
					session.setAttribute("userType", rs.getString(2));
			
					
					response.sendRedirect("dashboard.jsp?current=dashboard");
			}else{
				CommonUtilities.returnToLogin(response);
			}
		}catch(Exception e){
			out.println(CommonUtilities.showErrorMessage(e));
		}finally{
			try{
				if(con != null)
					con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}

}
