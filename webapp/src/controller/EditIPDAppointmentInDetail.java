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
 * Servlet implementation class EditIPDAppointmentInDetail
 */
@WebServlet("/EditIPDAppointmentInDetail")
public class EditIPDAppointmentInDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditIPDAppointmentInDetail() {
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
		String f_name= request.getParameter("f_ipd_name").trim();
		String m_name=request.getParameter("m_ipd_name").trim();
		String l_name=request.getParameter("l_ipd_name").trim();
		String nextToKin = request.getParameter("edit_next_to_kin").trim();
		String admittedOn = request.getParameter("edit_admitted_on_datetime").trim();
		String primaryDiagnosis = request.getParameter("edit_primary_diagnosis").trim();
		String finalDiagnosis = request.getParameter("edit_final_diagnosis");
		String surgeon = request.getParameter("edit_surgeon").trim();
		if(surgeon.equals("--Select--")){
			surgeon = "";
		}
		String surgeryDate = request.getParameter("edit_surgery_date").trim();
		if(surgeryDate.equals("null")){
			surgeryDate = null;
		}
		String anaesthetist = request.getParameter("edit_anaesthetist");
		String anaesthesiaType = request.getParameter("edit_anaesthesia_type");
		String referenceDoctor = request.getParameter("edit_reffered_by").trim();
		String originalAdmittedDate = request.getParameter("original_admit_date");
		
		//Create Database Connection
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		try{
			//Update Name Details
			PreparedStatement ps1 = con.prepareStatement("update omk_book_appointment set f_name=?,m_name=?,l_name=? where b_ipd_id=? and srno<>0");
			ps1.setString(1, f_name);
			ps1.setString(2, m_name);
			ps1.setString(3, l_name);
			ps1.setString(4, ipdId);
			
			int result11 = ps1.executeUpdate();
			if(result11 == 1){
				
				String updateIPQuery = "update omk_db.omk_ipd_appointments set next_to_kin=?,admitted_on_datetime=?,primary_diagnosis=?,surgeon=?,datetime_of_surgery=?,ipd_reference_doctor=?,final_diagnosis=?,anaesthetist_doctor=?,anaesthesia_type=? where ipd_id=? and admitted_on_datetime=? and ipd_srno<>0";
				PreparedStatement ps = con.prepareStatement(updateIPQuery);
				
				ps.setString(1, nextToKin);
				ps.setString(2, admittedOn);
				ps.setString(3, primaryDiagnosis);
				ps.setString(4, surgeon);
				ps.setString(5, surgeryDate);
				ps.setString(6, referenceDoctor);
				ps.setString(7, finalDiagnosis);
				ps.setString(8, anaesthetist);
				ps.setString(9, anaesthesiaType);
				ps.setString(10, ipdId);
				ps.setString(11, originalAdmittedDate);
				
				int result = ps.executeUpdate();
				
				if(result == 1){
					out.println("<script type=\"text/javascript\">alert('"+ipdId+" Updated successfully')</script>");
					utilities.CommonUtilities.returnToDashboard(response);
				}else{
					throw new Exception("Cannot Update "+ipdId);
				}
			}else{
				out.println("<script type=\"text/javascript\">alert('Cannot update name')</script>");
				throw new Exception("Cannot update name");
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
