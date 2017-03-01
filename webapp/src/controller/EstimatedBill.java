package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class EstimatedBill
 */
@WebServlet("/EstimatedBill")
public class EstimatedBill extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private String billingId; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EstimatedBill() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		//String mlcNo = request.getParameter("mlcno").trim();
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
			
		billingId ="Estimate Bill";
		String redirecct = "IPDBillPrint1.jsp?ipdId="+ipdId+"&patientName="+patientName+"&patientAge="+patientAge+"&patientOccupation="+patientOccupation+"&patientAddress="+patientAddress+"&patientNextToKin="+patientNextToKin+"&patientContact="+patientContact+"&dateOfAdmission="+dateOfAdmission+"&primaryDiagnosis="+PrimaryDiagnosis+"&patientRefrence="+patientRefernce+"&ipdsurgeon="+surgeon+"&surgeryDate="+patientDateOfSurgery+"&anaesthethistdoctor="+anaesthesiaDoctor+"&anaesthesiatype="+anaesthesiaType+"&finaldiagnosis="+finalDiagnosis+"&dischargedate="+dateOfDischarge+"&expirydate="+dateOfExpiry+"&causeofdeath="+causeOfDeath+"&deathcertificateno="+deathCertificateNo+"&deathcertificateissuedate="+deathCertificateIssueDate+"&billtype="+billType+"&roomtype="+roomType+"&roombedno="+roomOrBedNo+"&roomcharges="+roomCharges+"&perunitroomcharges="+perUnitRoomCharges+"&nursingcharges="+nursingCharges+"&perunitnursingcharges="+perUnitNursingCharges+"&vistingdoctor1="+visitingDoctor1+"&vistingdoctor2="+visitingDoctor2+"&vistingdoctor3="+visitingDoctor3+"&operatingcharges="+operatingCharges+"&assistantcharges="+assistantsCharges+"&otcharges="+otCharges+"&oxygencharges="+oxygenCharges+"&drugscharges="+drugsCharges+"&doctorcharges="+anaesthesiaDoctorCharges+"&instrumentcharges="+instrumentCharges+"&implants="+implantsCharges+"&deliverycharges="+deliveryCharges+"&labour="+labourRoomCharges+"&babycare="+babyCareCharges+"&ivfusion="+ivOrBloodFusionCharges+"&disposable="+disposableMaterial+"&admincharges="+administrationCharges+"&dressing="+dressingOrPlasterCharges+"&lab="+labCharges+"&special="+investigationCharges+"&xray="+xrayCharges+"&misc="+miscelleneousCharges+"&totalinwords="+totalInWords+"&totalinrupees="+totalInNumbers+"&totalpayable="+totalpayable+"&paid="+amountpaid+"&balance="+balance+"&dischargedate="+dateOfDischarge+"&admissiondate="+dateOfAdmission+"&visitingDoctor1charges="+visitingDoctor1charges+"&visitingDoctor2charges="+visitingDoctor2charges+"&visitingDoctor3charges="+visitingDoctor3charges+"&billid="+billingId+"&registrationcharges="+registrationCharges+"&xrayperprice="+xrayperprice+"&xrayqty="+xrayqty+"&suregryDescription="+suregryDescription+"&advance="+advanceAmount+"&concession="+concession;
		response.sendRedirect(redirecct);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
