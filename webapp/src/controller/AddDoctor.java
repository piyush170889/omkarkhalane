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
 * Servlet implementation class AddDoctor
 */
@WebServlet("/AddDoctor")
public class AddDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDoctor() {
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
		String doctorName= request.getParameter("doctorName").trim();
		String doctorId= request.getParameter("doctorId").trim();
		String doctorAge = request.getParameter("doctorAge").trim();
		String doctorGender = request.getParameter("doctorGender").trim();
		if(doctorGender.equals("--Select--")){
			doctorGender="";
		}
		String doctorContact = request.getParameter("doctorContact").trim();
		String doctorEducation = request.getParameter("doctorEducation").trim();
		String doctorSpecialization = request.getParameter("doctorSpecialization").trim();
		String doctorConsultingFees = request.getParameter("doctorConsultingFees").trim();
		String doctorAddress = request.getParameter("doctorAddress").trim();
		String medicalRegNo = request.getParameter("med_reg_no");
		
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		try{
			String sql = "insert into omk_db.omk_doctor_details(doc_id,doc_name,doc_age,doc_gender,doc_address,doc_contact,doc_consulting_fees,education,specialization,med_reg_no) values(?,?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, doctorId);
			ps.setString(2, doctorName);
			ps.setString(3, doctorAge);
			ps.setString(4, doctorGender);
			ps.setString(5, doctorAddress);
			ps.setString(6, doctorContact);
			ps.setString(7, doctorConsultingFees);
			ps.setString(8, doctorEducation);
			ps.setString(9, doctorSpecialization);
			ps.setString(10, medicalRegNo);
			
			int result = ps.executeUpdate();
			
			if(result == 1){
					out.println("<script type=\"text/javascript\">alert('Doctor Added successfully')</script>");
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
