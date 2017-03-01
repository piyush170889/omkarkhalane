package controller;

import java.io.IOException;
//import java.io.PrintWriter;
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
 * Servlet implementation class GenrateIPDBill
 */
@WebServlet("/GenrateIPDBill")
public class GenrateIPDBill extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String billingId; 
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenrateIPDBill() {
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
		/*response.setContentType("text/html");
		PrintWriter out = response.getWriter();*/
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		String currDate = sdf.format(new Date());		
		
		//Get databse Connection
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		//Get Patient Details
		String ipdId = request.getParameter("ipdid").trim();
		String patientName = request.getParameter("f_name").trim()+" "+request.getParameter("m_name").trim()+" "+request.getParameter("l_name");
		String patientAge = request.getParameter("patient_age").trim();
		String patientOccupation = request.getParameter("patientOccupation").trim();
		String patientAddress = request.getParameter("patient_address").trim();
		String patientNextToKin = request.getParameter("patient_next_to_kin").trim();
		String patientContact = request.getParameter("patient_contact_no").trim();
		String dateOfAdmission = request.getParameter("date_of_admission").trim();
		String PrimaryDiagnosis = request.getParameter("primaryDiagnosis").trim();
		String patientRefernce = request.getParameter("patient_referred_by").trim();
		
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
		
		//Get Billing Details
		String billType = request.getParameter("billType").trim();
		if(billType.equals("--Select--")){
			billType = "";
		}
		String roomType = request.getParameter("roomtypetext").trim();
		if(roomType.equals("--Select--")){
			roomType = "";
		}
		String roomOrBedNo = request.getParameter("roomOrBedNo").trim();
		String roomCharges = request.getParameter("roomCharges").trim();
		String perUnitRoomCharges = request.getParameter("perRoomCharge").trim();
		String nursingCharges = request.getParameter("nursingCharges").trim();
		String perUnitNursingCharges = request.getParameter("perNursingCharges").trim();
		String visitingDoctor1 = request.getParameter("visitingDoc1").trim();
		if(visitingDoctor1.equals("--Select--")){
			visitingDoctor1 = "";
		}
		String visitingDoctor1charges = request.getParameter("v1charges").trim();
		String visitingDoctor2 = request.getParameter("visitingDoc2").trim();
		if(visitingDoctor2.equals("--Select--")){
			visitingDoctor2 = "";
		}
		String visitingDoctor2charges = request.getParameter("v2charges").trim();
		String visitingDoctor3 = request.getParameter("visitingDoc3").trim();
		if(visitingDoctor3.equals("--Select--")){
			visitingDoctor3 = "";
		}
		String visitingDoctor3charges = request.getParameter("v3charges").trim();
		String operatingCharges = request.getParameter("operatingCharges").trim();
		String assistantsCharges = request.getParameter("assistantsCharges").trim();
		String otCharges = request.getParameter("otCharges").trim();
		String oxygenCharges = request.getParameter("oxygenCharges").trim();
		String drugsCharges = request.getParameter("otherCharges").trim();
		String anaesthesiaDoctorCharges = request.getParameter("anaesthesiaDoctorCharges").trim();
		String instrumentCharges = request.getParameter("specialInstrumentCharges").trim();
		String implantsCharges = request.getParameter("implantsOtherMaterialCharges").trim();
		String deliveryCharges = request.getParameter("deliveryCharges").trim();
		String labourRoomCharges = request.getParameter("labourRoomChrges").trim();
		String babyCareCharges = request.getParameter("babyCareCharges").trim();
		String ivOrBloodFusionCharges = request.getParameter("ivOrBloodTransfusionsCharges").trim();
		String disposableMaterial = request.getParameter("disposableMaterial").trim();
		String administrationCharges = request.getParameter("hospitalAdministrationCharges").trim();
		String dressingOrPlasterCharges = request.getParameter("dressingOrPlasterCharges").trim();
		String labCharges = request.getParameter("labCharges").trim();
		String investigationCharges = request.getParameter("investigationCharges").trim();
		String xrayperprice = request.getParameter("perPricexray").trim();
		String xrayqty = request.getParameter("xrayqty").trim();
		String xrayCharges = request.getParameter("xrayCharges").trim();
		String miscelleneousCharges = request.getParameter("miscellaneousCharges").trim();
		String registrationCharges = request.getParameter("ipdregistrationcharges").trim();
		String mlcNo = request.getParameter("mlcno").trim();
		String concession = request.getParameter("concession").trim();
		//Total Billing Amount Details
		String totalInWords = request.getParameter("totalIPDAmountInWords").trim();
		String totalInNumbers = request.getParameter("totalIPDAmountInNumbers").trim();
//		String prevBal = request.getParameter("prevBal").trim();
		String totalpayable = request.getParameter("totalPayable").trim();
		String amountpaid = request.getParameter("amountPaid").trim();
		String balance = request.getParameter("balance").trim();
		String suregryDescription = request.getParameter("suregryDescription").trim();
		String advanceAmount = request.getParameter("advancePaid");
		
		try{
			//Step 1: Create Billing Record
			//Create billing Id
			
			String maxBookId;
			try{			
				PreparedStatement pst0 = con.prepareStatement("select count(*) from omk_db.omk_ipd_billing_details");
				ResultSet rs0 = pst0.executeQuery();
				rs0.next();
				if(rs0.getInt(1) == 0){
					billingId ="BLI1";
				}else{
					PreparedStatement pst = con.prepareStatement("select max(ipd_billing_srno) from omk_db.omk_ipd_billing_details");
					ResultSet rs = pst.executeQuery();
					if(rs.next()){
						int maxsrno = rs.getInt(1);
						if(maxsrno == 0){
							maxBookId = Integer.toString(rs.getInt(1)+2);
						}else{
							maxBookId = Integer.toString(rs.getInt(1)+1);
						}
						billingId = "BLI"+maxBookId;
					}else{
						throw new Exception("Something went wrong. Please contact your administrator.Cannot get Max Sr no");
					}
				}	
				
			}catch(Exception e){
				e.printStackTrace();
			}
			
			//Insert billing details
			String createBillingrecordQuery = "insert into omk_ipd_billing_details(billing_id_ipd,ipd_bill_generation_datetime,ipd_bill_ipd_id,ipd_bill_discharge_datetime,ipd_bill_billtype,ipd_bill_roomtype,ipd_bill_room_or_bed_no,ipd_bill_roomcharges,ipd_bill_perunitroomcharges,ipd_bill_nursingcharges,ipd_bill_perunitnursingcharges,ipd_bill_visitingdoc1,ipd_bill_visitingdoc2,ipd_bill_visitingdoc3,ipd_bill_operatingcharges,ipd_bill_assistantcharges,ipd_bill_otcharges,ipd_bill_oxygencharges,ipd_bill_drugscharges,ipd_bill_anaesthesiadoctorcharges,ipd_bill_instrumentcharges,ipd_bill_implantscharges,ipd_bill_deliverycharges,ipd_bill_labourroomcharges,ipd_bill_babycarecharges,ipd_bill_ivorbloodfusioncharges,ipd_bill_disposablecharges,ipd_bill_administrationcharges,ipd_bill_dressingorplastercharges,ipd_bill_labcharges,ipd_bill_investigationcharges,ipd_bill_xraycharges,ipd_bill_miscellenouscharges,ipd_bill_totalbill,ipd_bill_balance,ipd_bill_paid,visitingdoc1charges,visitingdoc2charges,visitingdoc3charges,xrayperprice,xrayqty,registrationCharges,ipd_bill_datetime_of_admission,mlcno,suregryDescription,ipd_bill_subtotal,Concession) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst1 = con.prepareStatement(createBillingrecordQuery);
			pst1.setString(1, billingId);
			pst1.setString(2, currDate);
			pst1.setString(3, ipdId);
			pst1.setString(4, dateOfDischarge);
			pst1.setString(5, billType);
			pst1.setString(6, roomType);
			pst1.setString(7, roomOrBedNo);
			pst1.setString(8, roomCharges);
			pst1.setString(9, perUnitRoomCharges);
			pst1.setString(10, nursingCharges);
			pst1.setString(11, perUnitNursingCharges);
			pst1.setString(12, visitingDoctor1);
			pst1.setString(13, visitingDoctor2);
			pst1.setString(14, visitingDoctor3);
			pst1.setString(15, operatingCharges);
			pst1.setString(16, assistantsCharges);
			pst1.setString(17, otCharges);
			pst1.setString(18, oxygenCharges);
			pst1.setString(19, drugsCharges);
			pst1.setString(20, anaesthesiaDoctorCharges);
			pst1.setString(21, instrumentCharges);
			pst1.setString(22, implantsCharges);
			pst1.setString(23, deliveryCharges);
			pst1.setString(24, labourRoomCharges);
			pst1.setString(25, babyCareCharges);
			pst1.setString(26, ivOrBloodFusionCharges);
			pst1.setString(27, disposableMaterial);
			pst1.setString(28, administrationCharges);
			pst1.setString(29, dressingOrPlasterCharges);
			pst1.setString(30, labCharges);
			pst1.setString(31, investigationCharges);
			pst1.setString(32, xrayCharges);
			pst1.setString(33, miscelleneousCharges);
			pst1.setString(34, totalpayable);
			pst1.setString(35, balance);
			pst1.setString(36, amountpaid);
			pst1.setString(37, visitingDoctor1charges);
			pst1.setString(38, visitingDoctor2charges);
			pst1.setString(39, visitingDoctor3charges);
			pst1.setString(40, xrayperprice);
			pst1.setString(41, xrayqty);
			pst1.setString(42, registrationCharges);
			pst1.setString(43, dateOfAdmission);
			pst1.setString(44, mlcNo);
			pst1.setString(45, suregryDescription);
			pst1.setString(46, totalInNumbers);
			pst1.setString(47, concession);
			
			int result1 = pst1.executeUpdate();
			
			if(result1 == 1){
				//Step 2: Update billing id in IPD info
				String updateBillingIdInIPD = "update omk_ipd_appointments set discharge_on_datetime=?,expiry_on_datetime=?,final_diagnosis=?,cause_of_death=?,death_certificate_no=?,surgeon=?,datetime_of_surgery=?,anaesthetist_doctor=?,anaesthesia_type=?,death_certificate_issue_datetime=?,ipd_billing_id=?,mlcno=?,suregryDescription=? where ipd_id=? and admitted_on_datetime=?";
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
				pst2.setString(11, billingId);
				pst2.setString(12, mlcNo);
				pst2.setString(13, suregryDescription);
				pst2.setString(14, ipdId);
				pst2.setString(15, dateOfAdmission);
				
				int result2 = pst2.executeUpdate();
				
				if(result2 == 1){
					String redirecct = "IPDBillPrint1.jsp?ipdId="+ipdId+"&patientName="+patientName+"&patientAge="+patientAge+"&patientOccupation="+patientOccupation+"&patientAddress="+patientAddress+"&patientNextToKin="+patientNextToKin+"&patientContact="+patientContact+"&dateOfAdmission="+dateOfAdmission+"&primaryDiagnosis="+PrimaryDiagnosis+"&patientRefrence="+patientRefernce+"&ipdsurgeon="+surgeon+"&surgeryDate="+patientDateOfSurgery+"&anaesthethistdoctor="+anaesthesiaDoctor+"&anaesthesiatype="+anaesthesiaType+"&finaldiagnosis="+finalDiagnosis+"&dischargedate="+dateOfDischarge+"&expirydate="+dateOfExpiry+"&causeofdeath="+causeOfDeath+"&deathcertificateno="+deathCertificateNo+"&deathcertificateissuedate="+deathCertificateIssueDate+"&billtype="+billType+"&roomtype="+roomType+"&roombedno="+roomOrBedNo+"&roomcharges="+roomCharges+"&perunitroomcharges="+perUnitRoomCharges+"&nursingcharges="+nursingCharges+"&perunitnursingcharges="+perUnitNursingCharges+"&vistingdoctor1="+visitingDoctor1+"&vistingdoctor2="+visitingDoctor2+"&vistingdoctor3="+visitingDoctor3+"&operatingcharges="+operatingCharges+"&assistantcharges="+assistantsCharges+"&otcharges="+otCharges+"&oxygencharges="+oxygenCharges+"&drugscharges="+drugsCharges+"&doctorcharges="+anaesthesiaDoctorCharges+"&instrumentcharges="+instrumentCharges+"&implants="+implantsCharges+"&deliverycharges="+deliveryCharges+"&labour="+labourRoomCharges+"&babycare="+babyCareCharges+"&ivfusion="+ivOrBloodFusionCharges+"&disposable="+disposableMaterial+"&admincharges="+administrationCharges+"&dressing="+dressingOrPlasterCharges+"&lab="+labCharges+"&special="+investigationCharges+"&xray="+xrayCharges+"&misc="+miscelleneousCharges+"&totalinwords="+totalInWords+"&totalinrupees="+totalInNumbers+"&totalpayable="+totalpayable+"&paid="+amountpaid+"&balance="+balance+"&dischargedate="+dateOfDischarge+"&admissiondate="+dateOfAdmission+"&visitingDoctor1charges="+visitingDoctor1charges+"&visitingDoctor2charges="+visitingDoctor2charges+"&visitingDoctor3charges="+visitingDoctor3charges+"&billid="+billingId+"&registrationcharges="+registrationCharges+"&xrayperprice="+xrayperprice+"&xrayqty="+xrayqty+"&suregryDescription="+suregryDescription+"&advance="+advanceAmount+"&concession="+concession;
					response.sendRedirect(redirecct);
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
