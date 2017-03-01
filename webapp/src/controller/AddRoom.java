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
 * Servlet implementation class AddRoom
 */
@WebServlet("/AddRoom")
public class AddRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRoom() {
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
		
		
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String roomId = request.getParameter("roomId");
		String roomtype = request.getParameter("roomtype");
		String roomperprice = request.getParameter("room_per_price");
		
		try{
			String sql = "insert into omk_db.omk_room(room_id,room_type,room_per_price) values(?,?,?)";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, roomId);
			ps.setString(2, roomtype);
			ps.setString(3, roomperprice);
			
			int result = ps.executeUpdate();
			
			if(result == 1){
					out.println("<script type=\"text/javascript\">alert('Services Added successfully')</script>");
					utilities.CommonUtilities.returnToMaster(response);
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
