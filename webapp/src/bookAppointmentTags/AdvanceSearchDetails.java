package bookAppointmentTags;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import utilities.CommonUtilities;
import dao.Connection_Provider;

public class AdvanceSearchDetails extends TagSupport {
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

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7750902437712410898L;
	
	@Override
	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			if(searchType.equals("OPD")){
				searchQuery = "select opd_id as OPD_ID,f_name,m_name,l_name,patient_contact as Contact,o_ipd_id as IPD_ID,opd_appointment_for as Appointment_For,DATE_FORMAT(opd_registration_datetime,'%d-%m-%y %H:%i') as Booking_Date,opd_consulting_doctor as Consulting_Doctor,opd_reference_doctor as Reference_Doctor,DATE_FORMAT(opd_datetime_of_appointment,'%d-%m-%y %H:%i') as Date_Of_Appointment from omk_opd_appointments as opd inner join omk_book_appointment as book on opd.opd_id=book.b_opd_id where DATE(opd_datetime_of_appointment)>=? and DATE(opd_datetime_of_appointment)<=?";
			}else if(searchType.equals("IPD")){
				searchQuery = "select ipd_id as IPD_ID,f_name,m_name,l_name,DATE_FORMAT(admitted_on_datetime,'%d-%m-%y %H:%i') as Admitdate,DATE_FORMAT(discharge_on_datetime,'%d-%m-%y %H:%i') as Dischargedate,DATE_FORMAT(expiry_on_datetime,'%d-%m-%y %H:%i') as Expirydate, primary_diagnosis,final_diagnosis,surgeon,DATE_FORMAT(datetime_of_surgery,'%d-%m-%y %H:%i') as date_of_surgery from omk_ipd_appointments as ipd inner join omk_book_appointment as book on ipd.ipd_id=book.b_ipd_id where DATE(admitted_on_datetime)>=? and DATE(admitted_on_datetime)<=?";
			}else if(searchType.equals("--Select--")){
				out.println("<script type=\"text/javascript\">alert('Please select search type');</script>");
				/*utilities.CommonUtilities.returnToDashboard();*/
			}

			ps = con.prepareStatement(searchQuery);
			ps.setString(1, startDate);
			ps.setString(2, endDate);
			
			rs = ps.executeQuery();
			if(rs.next()){
				ResultSetMetaData rmd = rs.getMetaData();
				
				int columnCount = rmd.getColumnCount();
				
				out.println("<thead><tr>");
				out.println("<th>ID</th>");
				out.println("<th>Name</th>");
				for(int i=5; i<=columnCount;i++){
					out.println("<th>"+rmd.getColumnName(i)+"</th>");
				}
				out.println("</thead></tr>");
				rs.beforeFirst();
					while(rs.next()){
						out.println("<tr>");
						out.println("<td>"+rs.getString(1)+"</td>");
						out.println("<td>"+rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4)+"</td>");
						for(int i=5;i<=columnCount;i++){
							out.println("<td>"+rs.getString(i)+"</td>");
						}
						out.println("</tr>");
				}
			}else{
				out.println("<thead><tr>");
				out.println("</thead></tr>");
				out.println("<tr>");
				out.println("<td>No Data Available to Display</td>");
				out.println("</tr>");
				
			}
		}catch(Exception e){
			try {
				con.rollback();
				out.println(CommonUtilities.showErrorMessage(e));
			}  catch(Exception e2){
				e2.printStackTrace();
			} finally{
				try {
					if(ps != null)
					ps.close();
					
					if(rs != null)
					rs.close();
					
					if(con != null)
					con.close();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		}
		return SKIP_BODY;
	}

}
