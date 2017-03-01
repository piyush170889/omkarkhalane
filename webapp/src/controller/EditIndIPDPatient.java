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
 * Servlet implementation class EditIndIPDPatient
 */
@WebServlet("/EditIndIPDPatient")
public class EditIndIPDPatient extends HttpServlet {
	private static final long serialVersionUID = 1L;
//    private String billingId; 
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
	String currDate = sdf.format(new Date());		
    
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
		
		//Get databse Connection
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		//Get Patient Details
		String ipdId = request.getParameter("ipdid").trim();
		
		String f_name = request.getParameter("f_name").trim();
		String m_name = request.getParameter("m_name").trim();
		String l_name = request.getParameter("l_name").trim();
		String age = request.getParameter("patient_age").trim();
		String occ = request.getParameter("patientOccupation").trim();
		String address = request.getParameter("patient_address").trim();
		String contct = request.getParameter("patient_contact_no").trim();
		
		
		
		String dateOfAdmission = request.getParameter("date_of_admission").trim();
		//Get Discharge Details
		String surgeon = request.getParameter("surgeon").trim();
		String patientDateOfSurgery = request.getParameter("dateOfSurgery").trim();
		if(patientDateOfSurgery.equals("") || patientDateOfSurgery.equals("null")){
			patientDateOfSurgery = null;
		}
		String anaesthesiaDoctor = request.getParameter("anaesthetistDoctor").trim();
		if(anaesthesiaDoctor.equals("--Select--")){
			anaesthesiaDoctor = "";
		}
		String anaesthesiaType = request.getParameter("anaesthesiaType").trim();
		if(anaesthesiaType.equals("--Select--")){
			anaesthesiaType = "";
		}
		String finalDiagnosis = request.getParameter("finalDiagnosis").trim();
		String dateOfDischarge = request.getParameter("dateOfDischarge").trim();
		if(dateOfDischarge.equals("") || dateOfDischarge.equals("null")){
			dateOfDischarge = null;
		}
		String dateOfExpiry = request.getParameter("dateOfExpiry").trim();
		if(dateOfExpiry.equals("") || dateOfExpiry.equals("null")){
			dateOfExpiry = null;
		}
		String causeOfDeath = request.getParameter("patient_cause_of_death").trim();
		String deathCertificateNo = request.getParameter("patient_death_certificateNo").trim();
		String deathCertificateIssueDate = request.getParameter("patient_detah_certificate_issue_date").trim();
		if(deathCertificateIssueDate.equals("") || deathCertificateIssueDate.equals("null")){
			deathCertificateIssueDate = null;
		}
		
		
		try{
			//Step 1: Create patient information
			String updateIdInIPD = "update omk_book_appointment set  f_name=?,m_name=?,l_name,patient_age=?,patient_occupation=?,patient_address=?,patient_contact=?  where b_ipd_id=?";
			PreparedStatement pst1 = con.prepareStatement(updateIdInIPD);
			pst1.setString(1, f_name);
			pst1.setString(2, m_name);
			pst1.setString(3, l_name);
			pst1.setString(4, age);
			pst1.setString(5, occ);
			pst1.setString(6, address);
			pst1.setString(7, contct);
			pst1.setString(8, ipdId);
			
			
			int result1 = pst1.executeUpdate();
			
			if(result1 == 1){
				//Step 2: Update billing id in IPD info
				String updateBillingIdInIPD = "update omk_ipd_appointments set discharge_on_datetime=?,expiry_on_datetime=?,final_diagnosis=?,cause_of_death=?,death_certificate_no=?,surgeon=?,datetime_of_surgery=?,anaesthetist_doctor=?,anaesthesia_type=?,death_certificate_issue_datetime=? where ipd_id=? and admitted_on_datetime=?";
				PreparedStatement pst2 = con.prepareStatement(updateBillingIdInIPD);
				pst2.setString(1, dateOfDischarge);
				pst2.setString(2, dateOfExpiry);
				pst2.setString(3, finalDiagnosis);
				pst2.setString(4, causeOfDeath);
				pst2.setString(5, deathCertificateNo);
				pst2.setString(6, surgeon);
				pst2.setString(7, patientDateOfSurgery);
				pst2.setString(8, anaesthesiaDoctor);
				pst2.setString(9, anaesthesiaType);
				pst2.setString(10, deathCertificateIssueDate);
				pst2.setString(11, ipdId);
				pst2.setString(12, dateOfAdmission);
				
				int result2 = pst2.executeUpdate();
				
				if(result2 == 1){
					out.println("<script type=\"text/javascript\">alert('IPD Billing Record Created Successsfully.')</script>");
				}else{
					throw new Exception("Something went wrong. Please contact administrator");
				}
			}else{
				throw new Exception("Something went wrong. Please contact administrator");
			}

		}catch(Exception e){
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
