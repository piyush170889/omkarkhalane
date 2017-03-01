package bookAppointmentTags;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import dao.Connection_Provider;

public class INDAPIPDPatientDetails extends TagSupport {
	private static final long serialVersionUID = 1L;
	

	
	String contact;
	String id;



	public void setContact(String contact) {
		this.contact = contact;
	}
	public void setId(String id) {
		this.id = id;
	}
	String	patientDetails,billingDetails;
	@Override
	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		int totalAdvance = 0;
		//Step 1: Get Patiennt Details as per specified Criteria(Id or Contact)
		if( id!="" && id!=null)
		{
			patientDetails = "select F_name,m_name,l_name,patient_contact,patient_age,patient_gender,patient_address,patient_occupation,ipd_id,next_to_kin,admitted_on_datetime,discharge_on_datetime,expiry_on_datetime,primary_diagnosis,final_diagnosis,cause_of_death,death_certificate_no,surgeon,datetime_of_surgery,anaesthetist_doctor,anaesthesia_type,death_certificate_issue_datetime,ipd_reference_doctor,ipd_billing_id,mlcno,suregryDescription from omk_book_appointment as book inner join omk_ipd_appointments as ipd on book.b_ipd_id=ipd.ipd_id and ipd_id='"+id+"'";
		}else if((contact!="" && contact!=null) )
		{
			patientDetails = "select F_name,m_name,l_name,patient_contact,patient_age,patient_gender,patient_address,patient_occupation,ipd_id,next_to_kin,admitted_on_datetime,discharge_on_datetime,expiry_on_datetime,primary_diagnosis,final_diagnosis,cause_of_death,death_certificate_no,surgeon,datetime_of_surgery,anaesthetist_doctor,anaesthesia_type,death_certificate_issue_datetime,ipd_reference_doctor,ipd_billing_id,mlcno,suregryDescription from omk_book_appointment as book inner join omk_ipd_appointments as ipd on book.b_ipd_id=ipd.ipd_id and patient_contact='"+contact+"'";
		}
		
