package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.EmailUtility;
import dao.Connection_Provider;

@WebServlet("/EmailSendingServlet")
public class EmailSendingServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private String host;
	private String port;
	private String user;
	private String pass;

	public void init() {
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		user = context.getInitParameter("user");
		pass = context.getInitParameter("pass");
	}
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		// reads form fields
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String Username = request.getParameter("Username");
		String subject = "Change password";
		HttpSession ss=request.getSession();
		String id=ss.getId();
		ss.setAttribute("key",id);
		String content = "It is Give you only one time change password Link So use only ones \n http://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/changepass.jsp?id1="+id+"&username="+Username;
		String email="";
		String resultMessage = "";
		try{
		PreparedStatement ps = con.prepareStatement("select email from logo where UserID=?  ");
		ps.setString(1, Username);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			email=rs.getString(1);
			EmailUtility.sendEmail(host, port, user, pass, email, subject,content);
			resultMessage = "The e-mail was sent to ur mail adress successfully";
		}else{
			out.println("<script type=\"text/javascript\">alert('Username is incorrect')</script>");
			utilities.CommonUtilities.returnToLogin(response);
		}
		}catch (Exception ex) {
			ex.printStackTrace();
			resultMessage = "There were an error: ";
		} finally {
			out.println("<script type=\"text/javascript\">alert('"+resultMessage+"')</script>");
			utilities.CommonUtilities.returnToLogin(response);
			if(con != null){
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
}