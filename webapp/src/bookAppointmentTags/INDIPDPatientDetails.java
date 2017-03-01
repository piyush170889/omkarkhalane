package bookAppointmentTags;

import java.io.IOException;
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
 * Servlet implementation class INDIPDPatientDetails
 */
@WebServlet("/INDIPDPatientDetails")
public class INDIPDPatientDetails extends TagSupport {
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

		
		if( id!=null && id!="")
		{
			searchQuery = "select ipd_id,f_name,patient_age,patient_contact,patient_occupation,patient_address,admitted_on_datetime,discharge_on_datetime,expiry_on_datetime,datetime_of_surgery,m_name,l_name,patient_gender,b_opd_id,appointment_for,consulting_doctor from omk_book_appointment as book inner join omk_ipd_appointments as ipd on book.b_ipd_id=ipd.ipd_id and ipd_id='"+id+"' left outer join omk_ipd_billing_details as ipdbill on ipd.ipd_billing_id=ipdbill.billing_id_ipd ";
		}else if((contact!="" && contact!=null) )
		{
			searchQuery = "select ipd_id,f_name,patient_age,patient_contact,patient_occupation,patient_address,admitted_on_datetime,discharge_on_datetime,expiry_on_datetime,datetime_of_surgery,m_name,l_name,patient_gender,b_opd_id,appointment_for,consulting_doctor from omk_book_appointment as book inner join omk_ipd_appointments as ipd on book.b_ipd_id=ipd.ipd_id and patient_contact='"+contact+"' left outer join omk_ipd_billing_details as ipdbill on ipd.ipd_billing_id=ipdbill.billing_id_ipd ";
		}
		try{
//			PreparedStatement ps1 = con.prepareStatement("select count(*) from 
			
			PreparedStatement ps = con.prepareStatement(searchQuery);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				rs.beforeFirst();
				rs.next();
				out.println("<tr>");
				out.println("<td>ID:</td><td>"+rs.getString(1)+"</td>");
				out.println("<td>Name:</td><td>"+rs.getString(2)+" "+rs.getString(11)+" "+rs.getString(12)+"</td>");
				out.println("<td>Age:</td><td>"+rs.getString(3)+"</td>");
				out.println("</tr><tr>");
				out.println("<td>Contact:</td><td>"+rs.getString(4)+"</td>");
				out.println("<td>Occupation:</td><td>"+rs.getString(5)+"</td>");
				out.println("<td>Address:</td><td>"+rs.getString(6)+"</td></tr>");
				out.println("<tr>");
				out.println("<td colspan=\"6\"><a href=\"#small-dialog4\" class=\"popup-with-zoom-anim button\"  onclick=\"sendEditIPDVal('"+rs.getString(1)+"','"+rs.getString(2)+"','"+rs.getString(3)+"','"+rs.getString(4)+"','"+rs.getString("patient_gender")+"','"+rs.getString(6)+"','"+rs.getString(5)+"','','','','','','','"+rs.getString(11)+"','"+rs.getString(12)+"')\">Book Follow-Up Appointment</a></td>");
				if(rs.getString(14).equals("Not Registered")){
					out.println("<td ><a href=\"#small-dialog7\" class=\"popup-with-zoom-anim button\" onClick=\"sendIPDToOPDVal('"+rs.getString(2)+"','"+rs.getString(11)+"','"+rs.getString(12)+"','"+rs.getString(4)+"','"+rs.getString(3)+"','"+rs.getString(13)+"','"+rs.getString(5)+"','"+rs.getString(15)+"','"+rs.getString(16)+"','"+rs.getString(6)+"','"+rs.getString(1)+"')\">Transfer To OPD</a></td>");
					}else{
						out.println("<td ><input type=\"submit\" name=\"search\" value=\"Transfered TO OPD ID:"+rs.getString(14)+"\" style=\"font-family:Candara;margin: 0 1em;color: #FFFFFF;background-color: #337ab7;padding: 0.2em 1.4em 0.3em;border-radius: 3px;border: 1px solid #337ab7;\" /></a></td>");
					}
				
				out.println("</tr>");
			} else{
				out.println("<script type=\"text/javascript\">alert('No Record Found');</script>");
//				out.println(utilities.CommonUtilities.returnToDashboard());
			}
		}catch(Exception e){
			try {
				con.rollback();
				out.println(e.getMessage());
			} catch (IOException e1) {
				e1.printStackTrace();
			} catch(Exception e2){
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
