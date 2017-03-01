package bookAppointmentTags;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import dao.Connection_Provider;

public class GetRefernceDoctorDetails extends TagSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String refernceDoctor;
	String id;
	
	public String getRefernceDoctor() {
		return refernceDoctor;
	}
	public void setRefernceDoctor(String refernceDoctor) {
		this.refernceDoctor = refernceDoctor;
	}
	String searchQuery;
	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		searchQuery = "select Rd_id,Rd_name,Rd_age,Rd_gender,Rd_address,Rd_contact,Education,specialization from omk_refernce_doctor where Rd_id=?";
		
		try{

			
			PreparedStatement ps = con.prepareStatement(searchQuery);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				rs.beforeFirst();
				rs.next();
				out.println("<tr>");
				out.println("<td>Refernce Doctor ID:</td><td>"+rs.getString(1)+"</td>");
				out.println("<td>Name:</td><td>"+rs.getString(2)+"</td>");
				out.println("<td>Age:</td><td>"+rs.getString(3)+"</td>");
				out.println("</tr><tr>");
				out.println("<td>Contact:</td><td>"+rs.getString(6)+"</td>");
				out.println("<td>Gender:</td><td>"+rs.getString(4)+"</td>");
				out.println("<td>Address:</td><td>"+rs.getString(5)+"</td></tr>");
				out.println("<tr>");
				out.println("<td>Education:</td><td>"+rs.getString(7)+"</td>");
				out.println("<td>Specialization:</td><td>"+rs.getString(8)+"</td>");
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
