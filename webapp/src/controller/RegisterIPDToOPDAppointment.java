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
 * Servlet implementation class RegisterIPDToOPDAppointment
 */
@WebServlet("/RegisterIPDToOPDAppointment")
public class RegisterIPDToOPDAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterIPDToOPDAppointment() {
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
		
		String dept="",c_doc="";
		//Get all general registration parameters
		String f_name = request.getParameter("f_name").trim();
	/*	String m_name = request.getParameter("m_name").trim();
		String l_name = request.getParameter("l_name").trim();*/
		String contactNo = request.getParameter("patient_contact_no").trim();
//		String patient_age = request.getParameter("patient_age").trim();
		String patientGender = request.getParameter("patient_gender").trim();
		if(patientGender.equals("--Select--")){
			patientGender = "";
		}

		boolean doPatientExist = true;
		boolean isPatientRecordUpdated = true;
		
		boolean isIPDAppointmentCreated = false;
		/*String patient_address = request.getParameter("patient_address").trim();
		
		String patientOccupation = request.getParameter("patient_occupation").trim();
		String registerType = request.getParameter("registertype").trim();
	*/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		String currDate = sdf.format(new Date());		
		
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		//Get OPD ID if OPD Registration
		String opdId = request.getParameter("opd_id");
		
		//GET IPD ID if IPD registration
		String ipdId = request.getParameter("ipd_id");
		 c_doc = request.getParameter("c_doc");
		 dept = request.getParameter("dept");
		 if(dept.equals("--Select--")){
				dept="";
			}
		 if(c_doc.equals("--Select--")){
			 c_doc="";
			}
		//Create database connection
		
		
		try{  
			//GET all IPD registration parameters
			
			String admittedOn = request.getParameter("datetime_of_appointment").trim();
			if(admittedOn.equals("")){
				out.print("<script type=\"text/javascript\">alert('Please Enter Date of Appointment ');</script>");
				out.print("<script type=\"text/javascript\">self.location.href='dashboard.jsp?current=dashboard';</script>");
			}
			String refernceDoctor = request.getParameter("reference_doctor").trim();
			String appointment_type = request.getParameter("appointment_type").trim();
			if(refernceDoctor.equals("--Select--")){
				refernceDoctor = "";
			}
			
			//Create IPD appointment
			
				String createOPDRecordSql = "insert into omk_db.omk_opd_appointments(opd_id,opd_appointment_for,opd_datetime_of_appointment,opd_appointment_type,opd_appointment_status,opd_registration_datetime,opd_consulting_doctor,opd_reference_doctor,o_ipd_id) values(?,?,?,?,?,?,?,?,?)";
				PreparedStatement pst4 = con.prepareStatement(createOPDRecordSql);
				pst4.setString(1, opdId);
				pst4.setString(2, dept);
				pst4.setString(3,admittedOn );
				pst4.setString(4, appointment_type);
				pst4.setString(5, "Not Attended");
				pst4.setString(6, currDate);
				pst4.setString(7, c_doc);
				pst4.setString(8, refernceDoctor);
				pst4.setString(9, ipdId);
				
				int result = pst4.executeUpdate();
				
				if(result == 1){
					isIPDAppointmentCreated = true;
					
					//Update booking record details 
					if(doPatientExist && isIPDAppointmentCreated){
						String updateBookingDetails = "update omk_book_appointment set b_opd_id=?, b_status=? where f_name=? and patient_contact=?";
						PreparedStatement pst5 = con.prepareStatement(updateBookingDetails);
						pst5.setString(1, opdId);
						pst5.setString(2, "Registered For Both");
						pst5.setString(3, f_name);
						pst5.setString(4, contactNo);
						int result1 = pst5.executeUpdate();
						
						if(result1==1){
							// Update IPD Appointment
							PreparedStatement pst9=con.prepareStatement("update omk_ipd_appointments set i_opd_id=? where ipd_id=? ");
							pst9.setString(1, opdId);
							pst9.setString(2, ipdId);
							int result11=pst9.executeUpdate();
						
							if(result11>=1){
								opdId="Not Registered";
								isPatientRecordUpdated = true;
							}else{
								con.rollback();
								throw new Exception("Cannot create Booking Record");
							}
							
						}else{
							con.rollback();
							throw new Exception("Unable to insert data");
						}
					}
					
					if( isPatientRecordUpdated && isIPDAppointmentCreated){
						out.println(utilities.CommonUtilities.popUpSuccessMessage());
						utilities.CommonUtilities.returnToDashboard(response);
					}else{						
						con.rollback();
						throw new Exception("Patient Record cannot be created at the moment.... Contact your administrator");
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
					if(con != null){
						con.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
	}

}
