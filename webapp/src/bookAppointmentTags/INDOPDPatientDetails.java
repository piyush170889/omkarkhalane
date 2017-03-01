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
 * Servlet implementation class ONDIPDPatientDetails
 */
@WebServlet("/ONDIPDPatientDetails")
public class INDOPDPatientDetails extends TagSupport {
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
			searchQuery = "select opd_id as 'OPD ID',patient_occupation as Occupation,f_name as Name,patient_contact as Contact,patient_age as Age,patient_gender as Gender,patient_address as Address,b_status as Status,opd_id as 'OPD ID',opd_datetime_of_appointment as 'Date of Appointment',opd_appointment_type as 'OPD Appointment Type',opd_appointment_for,opd_consulting_doctor as 'OPD Consulting Doctor',opd_reference_doctor as 'Reference Doctor',opd_date_of_billing as 'Date of Billing',bill_id as 'Bill ID',bill_paid as 'Bill Paid',bill_total as 'Total Bill',m_name,l_name,b_ipd_id from omk_book_appointment as book inner join omk_opd_appointments as opd on book.b_opd_id=opd.opd_id and book.b_opd_id='"+id+"' left outer join omk_opd_billing_details as opdbill on opd.opd_bill_id=opdbill.bill_id";
		}else if((contact!="" && contact!=null) )
		{
			searchQuery = "select opd_id as 'OPD ID',patient_occupation as Occupation,f_name as Name,patient_contact as Contact,patient_age as Age,patient_gender as Gender,patient_address as Address,b_status as Status,opd_id as 'OPD ID',opd_datetime_of_appointment as 'Date of Appointment',opd_appointment_type as 'OPD Appointment Type',opd_appointment_for,opd_consulting_doctor as 'OPD Consulting Doctor',opd_reference_doctor as 'Reference Doctor',opd_date_of_billing as 'Date of Billing',bill_id as 'Bill ID',bill_paid as 'Bill Paid',bill_total as 'Total Bill',m_name,l_name,b_ipd_id from omk_book_appointment as book inner join omk_opd_appointments as opd on book.b_opd_id=opd.opd_id and book.patient_contact='"+contact+"'  left outer join omk_opd_billing_details as opdbill on opd.opd_bill_id=opdbill.bill_id";
		}
		try{
			PreparedStatement ps = con.prepareStatement(searchQuery);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				rs.beforeFirst();
				rs.next();
				out.println("<tr>");
				out.println("<td>ID:</td><td>"+rs.getString(1)+"</td>");
				out.println("<td>Name:</td><td>"+rs.getString(3)+" "+rs.getString(19)+" "+rs.getString(20)+"</td>");
				out.println("<td>Contact:</td><td>"+rs.getString(4)+"</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td>Occupation:</td><td>"+rs.getString(2)+"</td>");
				out.println("<td>Age:</td><td>"+rs.getString(5)+"</td>");
				out.println("<td>Gender:</td><td>"+rs.getString(6)+"</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td>Address:</td><td>"+rs.getString(7)+"</td></tr>");
				out.println("<tr>");
				out.println("<td colspan=\"6\"><a href=\"#small-dialog2\" class=\"popup-with-zoom-anim\" onClick=\"sendEditOPDVal('"+rs.getString(1)+"','"+rs.getString(3)+"','"+rs.getString(4)+"','"+rs.getString(2)+"','"+rs.getString(5)+"','"+rs.getString(6)+"','"+rs.getString(7)+"','"+rs.getString(19)+"','"+rs.getString(20)+"','"+rs.getString(21)+"')\"><input type=\"submit\" name=\"search2\" value=\"Book Follow-Up Appointment\" style=\"font-family:Candara;margin: 0 1em;color: #FFFFFF;background-color: #337ab7;padding: 0.2em 1.4em 0.3em;border-radius: 3px;border: 1px solid #337ab7;\" /></a></td>");
				if(rs.getString(21).equals("Not Registered")){
				out.println("<td ><a href=\"#small-dialog5\" class=\"popup-with-zoom-anim\" onClick=\"sendOPDToIPDVal('"+rs.getString(3)+"','"+rs.getString(19)+"','"+rs.getString(20)+"','"+rs.getString(4)+"','"+rs.getString(5)+"','"+rs.getString(6)+"','"+rs.getString(2)+"','"+rs.getString(12)+"','"+rs.getString(13)+"','"+rs.getString(7)+"','"+rs.getString(1)+"')\"><input type=\"submit\" name=\"search\" value=\"Transfer To IPD \" style=\"font-family:Candara;margin: 0 1em;color: #FFFFFF;background-color: #337ab7;padding: 0.2em 1.4em 0.3em;border-radius: 3px;border: 1px solid #337ab7;\" /></a></td>");
				}else{
					out.println("<td ><input type=\"submit\" name=\"search\" value=\"Transfered TO IPD ID:"+rs.getString(21)+"\" style=\"font-family:Candara;margin: 0 1em;color: #FFFFFF;background-color: #337ab7;padding: 0.2em 1.4em 0.3em;border-radius: 3px;border: 1px solid #337ab7;\" /></a></td>");
				}
				out.println("</tr>");
			} else{
				out.println("<script type=\"text/javascript\">alert('No Record Found');</script>");
//				out.println(utilities.CommonUtilities.returnToDashboard());
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
