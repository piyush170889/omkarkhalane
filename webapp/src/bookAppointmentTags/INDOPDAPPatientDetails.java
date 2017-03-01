package bookAppointmentTags;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import dao.Connection_Provider;

/**
 * Servlet implementation class INDOPDAPPatientDetails
 */
@WebServlet("/INDOPDAPPatientDetails")
public class INDOPDAPPatientDetails extends TagSupport {
	private static final long serialVersionUID = 1L;


	
	String contact;
	String id;



	public void setContact(String contact) {
		this.contact = contact;
	}
	public void setId(String id) {
		this.id = id;
	}
	String	searchQuery;
	@Override
	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		if( id!="" && id!=null)
		{
			searchQuery = "select b_opd_id as 'OPD ID',patient_occupation as Occupation,f_name as Name,patient_contact as Contact,patient_age as Age,patient_gender as Gender,patient_address as Address,b_status as Status,opd_id as 'OPD ID',opd_datetime_of_appointment as 'Date of Appointment',opd_appointment_type as 'OPD Appointment Type',opd_appointment_for,opd_consulting_doctor as 'OPD Consulting Doctor',opd_reference_doctor as 'Reference Doctor',opd_date_of_billing as 'Date of Billing',bill_id as 'Bill ID',bill_paid as 'Bill Paid',bill_total as 'Total Bill',opd_appointment_status from omk_book_appointment as book inner join omk_opd_appointments as opd on book.b_opd_id=opd.opd_id and book.b_opd_id='"+id+"' left outer join omk_opd_billing_details as opdbill on bill_opd_id=opd_id and opd_bill_id=bill_id " ;
		}else if((contact!="" && contact!=null) )
		{
			searchQuery = "select b_opd_id as 'OPD ID',patient_occupation as Occupation,f_name as Name,patient_contact as Contact,patient_age as Age,patient_gender as Gender,patient_address as Address,b_status as Status,opd_id as 'OPD ID',opd_datetime_of_appointment as 'Date of Appointment',opd_appointment_type as 'OPD Appointment Type',opd_appointment_for,opd_consulting_doctor as 'OPD Consulting Doctor',opd_reference_doctor as 'Reference Doctor',opd_date_of_billing as 'Date of Billing',bill_id as 'Bill ID',bill_paid as 'Bill Paid',bill_total as 'Total Bill',opd_appointment_status from omk_book_appointment as book inner join omk_opd_appointments as opd on book.b_opd_id=opd.opd_id and book.patient_contact='"+contact+"' left outer join omk_opd_billing_details as opdbill on bill_opd_id=opd_id  and opd_bill_id=bill_id ";
		}
		try{
			PreparedStatement ps = con.prepareStatement(searchQuery);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				/*out.println("<tbody>");*/
				rs.beforeFirst();
				while(rs.next()){
					
					out.println("<tr>");
					out.println("<td>"+rs.getString(10)+"</td>");
					out.println("<td>"+rs.getString(11)+"</td>");
					out.println("<td>"+rs.getString(12)+"</td>");
					out.println("<td>"+rs.getString(13)+"</td>");
					out.println("<td>"+rs.getString(14)+"</td>");
					if(rs.getString(19).equals("Not Attended"))
					{
						out.println("<td>--</td>");
					}
					else{
						out.println("<td><a href=\"OPDBill_info.jsp?current=PatientManagement&billid="+rs.getString(16)+"&o_id="+rs.getString(1)+"&dateofappointment="+rs.getString(10)+"\">"+rs.getString(16)+"</td>");
					}
					out.println("</tr>");
				}
			}else{
				out.println("<script type=\"text/javascript\">alert('No Records Found')</script>");
			}
		}catch(Exception e){
			e.printStackTrace();
			try {
				con.rollback();
				
			}  catch(Exception e2){
				e2.printStackTrace();
			}
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
