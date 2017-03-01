package bookAppointmentTags;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import dao.Connection_Provider;

public class AdvanceSearchPatientDetails1 extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1866525421061201016L;
	String startDate;
	String endDate;
	String searchType;
	String searchQuery;
	
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	@Override
	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		try{
			if(searchType.equals("IPD")){
				PreparedStatement pst = con.prepareStatement("select ipd_id,f_name,patient_contact,DATE_FORMAT(admitted_on_datetime,'%d-%m-%y %H:%i'),DATE_FORMAT(ipd_registration_datetime,'%d-%m-%y %H:%i'),primary_diagnosis,surgeon,DATE_FORMAT(datetime_of_surgery,'%d-%m-%y %H:%i'),ipd_reference_doctor,admitted_on_datetime,next_to_kin,discharge_on_datetime,expiry_on_datetime,final_diagnosis,datetime_of_surgery,anaesthetist_doctor,anaesthesia_type,cause_of_death,death_certificate_no,death_certificate_issue_datetime,patient_age,patient_occupation,patient_address,m_name,l_name from omk_db.omk_ipd_appointments as ipd inner join omk_db.omk_book_appointment as bk on bk.b_ipd_id=ipd.ipd_id  where DATE(admitted_on_datetime)>=? and DATE(admitted_on_datetime)<=?");
				pst.setString(1, startDate);
				pst.setString(2, endDate);
				
				ResultSet rs = pst.executeQuery();
				while (rs.next()){
					out.println("<tr>");
					out.println("<td>"+rs.getString(1)+"</td>");
					out.println("<td><a href=\"PatientDetails.jsp?pd=IPD&contact="+rs.getString(3)+"&current=PatientManagement&id="+rs.getString(1)+"\">"+rs.getString(2)+" "+rs.getString(24)+" "+rs.getString(25)+"</a></td>");
					out.println("<td>"+rs.getString(3)+"</td>");
					out.println("<td>"+rs.getString(4)+"</td>");
					out.println("<td>"+rs.getString(5)+"</td>");
					out.println("<td>"+rs.getString(6)+"</td>");
					out.println("<td>"+rs.getString(7)+"</td>");
					out.println("<td>"+rs.getString(8)+"</td>");
					out.println("<td>"+rs.getString(9)+"</td>");
//					out.println("<td><a href=\"IPDBill.jsp?ipdId="+rs.getString(1)+"&f_name="+rs.getString(2)+"&m_name="+rs.getString(24)+"&l_name="+rs.getString(25)+"&patientAge="+rs.getString(21)+"&patientOccupation="+rs.getString(22)+"&patientAddress="+rs.getString(23)+"&patientNextToKin="+rs.getString(11)+"&patientContact="+rs.getString(3)+"&dateOfAdmission="+rs.getString(10)+"&primaryDiagnosis="+rs.getString(6)+"&patientRefrence="+rs.getString(9)+"&ipdsurgeon="+rs.getString(7)+"&surgeryDate="+rs.getString(15)+"&current=dashboard\"><i class=\"fa fa-print\"></i></a><a href=\"#small-dialog4\" class=\"popup-with-zoom-anim\" onClick=\"sendEditIPDVal('"+rs.getString(1)+"','"+rs.getString(2)+"','"+rs.getString(11)+"','"+rs.getString(10)+"','"+rs.getString(6)+"','"+rs.getString(14)+"','"+rs.getString(7)+"','"+rs.getString(15)+"','"+rs.getString(16)+"','"+rs.getString(17)+"','"+rs.getString(9).toString()+"','"+rs.getString(24)+"','"+rs.getString(25)+"')\"><i class=\"fa fa-pencil\"></i></a></td>");
					out.println("</tr>");			
				}		
			}else if(searchType.equals("OPD")){
				PreparedStatement pst = con.prepareStatement("select opd_id as OPD_ID,f_name as Name,patient_contact as Contact,DATE_FORMAT(opd_datetime_of_appointment,'%d-%m-%y %H:%i') as Date_Of_Appointment ,opd_consulting_doctor as Consulting_Doctor,opd_reference_doctor as Reference_Doctor,opd_datetime_of_appointment,opd_appointment_for,m_name,l_name from omk_opd_appointments as opd inner join omk_book_appointment as book on opd.opd_id=book.b_opd_id where DATE(opd_datetime_of_appointment)>=? and DATE(opd_datetime_of_appointment)<=? ");
				pst.setString(1, startDate);
				pst.setString(2, endDate);
				
				ResultSet rs = pst.executeQuery();
				while (rs.next()){
					out.println("<tr>");
					out.println("<td>"+rs.getString(1)+"</td>");
					out.println("<td><a href=\"PatientDetails.jsp?id="+rs.getString(1)+"&pd=OPD&current=PatientManagement&contact="+rs.getString(3)+"\">"+rs.getString(2)+" "+rs.getString(9)+" "+rs.getString(10)+"</a></td>");
					out.println("<td>"+rs.getString(3)+"</td>");
					out.println("<td>"+rs.getString(4)+"</td>");
					out.println("<td>"+rs.getString(8)+"</td>");
					out.println("<td>"+rs.getString(5)+"</td>");
					out.println("<td>"+rs.getString(6)+"</td>");				
					/*out.println("<td>");
					
					out.println("</a><a href=\"#small-dialog2\" class=\"popup-with-zoom-anim\" onClick=\"sendEditOPDVal('"+rs.getString(1)+"','"+rs.getString(2)+"','"+rs.getString(3)+"','"+rs.getString(8)+"','"+rs.getString(7)+"','"+rs.getString(5)+"','"+rs.getString(6)+"','"+rs.getString(9)+"','"+rs.getString(10)+"')\"><i class=\"fa fa-pencil\"></i></a>");
					
					out.println("<a href=\"DeletePatient?id="+rs.getString(1)+"&requesttype=OPD&dateOfAppointment="+rs.getString(7)+"\" onclick=\"return confirm('Are you sure?')\" ><i class=\"fa fa-trash\"></i></a>");
					
					out.println("</td>");*/
					out.println("</tr>");			
				}
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
