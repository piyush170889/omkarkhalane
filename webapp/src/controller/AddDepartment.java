package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Connection_Provider;

/**
 * Servlet implementation class AddDepartment
 */
@WebServlet("/AddDepartment")
public class AddDepartment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDepartment() {
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
		String dName= request.getParameter("DName").trim();
		String dId= request.getParameter("DId").trim();
		String hod = request.getParameter("hod").trim();
		if(hod.equals("--Select--")){
			hod="";
		}
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		String curDate = sdf.format(new Date());
		
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		try{
			String sql = "insert into omk_db.omk_departments(D_id,D_name,HOD,c_date) values(?,?,?,?)";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dId);
			ps.setString(2, dName);
			ps.setString(3, hod);
			ps.setString(4, curDate);
			
			
			int result = ps.executeUpdate();
			
			if(result == 1){
					out.println("<script type=\"text/javascript\">alert('Department Added successfully')</script>");
					utilities.CommonUtilities.returnToMaster(response);
			}else{
				throw new Exception("Doctor Record Could be added currently. Contact your administrator");
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