		try{
			//Display Appointment Details Table
			PreparedStatement ps1 = con.prepareStatement(patientDetails);
			ResultSet rs1 = ps1.executeQuery();
			
			while(rs1.next()){
				//Get Billing Details
				billingDetails = "select * from omk_ipd_billing_details where ipd_bill_ipd_id=? and ipd_bill_datetime_of_admission=?";
				PreparedStatement ps2 = con.prepareStatement(billingDetails);
				ps2.setString(1, rs1.getString(9));
				ps2.setString(2, rs1.getString(11));
				
				ResultSet rs2 = ps2.executeQuery();

				String advanceDetails = "select amount,DATE_FORMAT(advance_datetime,'%d-%m-%y') from omk_db.advance_amount where advance_ipd_id=? and admission_datetime=?";
				PreparedStatement ps7 = con.prepareStatement(advanceDetails);
				ps7.setString(1, rs1.getString(9));
				ps7.setString(2, rs1.getString(11));
				String AdmissionDate;
				String DischargeDate;
				String ExpiryDate;
				String SurgeryDate;
				ResultSet rs3 = ps7.executeQuery();
				if(rs1.getString(11)==null){
					AdmissionDate="";
				}else{
					AdmissionDate=rs1.getString(11);
				}
				
				
				
				if(rs1.getString(12)==null){
					DischargeDate="";
				}else{
					DischargeDate=rs1.getString(12);
				}
				
				
				if(rs1.getString(13)==null){
					ExpiryDate="";
				}else{
					ExpiryDate=rs1.getString(13);
				}
				
				
				if(rs1.getString(19)==null){
					SurgeryDate="";
				}else{
					SurgeryDate=rs1.getString(19);
				}
				out.println("<tr>");
				
				out.println("<td>"+AdmissionDate+"</td>");
				out.println("<td>"+DischargeDate+"</td>");
				out.println("<td>"+ExpiryDate+"</td>");
				out.println("<td>"+SurgeryDate+"</td>");
				out.println("<td>"+rs1.getString(26)+"</td>");
				out.println("<td>"+rs1.getString(15)+"</td>");
				out.println("<td>"+rs1.getString(23)+"</td>");
				out.println("<td>");
				while(rs3.next()){
					out.println(rs3.getString(1)+" -- "+rs3.getString(2)+"<br/>");
					totalAdvance =Integer.parseInt(rs3.getString(1))+totalAdvance;
				}
//				out.println(totalAdvance);
			out.println("</td>");
				out.println("<td>");
					while(rs2.next()){
						out.println("<a href=\"IPDIndividualBillDetails.jsp?current=PatientManagement&ipdId="+rs1.getString(9)+"&patientName="+rs1.getString(1)+" "+rs1.getString(2)+" "+rs1.getString(3)+"&patientAge="+rs1.getString(5)+"&patientOccupation="+rs1.getString(8)+"&patientAddress="+rs1.getString(7)+"&patientNextToKin="+rs1.getString(10)+"&patientContact="+rs1.getString(4)+"&dateOfAdmission="+AdmissionDate+"&primaryDiagnosis="+rs1.getString(14)+"&patientRefrence="+rs1.getString(23)+"&ipdsurgeon="+rs1.getString(18)+"&surgeryDate="+SurgeryDate+"&anaesthethistdoctor="+rs1.getString(20)+"&anaesthesiatype="+rs1.getString(21)+"&finaldiagnosis="+rs1.getString(15)+"&dischargedate="+DischargeDate+"&expirydate="+ExpiryDate+"&causeofdeath="+rs1.getString(16)+"&deathcertificateno="+rs1.getString(17)+"&deathcertificateissuedate="+rs1.getString(22)+"&billtype="+rs2.getString(6)+"&roomtype="+rs2.getString(7)+"&roombedno="+rs2.getString(8)+"&roomcharges="+rs2.getString(9)+"&perunitroomcharges="+rs2.getString(10)+"&nursingcharges="+rs2.getString(11)+"&perunitnursingcharges="+rs2.getString(12)+"&vistingdoctor1="+rs2.getString(13)+"&vistingdoctor2="+rs2.getString(14)+"&vistingdoctor3="+rs2.getString(15)+"&operatingcharges="+rs2.getString(16)+"&assistantcharges="+rs2.getString(17)+"&otcharges="+rs2.getString(18)+"&oxygencharges="+rs2.getString(19)+"&drugscharges="+rs2.getString(20)+"&doctorcharges="+rs2.getString(21)+"&instrumentcharges="+rs2.getString(22)+"&implants="+rs2.getString(23)+"&deliverycharges="+rs2.getString(24)+"&labour="+rs2.getString(25)+"&babycare="+rs2.getString(26)+"&ivfusion="+rs2.getString(27)+"&disposable="+rs2.getString(28)+"&admincharges="+rs2.getString(29)+"&dressing="+rs2.getString(30)+"&lab="+rs2.getString(31)+"&special="+rs2.getString(32)+"&xray="+rs2.getString(33)+"&misc="+rs2.getString(34)+"&advanceamount="+totalAdvance+"&totalinrupees="+rs2.getString(47)+"&prevbal=&totalpayable="+rs2.getString(35)+"&paid="+rs2.getString(37)+"&balance="+rs2.getString(36)+"&dischargedate="+rs2.getString(5)+"&admissiondate="+rs2.getString(44)+"&visitingDoctor1charges="+rs2.getString(38)+"&visitingDoctor2charges="+rs2.getString(39)+"&visitingDoctor3charges="+rs2.getString(40)+"&billid="+rs2.getString(2)+"&registrationcharges="+rs2.getString(43)+"&xrayperprice="+rs2.getString(41)+"&xrayqty="+rs2.getString(42)+"&concession="+rs2.getString(48)+"&suregryDescription="+rs2.getString(26)+"\" >"+rs2.getString(2)+" -- "+rs2.getString(6)+"</a></br>");
					}
				out.println("</td>");
				
				out.println("<td>");
				out.println("<a href=\"IPDBill.jsp?ipdId="+rs1.getString(9)+"&fName="+rs1.getString(1)+"&patientAge="+rs1.getString(5)+"&patientOccupation="+rs1.getString(8)+"&patientAddress="+rs1.getString(7)+"&patientNextToKin="+rs1.getString(10)+"&patientContact="+rs1.getString(4)+"&dateOfAdmission="+AdmissionDate+"&primaryDiagnosis="+rs1.getString(14)+"&patientRefrence="+rs1.getString(23)+"&ipdsurgeon="+rs1.getString(18)+"&surgeryDate="+SurgeryDate+"&m_name="+rs1.getString(2)+"&l_name="+rs1.getString(3)+"&suregryDescription="+rs1.getString(26)+"&dischargedate="+DischargeDate+"&current=PatientManagement\"><i class=\"fa fa-print\" title=\"Generate Bill\"></i></a>");
				out.println("<a href=\"PatientProfilePage.jsp?ipdId="+rs1.getString(9)+"&name="+rs1.getString(3)+" "+rs1.getString(1)+" "+rs1.getString(2)+"&age="+rs1.getString(5)+"&gender="+rs1.getString(6)+"&contact="+rs1.getString(4)+"&address="+rs1.getString(7)+"&occ="+rs1.getString(8)+"&ntk="+rs1.getString(10)+"&dateofadmission="+AdmissionDate+"&dateofdischarge="+rs1.getString(12)+"&pd="+rs1.getString(14)+"&fd="+rs1.getString(15)+"&cod="+rs1.getString(16)+"&dcno="+rs1.getString(17)+"&dcid="+rs1.getString(22)+"&rd="+rs1.getString(23)+"&surgeon="+rs1.getString(18)+"&dateofsurgery="+SurgeryDate+"&anaesthetist="+rs1.getString(20)+"&anaesthesiatype="+rs1.getString(21)+"&mlcno="+rs1.getString(25)+"&suregryDescription="+rs1.getString(26)+"&dateofexpiry="+ExpiryDate+"&cod="+rs1.getString(16)+"&dcno="+rs1.getString(17)+"&dcid="+rs1.getString(22)+"\"><i class=\"fa fa-user\" title=\"Print Patient Profile\"></i></a>");
				if( rs1.getString(12) == null || rs1.getString(12).equals("")){
					out.println("<a href=\"#small-dialog6\"  class=\"popup-with-zoom-anim\" onClick=\"sendAdvanceIPDId('"+rs1.getString(9)+"','"+AdmissionDate+"')\"><i class=\"fa fa-inr\" title=\"Advance Amount\"></i></a>");
					out.println("<i class=\"fa fa-download\" title=\"Print Discharge Card\" style=\"background-color:#CCC;\"></i>");
					out.println("<a href=\"EstimatedBill.jsp?ipdId="+rs1.getString(9)+"&fName="+rs1.getString(1)+"&patientAge="+rs1.getString(5)+"&patientOccupation="+rs1.getString(8)+"&patientAddress="+rs1.getString(7)+"&patientNextToKin="+rs1.getString(10)+"&patientContact="+rs1.getString(4)+"&dateOfAdmission="+AdmissionDate+"&primaryDiagnosis="+rs1.getString(14)+"&patientRefrence="+rs1.getString(23)+"&ipdsurgeon="+rs1.getString(18)+"&surgeryDate="+SurgeryDate+"&m_name="+rs1.getString(2)+"&l_name="+rs1.getString(3)+"&suregryDescription="+rs1.getString(26)+"&dischargedate="+rs1.getString(12)+"&current=PatientManagement\"><i class=\"fa fa-calculator\" title=\"Estimated Bill\"></i></a>");
				}else{
					out.println("<a href=\"DischargeCardForm.jsp?ipdId="+rs1.getString(9)+"&patientname="+rs1.getString(1)+" "+rs1.getString(2)+" "+rs1.getString(3)+"&patientaddress="+rs1.getString(7)+"&gender="+rs1.getString(6)+"&age="+rs1.getString(5)+"&dateofadmission="+AdmissionDate+"&dateofdischarge="+rs1.getString(12)+"&surgeon="+rs1.getString(18)+"&reference="+rs1.getString(23)+"&finaldiagnosis="+rs1.getString(15)+"&dateofsurgery="+SurgeryDate+"&anaesthetist="+rs1.getString(20)+"&anaesthesiatype="+rs1.getString(21)+"&billId="+rs1.getString(24)+"&mlcno="+rs1.getString(25)+"&suregryDescription="+rs1.getString(26)+"&current=dashboard\"><i class=\"fa fa-download\" title=\"Print Discharge Card\"></i></a>");
					out.println("<i class=\"fa fa-inr\" title=\"Advance Amount\" style=\"background-color:#777;\"></i>");
					out.println("<i class=\"fa fa-calculator\" style=\"background-color:#777;\" title=\"Estimated Bill\"></i>");
				}
				out.println("</td>");
				out.println("</tr>");
			}			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(con!=null){
					con.close();
				}
			}catch(SQLException sqe){
				sqe.printStackTrace();
			}
		}
		
		
		
		return SKIP_BODY;
	}

}
