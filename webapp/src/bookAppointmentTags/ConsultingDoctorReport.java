package bookAppointmentTags;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import dao.Connection_Provider;

public class ConsultingDoctorReport extends TagSupport {
	

	String startDate;
	String endDate;
	String searchQuery,searchQuery1,searchQuery2;
	
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	
	
	private static final long serialVersionUID = 1L;
   
	@Override
	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		try{
			
			searchQuery="select doc_name,doc_consulting_fees from omk_doctor_details ";
			PreparedStatement ps = con.prepareStatement(searchQuery);
			//ps.setString(1, startDate);
			//ps.setString(2, endDate);
			
			ResultSet rs = ps.executeQuery();
			out.println("<thead><tr>");
			
			out.println("<th>Doctor name </th>");
			out.println("<th>Total Attended Ipd Patient</th>");
			out.println("<th>Total Attended Opd Patient</th>");
			out.println("<th>Revenue Generated</th>");
			
			
			out.println("</thead></tr>");

				while(rs.next()){
					searchQuery1="select count(*) from omk_ipd_appointments where surgeon=? and DATE(datetime_of_surgery)>=? and DATE(datetime_of_surgery)<=?";
					PreparedStatement ps1 = con.prepareStatement(searchQuery1);
					ps1.setString(1, rs.getString(1));
					ps1.setString(2, startDate);
					ps1.setString(3, endDate);
					
					ResultSet rs1 = ps1.executeQuery();
					rs1.next();
					searchQuery2="select count(*) from omk_opd_appointments where opd_consulting_doctor=? and opd_appointment_status='Attended' and  DATE(opd_datetime_of_appointment)>=? and DATE(opd_datetime_of_appointment)<=?";
					PreparedStatement ps2 = con.prepareStatement(searchQuery2);
					ps2.setString(1, rs.getString(1));
					ps2.setString(2, startDate);
					ps2.setString(3, endDate);
					
					ResultSet rs2 = ps2.executeQuery();
					rs2.next();
					
					out.println("<tr>");
					out.println("<td>"+rs.getString(1)+"</dh>");
					out.println("<td>"+rs1.getString(1)+"</td>");
					out.println("<td>"+rs2.getString(1)+"</td>");
					out.println("<td>"+rs.getInt(2)*(rs1.getInt(1)+rs2.getInt(1))+" </td>");
				}
		}catch(Exception e){
			try {
				con.rollback();
				e.printStackTrace();
			} catch(Exception e2){
				e2.printStackTrace();
			}finally{
				try{
					if(con!=null){
						con.close();
					}
				}catch(SQLException sqe){
					sqe.printStackTrace();
				}
			}
		}
		return SKIP_BODY;
	}


}
