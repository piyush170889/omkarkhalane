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
 * Servlet implementation class AddRDoctor
 */
@WebServlet("/AddRDoctor")
public class AddRDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRDoctor() {
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
		String doctorName= request.getParameter("RdoctorName").trim();
		String doctorId= request.getParameter("RdoctorId").trim();
		String doctorAge = request.getParameter("RdoctorAge").trim();
		String doctorGender = request.getParameter("RdoctorGender").trim();
		if(doctorGender.equals("--Select--")){
			doctorGender="";
		}
		String doctorContact = request.getParameter("RdoctorContact").trim();
		String doctorEducation = request.getParameter("RdoctorEducation").trim();
		String doctorSpecialization = request.getParameter("RdoctorSpecialization").trim();
//		String doctorConsultingFees = request.getParameter("RdoctorConsultingFees").trim();
		String doctorAddress = request.getParameter("RdoctorAddress").trim();
		
		
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		try{
			String sql = "insert into omk_refernce_doctor(Rd_id,Rd_name,Rd_age,Rd_gender,Rd_address,Rd_contact,education,specialization) values(?,?,?,?,?,?,?,?)";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, doctorId);
			ps.setString(2, doctorName);
			ps.setString(3, doctorAge);
			ps.setString(4, doctorGender);
			ps.setString(5, doctorAddress);
			ps.setString(6, doctorContact);
//			ps.setString(7, doctorConsultingFees);
			ps.setString(7, doctorEducation);
			ps.setString(8, doctorSpecialization);
			
			int result = ps.executeUpdate();
			
			if(result == 1){
					out.println("<script type=\"text/javascript\">alert('Refernce Doctor Added successfully')</script>");
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
