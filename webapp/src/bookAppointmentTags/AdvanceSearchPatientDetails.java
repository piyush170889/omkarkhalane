package bookAppointmentTags;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import dao.Connection_Provider;

@WebServlet("/AdvanceSearchPatientDetails")
public class AdvanceSearchPatientDetails extends TagSupport {
	
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

	
	
	private static final long serialVersionUID = 1L;
   
	@Override
	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			if(searchType.equals("OPD")){
				searchQuery = "select opd_id as OPD_ID,f_name as Name,patient_contact as Contact,DATE_FORMAT(opd_datetime_of_appointment,'%d-%m-%y %H:%i') as Date_Of_Appointment ,opd_consulting_doctor as Consulting_Doctor,opd_reference_doctor as Reference_Doctor,opd_datetime_of_appointment,m_name,l_name from omk_opd_appointments as opd inner join omk_book_appointment as book on opd.opd_id=book.b_opd_id where DATE(opd_datetime_of_appointment)>=? and DATE(opd_datetime_of_appointment)<=?";
			}else if(searchType.equals("IPD")){
				searchQuery = "select ipd_id as IPD_ID,f_name as Name,patient_contact as Contact,DATE_FORMAT(admitted_on_datetime,'%d-%m-%y %H:%i') as Admitdate,DATE_FORMAT(discharge_on_datetime,'%d-%m-%y %H:%i') as Dischargedate,DATE_FORMAT(expiry_on_datetime,'%d-%m-%y %H:%i') as Expirydate, final_diagnosis,DATE_FORMAT(datetime_of_surgery,'%d-%m-%y %H:%i') as date_of_surgery,admitted_on_datetime,discharge_on_datetime ,expiry_on_datetime,datetime_of_surgery,m_name,l_name from omk_ipd_appointments as ipd inner join omk_book_appointment as book on ipd.ipd_id=book.b_ipd_id where DATE(admitted_on_datetime)>=? and DATE(admitted_on_datetime)<=?";
			}
			ps = con.prepareStatement(searchQuery);
			ps.setString(1, startDate);
			ps.setString(2, endDate);
			
			rs = ps.executeQuery();
			
			if(rs.next()){
				ResultSetMetaData rmd = rs.getMetaData();
				
				int columnCount = rmd.getColumnCount();
				
				out.println("<thead><tr>");
				if(searchType.equals("IPD"))
				{
					out.println("<th>ID</th>");
					out.println("<th>Name</th>");
					
				for(int i=3; i<=8;i++){
					
					out.println("<th>"+rmd.getColumnName(i)+"</th>");
				}
				}else{
					out.println("<th>ID</th>");
					out.println("<th>Name</th>");
					for(int i=3; i<=columnCount-2;i++){
						
						out.println("<th>"+rmd.getColumnName(i)+"</th>");
					}
				}
				out.println("<th>Action</th>");
				out.println("</thead></tr>");
				rs.beforeFirst();
				if(searchType.equals("OPD"))
				{
					while(rs.next()){
						out.println("<tr>");
						out.println("<td>"+rs.getString(1)+"</td>");
						out.println("<td>"+rs.getString(2)+" "+rs.getString(8)+""+rs.getString(9)+"</td>");
						for(int i=3;i<=columnCount-2;i++){
							out.println("<td>"+rs.getString(i)+"</td>");
						}
						out.println("<td>");
						if(searchType.equals("IPD")){
							out.println("<a href=\"#small-dialog3\" class=\"popup-with-zoom-anim\" onClick=\"sendIPDValue('"+rs.getString(1)+"','"+rs.getString(2)+"','"+rs.getString(3)+"','"+rs.getString(9)+"','"+rs.getString(10)+"','"+rs.getString(11)+"','"+rs.getString(7)+"','"+rs.getString(12)+"','"+rs.getString(13)+"','"+rs.getString(14)+"')\"><i class=\"fa fa-pencil\"></i></a>");
						}
						else{
							out.println("<a href=\"#small-dialog2\" class=\"popup-with-zoom-anim\" onClick=\"sendOPDValue('"+rs.getString(1)+"','"+rs.getString(2)+"','"+rs.getString(3)+"','"+rs.getString(7)+"','"+rs.getString(5)+"','"+rs.getString(6)+"','"+rs.getString(8)+"','"+rs.getString(9)+"')\"><i class=\"fa fa-pencil\"></i></a>");
							
						}
						out.println("<a href=\"DeletePatient?id="+rs.getString(1)+"&requesttype="+searchType+"&dateOfAppointment="+rs.getString(7)+"\" onclick=\"return confirm('Are you sure?')\" ><i class=\"fa fa-trash\"></i></a>");
						
						out.println("</td>");
						out.println("</tr>");
					}
				}else{

					while(rs.next()){
						out.println("<tr>");
						out.println("<td>"+rs.getString(1)+"</td>");
						out.println("<td>"+rs.getString(2)+" "+rs.getString(13)+""+rs.getString(14)+"</td>");
						
						for(int i=3;i<=8;i++){
							out.println("<td>"+rs.getString(i)+"</td>");
						}
						
							
						
						out.println("<td>");
						if(searchType.equals("IPD")){
							out.println("<a href=\"#small-dialog3\" class=\"popup-with-zoom-anim\" onClick=\"sendIPDValue('"+rs.getString(1)+"','"+rs.getString(2)+"','"+rs.getString(3)+"','"+rs.getString(9)+"','"+rs.getString(10)+"','"+rs.getString(11)+"','"+rs.getString(7)+"','"+rs.getString(12)+"','"+rs.getString(13)+"','"+rs.getString(14)+"')\"><i class=\"fa fa-pencil\"></i></a>");
						}
						else{
							out.println("<a href=\"#small-dialog2\" class=\"popup-with-zoom-anim\" onClick=\"sendOPDValue('"+rs.getString(1)+"','"+rs.getString(2)+"','"+rs.getString(3)+"','"+rs.getString(7)+"','"+rs.getString(5)+"','"+rs.getString(6)+"','"+rs.getString(8)+"','"+rs.getString(9)+"')\"><i class=\"fa fa-pencil\"></i></a>");
							
						}
						out.println("<a href=\"DeletePatient?id="+rs.getString(1)+"&requesttype="+searchType+"&dateOfAppointment="+rs.getString(7)+"\" onclick=\"return confirm('Are you sure?')\" ><i class=\"fa fa-trash\"></i></a>");
						
						out.println("</td>");
						out.println("</tr>");
					}
				}
			}else{
				out.println("<td>No Data available to show</td>");
			}
		}catch(Exception e){
			try {
				con.rollback();
			} catch(Exception e2){
				e2.printStackTrace();
			}
		}finally{
			try{
				if(con!=null){
					con.close();
				}
				if(ps!=null){
					ps.close();
				}
				if(rs!=null){
					rs.close();
				}
			}catch(SQLException sqe){
				sqe.printStackTrace();
			}
		}
		return SKIP_BODY;
	}

	
	
}
