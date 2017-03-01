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
 * Servlet implementation class EditDoctors
 */
@WebServlet("/EditDoctors")
public class EditDoctors extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditDoctors() {
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
			String doctorId = request.getParameter("doctorId").trim();
			String doctorName = request.getParameter("doctorName").trim();
			String doctorAge = request.getParameter("doctorAge").trim();
			String doctorGender = request.getParameter("doctorGender").trim();
			if(doctorGender.equals("--Select--")){
				doctorGender="";
			}
			String doctorEducation = request.getParameter("doctorEducation").trim();
			String doctorContact = request.getParameter("doctorContact").trim();
			String doctorConsultingFees = request.getParameter("doctorConsultingFees").trim();
			String doctorSpecialization = request.getParameter("doctorSpecialization").trim();
			String medregno = request.getParameter("doctormedregno");
			
			PreparedStatement ps = con.prepareStatement("update omk_doctor_details set doc_name=?, doc_age=?, doc_gender=?, doc_contact=?,education=?,doc_consulting_fees=?, specialization=?,med_reg_no=? where doc_id=? and doc_srno<>0");
			
			ps.setString(1, doctorName);
			ps.setString(2, doctorAge);
			ps.setString(3, doctorGender);
			ps.setString(4, doctorContact);
			ps.setString(5, doctorEducation);
			ps.setString(6, doctorConsultingFees);
			ps.setString(7, doctorSpecialization);
			ps.setString(8, medregno);
			ps.setString(9, doctorId);
			
			int result = ps.executeUpdate();
			if(result==1){
				out.println("<script type=\"text/javascript\">alert('"+doctorId+" upadted successfully')</script>");
				utilities.CommonUtilities.returnToMaster(response);
			}else{
				throw new Exception("Cannot edit Doctors record");
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
