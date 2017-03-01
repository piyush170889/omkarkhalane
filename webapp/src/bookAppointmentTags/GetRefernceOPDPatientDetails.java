package bookAppointmentTags;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import dao.Connection_Provider;

public class GetRefernceOPDPatientDetails extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String id,refernceDoctor,startDate,endDate;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRefernceDoctor() {
		return refernceDoctor;
	}
	public void setRefernceDoctor(String refernceDoctor) {
		this.refernceDoctor = refernceDoctor;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	String searchQuery;
	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		String date="";
		searchQuery = "select opd_id ,f_name,m_name,l_name ,patient_contact,DATE_FORMAT(opd_datetime_of_appointment,'%d-%m-%y %H:%i')  ,opd_consulting_doctor ,opd_reference_doctor ,opd_datetime_of_appointment,opd_appointment_for from omk_opd_appointments as opd inner join omk_book_appointment as book on opd.opd_id=book.b_opd_id where opd_reference_doctor=? and opd_appointment_status='Attended' and  DATE(opd_datetime_of_appointment)>=? and DATE(opd_datetime_of_appointment)<=?  ";
		
		try{

			
			PreparedStatement ps = con.prepareStatement(searchQuery);
			ps.setString(1, refernceDoctor);
			ps.setString(2, startDate);
			ps.setString(3, endDate);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				if(rs.getString(6)==null){
					date="";
				}else{
					date=rs.getString(6);
				}
				out.println("<tr>");
				out.println("<td>"+rs.getString(1)+"</td>");
				out.println("<td>"+rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4)+"</td>");
				out.println("<td>"+rs.getString(5)+"</td>");
				out.println("<td>"+date+"</td>");
				out.println("<td>"+rs.getString(10)+"</td>");
				out.println("<td>"+rs.getString(7)+"</td>");
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
