package bookAppointmentTags;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import utilities.CommonUtilities;

import dao.Connection_Provider;

public class TodaysIPDAppointmentDetails extends TagSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7187397591080834515L;

	public int doStartTag() throws JspException {
		JspWriter out=pageContext.getOut();//returns the instance of JspWriter
		Connection con = null;
		try{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String currDate = sdf.format(new Date());
			Connection_Provider connectionProvider = new Connection_Provider();
			con = connectionProvider.getConnection();
			
			PreparedStatement pst = con.prepareStatement("select ipd_id,f_name,patient_contact,DATE_FORMAT(admitted_on_datetime,'%d-%m-%y %H:%i'),DATE_FORMAT(ipd_registration_datetime,'%d-%m-%y %H:%i'),primary_diagnosis,surgeon,DATE_FORMAT(datetime_of_surgery,'%d-%m-%y %H:%i'),ipd_reference_doctor,admitted_on_datetime,next_to_kin,discharge_on_datetime,expiry_on_datetime,final_diagnosis,datetime_of_surgery,anaesthetist_doctor,anaesthesia_type,cause_of_death,death_certificate_no,death_certificate_issue_datetime,patient_age,patient_occupation,patient_address,m_name,l_name from omk_db.omk_ipd_appointments as ipd inner join omk_db.omk_book_appointment as bk on bk.b_ipd_id=ipd.ipd_id where DATE(admitted_on_datetime)=? LIMIT 0,100");
			pst.setString(1, currDate);
			ResultSet rs = pst.executeQuery();
			String surgrydate;
			while (rs.next()){
				out.println("<tr>");
				out.println("<td>"+rs.getString(1)+"</td>");
				out.println("<td>"+rs.getString(2)+" "+rs.getString(24)+" "+rs.getString(25)+"</td>");
				out.println("<td>"+rs.getString(3)+"</td>");
				out.println("<td>"+rs.getString(4)+"</td>");
				out.println("<td>"+rs.getString(5)+"</td>");
				out.println("<td>"+rs.getString(6)+"</td>");
				out.println("<td>"+rs.getString(7)+"</td>");
				if(rs.getString(8)==null){
					out.println("<td></td>");
				}else{
					out.println("<td>"+rs.getString(8)+"</td>");
				}
				if(rs.getString(15)==null || rs.getString(15).equals("null")){
					surgrydate="";
				}else{
					surgrydate=rs.getString(15);
				}
				out.println("<td>"+rs.getString(9)+"</td>");
				out.println("<td><a href=\"IPDBill.jsp?ipdId="+rs.getString(1)+"&fName="+rs.getString(2)+"&patientAge="+rs.getString(21)+"&patientOccupation="+rs.getString(22)+"&patientAddress="+rs.getString(23)+"&patientNextToKin="+rs.getString(11)+"&patientContact="+rs.getString(3)+"&dateOfAdmission="+rs.getString(10)+"&primaryDiagnosis="+rs.getString(6)+"&patientRefrence="+rs.getString(9)+"&ipdsurgeon="+rs.getString(7)+"&surgeryDate="+surgrydate+"&m_name="+rs.getString(24)+"&l_name="+rs.getString(25)+"&current=dashboard\"><i class=\"fa fa-print\" title=\"Generate Bill\"></i></a><a href=\"#small-dialog4\" class=\"popup-with-zoom-anim\" onClick=\"sendEditIPDVal('"+rs.getString(1)+"','"+rs.getString(2)+"','"+rs.getString(11)+"','"+rs.getString(10)+"','"+rs.getString(6)+"','"+rs.getString(7)+"','"+surgrydate+"','"+rs.getString(9).toString()+"','"+rs.getString(24)+"','"+rs.getString(25)+"')\"><i class=\"fa fa-pencil\" title=\"Edit Patient\"></i></a></td>");
				out.println("</tr>");			
			}			
		} catch(Exception e){
			/*try {
				out.println(e.getMessage());
				
			} catch (IOException e1) {
				e1.printStackTrace();
			}*/
			e.printStackTrace();
			try {
				out.println(CommonUtilities.showErrorMessage(e));
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		return SKIP_BODY;				
	}
}
