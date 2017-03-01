package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
 * Servlet implementation class RegisterBookAppointment
 */
@WebServlet("/RegisterBookAppointment")
public class RegisterBookAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterBookAppointment() {
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
		String dateOfAppointment  = null;
		String dept="",c_doc="";
		//Get all general registration parameters
		String f_name = request.getParameter("f_name").trim();
		String m_name = request.getParameter("m_name").trim();
		String l_name = request.getParameter("l_name").trim();
		String contactNo = request.getParameter("patient_contact_no").trim();
		String patient_age = request.getParameter("patient_age").trim();
		String patientGender = request.getParameter("patient_gender").trim();
		if(patientGender.equals("--Select--")){
			patientGender = "";
		}
		String patient_address = request.getParameter("patient_address").trim();
		
		String patientOccupation = request.getParameter("patient_occupation").trim();
		String registerType = request.getParameter("registertype").trim();
		dept = request.getParameter("dept").trim();
		 c_doc = request.getParameter("c_doc").trim();
		
		if(registerType.equals("OPD")){
			dateOfAppointment  = request.getParameter("datetime_of_appointment").trim();
			
		}else if(registerType.equals("IPD")){
			dateOfAppointment  = request.getParameter("admitted_on_datetime").trim();
			 
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		String currDate = sdf.format(new Date());		
		
		boolean doPatientExist = false;
		boolean isPatientRecordUpdated = false;
		boolean isOPDAppointmentCreated = false;
		boolean isIPDAppointmentCreated = false;
		String maxBookId = null;

		
		//Get OPD ID if OPD Registration
		String opdId = request.getParameter("opd_id");
		
		//GET IPD ID if IPD registration
		String ipdId = request.getParameter("ipd_id");
		
		//Create database connection
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		try{
			//Create booking record if patient does not exist
			if(registerType.equals("Book")){
				PreparedStatement pst1 = con.prepareStatement("select count(*) from omk_db.omk_book_appointment");
				ResultSet rs1 = pst1.executeQuery();
				rs1.next();
				if(rs1.getInt(1) == 0){
					maxBookId = "1";
				}else{
					PreparedStatement pst2 = con.prepareStatement("select max(srno) from omk_db.omk_book_appointment");
					ResultSet rs2 = pst2.executeQuery();
					rs2.next();
					maxBookId = Integer.toString(rs2.getInt(1)+1);
				}
				String createBookingRecord = "insert into omk_db.omk_book_appointment(booking_id,b_opd_id,b_ipd_id,f_name,patient_contact,patient_age,patient_gender,patient_address,patient_occupation,b_datetime_of_appointment,b_status,booking_date,m_name,l_name,appointment_for,consulting_doctor) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement pst3 = con.prepareStatement(createBookingRecord);
				pst3.setString(1, "B"+maxBookId);
				pst3.setString(2, opdId);
				pst3.setString(3, ipdId);
				pst3.setString(4, f_name);
				pst3.setString(13, m_name);
				pst3.setString(14, l_name);
				pst3.setString(15, dept);
				pst3.setString(16, c_doc);
				
				
				pst3.setString(5, contactNo);
				pst3.setString(6, patient_age);
				pst3.setString(7, patientGender);
				pst3.setString(8, patient_address);
				pst3.setString(9, patientOccupation);
				pst3.setString(10, dateOfAppointment);
				pst3.setString(11, "Not Registered");
				pst3.setString(12, currDate);
				
				int isPatientBooked = pst3.executeUpdate();

				if(isPatientBooked == 1){
					out.println(utilities.CommonUtilities.popUpSuccessMessage());
					utilities.CommonUtilities.returnToDashboard(response);
				}else{
					con.rollback();
					throw new Exception("Cannot create Booking Record");
				}
			}else{
					//Check If patient Exist
					String checkPatientSql = "select * from omk_book_appointment where patient_contact=? and f_name=?";
					PreparedStatement ps10 = con.prepareStatement(checkPatientSql);
					ps10.setString(1, contactNo);
					ps10.setString(2, f_name);
					
					ResultSet rs = ps10.executeQuery();
					
					if(rs.next()){
						doPatientExist = true;
					}else{
						PreparedStatement pst11 = con.prepareStatement("select count(*) from omk_db.omk_book_appointment");
						ResultSet rs11 = pst11.executeQuery();
						rs11.next();
						if(rs11.getInt(1) == 0){
							maxBookId = "1";
						}else{
							PreparedStatement pst12 = con.prepareStatement("select max(srno) from omk_db.omk_book_appointment");
							ResultSet rs12 = pst12.executeQuery();
							rs12.next();
							maxBookId = Integer.toString(rs12.getInt(1)+1);
						}
						String createBookingRecord = "insert into omk_db.omk_book_appointment(booking_id,b_opd_id,b_ipd_id,f_name,patient_contact,patient_age,patient_gender,patient_address,patient_occupation,b_datetime_of_appointment,b_status,booking_date,m_name,l_name,appointment_for,consulting_doctor) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
						PreparedStatement pst3 = con.prepareStatement(createBookingRecord);
						pst3.setString(1, "B"+maxBookId);
						pst3.setString(2, opdId);
						pst3.setString(3, ipdId);
						pst3.setString(4, f_name);
						pst3.setString(13, m_name);
						pst3.setString(14, l_name);
						pst3.setString(15, dept);
						pst3.setString(16, c_doc);
						pst3.setString(5, contactNo);
						pst3.setString(6, patient_age);
						pst3.setString(7, patientGender);
						pst3.setString(8, patient_address);
						pst3.setString(9, patientOccupation);
						pst3.setString(10, dateOfAppointment);
						pst3.setString(11, "Registered For "+registerType);
						pst3.setString(12, currDate);
						
						int isPatientBooked = pst3.executeUpdate();

						if(isPatientBooked == 1){
							doPatientExist = true;
						}else{
							con.rollback();
							throw new Exception("Cannot create Booking Record");
						}
					}
				}
				








				//Check Registration Type
				//For OPD Registrations
				if(registerType.equalsIgnoreCase("OPD")){
					//GET all OPD registration parameters
					String appointmentFor = dept;
					if(appointmentFor.equals("--Select--")){
						appointmentFor = "";
					}
					String appointmentType = request.getParameter("appointment_type");
					String consultingDoctor = c_doc;
					if(consultingDoctor.equals("--Select--")){
						consultingDoctor = "";
					}
					String refernceDoctor = request.getParameter("reference_doctor").trim();				
					if(refernceDoctor.equals("--Select--")){
						refernceDoctor = "";
					}
					
					//Create OPD appointment
					if(doPatientExist){
						String createOPDRecordSql = "insert into omk_db.omk_opd_appointments(opd_id,opd_appointment_for,opd_datetime_of_appointment,opd_appointment_type,opd_appointment_status,opd_registration_datetime,opd_consulting_doctor,opd_reference_doctor,o_ipd_id) values(?,?,?,?,?,?,?,?,?)";
						PreparedStatement pst4 = con.prepareStatement(createOPDRecordSql);
						pst4.setString(1, opdId);
						pst4.setString(2, appointmentFor);
						pst4.setString(3, dateOfAppointment);
						pst4.setString(4, appointmentType);
						pst4.setString(5, "Not Attended");
						pst4.setString(6, currDate);
						pst4.setString(7, consultingDoctor);
						pst4.setString(8, refernceDoctor);
						pst4.setString(9, ipdId);
						
						int result = pst4.executeUpdate();
						
						if(result == 1){
							isOPDAppointmentCreated = true;
							
							//Update booking record details 
							if(doPatientExist && !isPatientRecordUpdated){
								String updateBookingDetails = "update omk_book_appointment set b_opd_id=?, b_status=?,b_datetime_of_appointment=? where f_name=? and patient_contact=? and srno<>0";
								PreparedStatement pst5 = con.prepareStatement(updateBookingDetails);
								pst5.setString(1, opdId);
								pst5.setString(2, "Registered For OPD");
								pst5.setString(3, dateOfAppointment);
								pst5.setString(4, f_name);
								pst5.setString(5, contactNo);

								int result1 = pst5.executeUpdate();
								
								if(result1 >=1){
									isPatientRecordUpdated = true;
								}else{
									con.rollback();
									throw new Exception("Unable to insert data");
								}
							}
							
							//POP-UP Success message if: 1) Patient booking record exists, 2) Patient Booking Record is Updated and 3) Patient OPD record is created
							if(doPatientExist && isPatientRecordUpdated && isOPDAppointmentCreated){
								out.println(utilities.CommonUtilities.popUpSuccessMessage());
								utilities.CommonUtilities.returnToDashboard(response);
							}else{
								con.rollback();
								throw new Exception("Patient Record cannot be created at the moment.... Contact your administrator");
							}
							
						}else{
							con.rollback();
							throw new Exception("OPD Appointment was not booked");
						}
					}
				}
				
				//For IPD Registrations
				if(registerType.equalsIgnoreCase("IPD")){
					//GET all IPD registration parameters
					String nextToKin = request.getParameter("next_to_kin").trim();
					String admittedOn = request.getParameter("admitted_on_datetime").trim();
					String primaryDiagnosis = request.getParameter("primary_diagnosis").trim();
					String dateOfSurgery = request.getParameter("surgery_date").trim();
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
					if(doPatientExist){
						String createOPDRecordSql = "insert into omk_db.omk_ipd_appointments(ipd_id,i_opd_id,next_to_kin,admitted_on_datetime,primary_diagnosis,surgeon,datetime_of_surgery,ipd_registration_datetime,ipd_reference_doctor) values(?,?,?,?,?,?,?,?,?)";
						PreparedStatement pst4 = con.prepareStatement(createOPDRecordSql);
						pst4.setString(1, ipdId);
						pst4.setString(2, opdId);
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
							if(doPatientExist && !isPatientRecordUpdated){
								String updateBookingDetails = "update omk_book_appointment set b_ipd_id=?, b_status=? where f_name=? and patient_contact=?";
								PreparedStatement pst5 = con.prepareStatement(updateBookingDetails);
								pst5.setString(1, ipdId);
								pst5.setString(2, "Registered For IPD");
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
							
							//POP-UP Success message if: 1) Patient booking record exists, 2) Patient Booking Record is Updated and 3) Patient IPD record is created
							if(doPatientExist && isPatientRecordUpdated && isIPDAppointmentCreated){
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
					}
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
