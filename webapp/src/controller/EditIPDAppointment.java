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
 * Servlet implementation class EditIPDAppointment
 */
@WebServlet("/EditIPDAppointment")
public class EditIPDAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditIPDAppointment() {
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
		
		String ipdId = request.getParameter("edit_ipd_id").trim();
		String nextToKin = request.getParameter("edit_next_to_kin").trim();
		String admittedOn = request.getParameter("edit_admitted_on_datetime").trim();
		String primaryDiagnosis = request.getParameter("edit_primary_diagnosis").trim();
		String surgeon = request.getParameter("edit_surgeon").trim();
		if(surgeon.equals("--Select--")){
			surgeon = "";
		}
		String surgeryDate = request.getParameter("edit_surgery_date").trim();
		if(surgeryDate.equals("") || surgeryDate.equals("null")){
			surgeryDate = null;
		}
		String referenceDoctor = request.getParameter("edit_reffered_by").trim();
		if(referenceDoctor.equals("--Select--")){
			referenceDoctor = "";
		}
		String originalAdmittedDate = request.getParameter("original_admit_date");
		
		//Create Database Connection
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		try{
			String updateIPQuery = "update omk_db.omk_ipd_appointments set next_to_kin=?,admitted_on_datetime=?,primary_diagnosis=?,surgeon=?,datetime_of_surgery=?,ipd_reference_doctor=? where ipd_id=? and admitted_on_datetime=?";
			PreparedStatement ps = con.prepareStatement(updateIPQuery);
			
			ps.setString(1, nextToKin);
			ps.setString(2, admittedOn);
			ps.setString(3, primaryDiagnosis);
			ps.setString(4, surgeon);
			ps.setString(5, surgeryDate);
			ps.setString(6, referenceDoctor);
			ps.setString(7, ipdId);
			ps.setString(8, originalAdmittedDate);
			
			int result = ps.executeUpdate();
			
			if(result == 1){
				out.println("<script type=\"text/javascript\">alert('"+ipdId+" Updated successfully')</script>");
				utilities.CommonUtilities.returnToDashboard(response);
			}else{
				throw new Exception("Cannot Update "+ipdId);
			}
		}catch(Exception e){
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			out.println("<h3 style=\"color:red;text-align:center;\">Something went wrong. Please contact your administrator. <br/>Error message: "+e.getMessage()+"</h3>");
			e.printStackTrace();
		}finally{
			try{
				con.commit();
				if(con != null)
					con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
}


