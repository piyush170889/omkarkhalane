package bookAppointmentTags;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import dao.Connection_Provider;

public class GetRefernceIPDPatientDetails extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String refernceDoctor,id,startDate,endDate;
	public String getRefernceDoctor() {
		return refernceDoctor;
	}
	public void setRefernceDoctor(String refernceDoctor) {
		this.refernceDoctor = refernceDoctor;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
		String date="",surgeondate="";
		searchQuery = "select ipd_id,F_name,m_name,l_name,patient_contact,admitted_on_datetime,primary_diagnosis,surgeon,datetime_of_surgery from omk_db.omk_ipd_appointments as ipd inner join omk_db.omk_book_appointment as bk on bk.b_ipd_id=ipd.ipd_id where ipd_reference_doctor=? and DATE(admitted_on_datetime)>=? and DATE(admitted_on_datetime)<=? ";
		
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
				if(rs.getString(9)==null){
					surgeondate="";
				}else{
					surgeondate=rs.getString(9);
				}
				out.println("<tr>");
				out.println("<td>"+rs.getString(1)+"</td>");
				out.println("<td>"+rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4)+"</td>");
				out.println("<td>"+rs.getString(5)+"</td>");
				out.println("<td>"+date+"</td>");
				out.println("<td>"+rs.getString(7)+"</td>");
				out.println("<td>"+rs.getString(8)+"</td>");
				out.println("<td>"+surgeondate+"</td>");
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
