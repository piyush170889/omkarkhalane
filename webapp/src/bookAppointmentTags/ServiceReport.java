package bookAppointmentTags;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import dao.Connection_Provider;

public class ServiceReport extends TagSupport {
	String startDate;
	String endDate;
	String searchQuery;
	
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
		int columnCount;
		try{
			
			searchQuery="SELECT servicename,service_per_price ,sum(service_total_price) FROM omk_services_taken_details where DATE(services_date_of_billing)>=? and DATE(services_date_of_billing)<=?  group by servicename";
			PreparedStatement ps = con.prepareStatement(searchQuery);
			ps.setString(1, startDate);
			ps.setString(2, endDate);
			
			ResultSet rs = ps.executeQuery();
			out.println("<thead><tr>");
			out.println("<th>Service Name</th>");
			out.println("<th>Service Per Price</th>");
			out.println("<th>Revenue Generated</th>");
			out.println("</thead></tr>");
			if(rs.next()){
				ResultSetMetaData rmd = rs.getMetaData();
				columnCount = rmd.getColumnCount();
				rs.previous();
				while(rs.next()){
						out.println("<tr>");
						for(int i=1;i<=columnCount;i++){
							out.println("<td>"+rs.getString(i)+"</td>");
						}
						out.println("</tr>");
					}
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
