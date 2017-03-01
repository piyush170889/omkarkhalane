package bookAppointmentTags;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import dao.Connection_Provider;

public class ReferenceDoctorReport extends TagSupport{
	
	String startDate;
	String endDate;
	String searchQuery,searchQuery1,searchQuery2;
	int ipdbill=0,opdbill=0;
	
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
			
			searchQuery="SELECT Rd_name,Rd_id FROM omk_db.omk_refernce_doctor ";
			PreparedStatement ps = con.prepareStatement(searchQuery);
			
			ResultSet rs = ps.executeQuery();
			out.println("<thead><tr>");
			
			out.println("<th>Refernce Doctor name </th>");
			out.println("<th>Total Reffered Ipd Patient</th>");
			out.println("<th>Total Reffered Opd Patient</th>");
			out.println("<th>Total Collection from IPD </th>");
			out.println("<th>Total Collection from OPD </th>");
			
			
			out.println("</thead></tr>");
			if(rs.next()){
				rs.previous();
				while(rs.next()){
				searchQuery1="select count(*) from omk_ipd_appointments where ipd_reference_doctor=? and DATE(admitted_on_datetime)>=? and DATE(admitted_on_datetime)<=?";
				PreparedStatement ps1 = con.prepareStatement(searchQuery1);
				ps1.setString(1, rs.getString(1));
				ps1.setString(2, startDate);
				ps1.setString(3, endDate);
				
				ResultSet rs1 = ps1.executeQuery();
				rs1.next();
				searchQuery2="select count(*) from omk_opd_appointments where opd_reference_doctor=? and opd_appointment_status='Attended' and  DATE(opd_datetime_of_appointment)>=? and DATE(opd_datetime_of_appointment)<=?";
				PreparedStatement ps2 = con.prepareStatement(searchQuery2);
				ps2.setString(1, rs.getString(1));
				ps2.setString(2, startDate);
				ps2.setString(3, endDate);
				
				ResultSet rs2 = ps2.executeQuery();
				rs2.next();
				out.println("<tr>");
				out.println("<td>"+rs.getString(1)+"</dh>");
				if(rs1.getInt(1)==0 ){
					out.println("<td>"+rs1.getString(1)+"</td>");
				}else{
					out.println("<td><a href=\"RefferedPatient.jsp?type=IPD&current=Reports&reffered="+rs.getString(1)+"&id="+rs.getString(2)+"&startDate="+startDate+"&endDate="+endDate+"\">"+rs1.getString(1)+"</a></td>");
				}
				if(rs2.getInt(1)==0){
					out.println("<td>"+rs2.getString(1)+"</td>");
				}else{
					out.println("<td><a href=\"RefferedPatient.jsp?type=OPD&current=Reports&reffered="+rs.getString(1)+"&id="+rs.getString(2)+"&startDate="+startDate+"&endDate="+endDate+"\">"+rs2.getString(1)+"</a></td>");
				}
				
				searchQuery1="select sum(ipd_bill_totalbill) from omk_ipd_appointments inner join omk_ipd_billing_details on billing_id_ipd=ipd_billing_id where ipd_reference_doctor=? and DATE(admitted_on_datetime)>=? and DATE(admitted_on_datetime)<=?";
				searchQuery2="select sum(bill_total)  from omk_opd_appointments inner join omk_opd_billing_details on bill_id=opd_bill_id where opd_reference_doctor=? and opd_appointment_status='Attended' and  DATE(opd_datetime_of_appointment)>=? and DATE(opd_datetime_of_appointment)<=?";
				
				ps2 = con.prepareStatement(searchQuery1);
				
				ps2.setString(1, rs.getString(1));
				ps2.setString(2, startDate);
				ps2.setString(3, endDate);
				
				ps1 = con.prepareStatement(searchQuery2);
				
				ps1.setString(1, rs.getString(1));
				ps1.setString(2, startDate);
				ps1.setString(3, endDate);
				
				rs1 = ps1.executeQuery();//OPD
				rs2 = ps2.executeQuery();//IPD
				if(rs1.next())
				{
					if(rs2.next())
					{
						if(rs2.getString(1) == null){
							out.println("<td>0</td>");
						}else{
							out.println("<td>"+rs2.getString(1)+"</td>");
						}
					}
					if(rs1.getString(1) == null){
						out.println("<td>0</td>");
					}else{
						out.println("<td>"+rs1.getString(1)+"</td>");
					}
				}
				out.println("</tr>");
				}
			}else{
				out.println("<td>No Data available to show</td>");
			}
		}catch(Exception e){
			try {
				con.rollback();
				e.printStackTrace();
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
