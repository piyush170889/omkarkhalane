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
 * Servlet implementation class EditServices
 */
@WebServlet("/EditServices")
public class EditServices extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServices() {
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
			String serviceId = request.getParameter("serviceId");
			String serviceName = request.getParameter("serviceName");
			String serviceValue = request.getParameter("servicePrice");
			
			PreparedStatement ps = con.prepareStatement("update omk_service_details set service_name=?, service_price=? where serviceId=? and service_sr_no<>0");
			ps.setString(1, serviceName);
			ps.setString(2, serviceValue);
			ps.setString(3, serviceId);
			
			int result = ps.executeUpdate();
			if(result==1){
				out.println("<script type=\"text/javascript\">alert('"+serviceId+" upadted successfully')</script>");
				utilities.CommonUtilities.returnToMaster(response);
			}else{
				throw new Exception("Cannot edit service record");
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
