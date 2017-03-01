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
 * Servlet implementation class RegisterOPDToIPDAppointment
 */
@WebServlet("/RegisterOPDToIPDAppointment")
public class RegisterOPDToIPDAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterOPDToIPDAppointment() {
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
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
//		String dateOfAppointment  = null;
//		String dept="";
		String c_doc="";
		//Get all general registration parameters
		String f_name = request.getParameter("f_name").trim();
//		String m_name = request.getParameter("m_name").trim();
//		String l_name = request.getParameter("l_name").trim();
		String contactNo = request.getParameter("patient_contact_no").trim();
//		String patient_age = request.getParameter("patient_age").trim();
		String patientGender = request.getParameter("patient_gender").trim();
		if(patientGender.equals("--Select--")){
			patientGender = "";
		}

		boolean doPatientExist = true;
		boolean isPatientRecordUpdated = true;
		
		boolean isIPDAppointmentCreated = false;
//		String patient_address = request.getParameter("patient_address").trim();
		
//		String patientOccupation = request.getParameter("patient_occupation").trim();
//		String registerType = request.getParameter("registertype").trim();
//		String dept = request.getParameter("dept").trim();
		c_doc = request.getParameter("c_doc").trim();
		
//		String advanceAmount = request.getParameter("advance_amount").trim();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		String currDate = sdf.format(new Date());		
		
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		//Get OPD ID if OPD Registration
		String opdId = request.getParameter("opd_id");
		
		//GET IPD ID if IPD registration
		String ipdId = request.getParameter("ipd_id");
		
		//Create database connection
		
		
		try{
			//GET all IPD registration parameters
			String nextToKin = request.getParameter("next_to_kin").trim();
			String admittedOn = request.getParameter("admitted_on_datetime").trim();
			if(admittedOn.equals("")){
				out.print("<script type=\"text/javascript\">alert('Please Enter Date of admitted ');</script>");
				out.print("<script type=\"text/javascript\">self.location.href='dashboard.jsp?current=dashboard';</script>");
			}
			String primaryDiagnosis = request.getParameter("primary_diagnosis").trim();
			String dateOfSurgery = request.getParameter("surgery_date").trim();
			
			String advance_amount = request.getParameter("advance_amount").trim();
			if(dateOfSurgery.equals("")){
				dateOfSurgery = null;
			}
			String surgeon = c_doc;
			if(surgeon.equals("--Select--")){
				surgeon = "";
			}
			String refernceDoctor = request.getParameter("reffered_by").trim();
			if(refernceDoctor.equals("--Select--")){
				refernceDoctor = "";
			}
			
			//Create IPD appointment
			
				String createOPDRecordSql = "insert into omk_db.omk_ipd_appointments(ipd_id,i_opd_id,next_to_kin,admitted_on_datetime,primary_diagnosis,surgeon,datetime_of_surgery,ipd_registration_datetime,ipd_reference_doctor) values(?,?,?,?,?,?,?,?,?)";
				PreparedStatement pst4 = con.prepareStatement(createOPDRecordSql);
				pst4.setString(1, ipdId);
				pst4.setString(2, "Not Registered");
				pst4.setString(3,nextToKin );
				pst4.setString(4, admittedOn);
				pst4.setString(5, primaryDiagnosis);
				pst4.setString(6, surgeon);
				pst4.setString(7, dateOfSurgery);
				pst4.setString(8, currDate);
				pst4.setString(9, refernceDoctor);
				
				int result = pst4.executeUpdate();
				
				if(result == 1){
					isIPDAppointmentCreated = true;
					
					//Update booking record details 
					if(doPatientExist && isIPDAppointmentCreated){
						String updateBookingDetails = "update omk_book_appointment set b_ipd_id=?, b_status=? where f_name=? and patient_contact=?";
						PreparedStatement pst5 = con.prepareStatement(updateBookingDetails);
						pst5.setString(1, ipdId);
						pst5.setString(2, "Registered For Both");
						pst5.setString(3, f_name);
						pst5.setString(4, contactNo);
						int result1 = pst5.executeUpdate();
						
						if(result1==1){
							isPatientRecordUpdated = true;
						}else{
							con.rollback();
							throw new Exception("Unable to insert data");
						}
					}
					
					PreparedStatement pst6=con.prepareStatement("insert into advance_amount(advance_datetime,amount,advance_ipd_id,creattion_datetime,admission_datetime) values (?,?,?,?,?)");
					pst6.setString(1, admittedOn);
					pst6.setString(2, advance_amount);
					pst6.setString(3, ipdId);
					pst6.setString(4,currDate);
					pst6.setString(5, admittedOn);
					int res=pst6.executeUpdate();
					if(res!=1){
						con.rollback();
						throw new Exception("unable to insert data");
					}
					
					//POP-UP Success message if: 1) Patient booking record exists, 2) Patient Booking Record is Updated and 3) Patient IPD record is created
					if( isPatientRecordUpdated && isIPDAppointmentCreated){
						out.println(utilities.CommonUtilities.popUpSuccessMessage());
						utilities.CommonUtilities.returnToDashboard(response);
					}else{
						
						con.rollback();
						throw new Exception("Patient Record cannot be created at the moment.... Contact your administrator");
					}
					PreparedStatement pst9=con.prepareStatement("update omk_opd_appointments set o_ipd_id=? where opd_id=? and srno<>0");
					pst9.setString(1, ipdId);
					pst9.setString(2, opdId);
					int result1=pst9.executeUpdate();
					if(result1>=1){
						opdId="Not Registered";
					}else{
						con.rollback();
						throw new Exception("Cannot create Booking Record");
					}
					
				}else{
					con.rollback();
					throw new Exception("IPD Appointment was not booked");
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
					if(con!= null)
						con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
	}

}
