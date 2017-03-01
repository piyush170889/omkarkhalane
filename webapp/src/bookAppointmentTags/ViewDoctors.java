package bookAppointmentTags;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import dao.Connection_Provider;

public class ViewDoctors extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6854889911265686443L;

	@Override
	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		try{
			PreparedStatement ps = con.prepareStatement("select  doc_id,doc_name,doc_age,doc_gender,doc_address,doc_contact,doc_consulting_fees,education,specialization,med_reg_no,doc_srno from omk_doctor_details");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				out.println("<tr>");
				out.println("<td style=\"display:none;\">"+rs.getInt(11)+"</td>");
				out.println("<td>"+rs.getString(1)+"</td>");
				out.println("<td>"+rs.getString(2)+"</td>");
				out.println("<td>"+rs.getString(3)+"</td>");
				out.println("<td>"+rs.getString(4)+"</td>");
				out.println("<td>"+rs.getString(5)+"</td>");
				out.println("<td>"+rs.getString(6)+"</td>");
				out.println("<td>"+rs.getString(7)+"</td>");
				out.println("<td>"+rs.getString(8)+"</td>");
				out.println("<td>"+rs.getString(9)+"</td>");
				out.println("<td>"+rs.getString(10)+"</td>");
				out.println("<td><a href=\"#small-dialog2\" class=\"popup-with-zoom-anim\" onClick=\"sendDocotrVal('"+rs.getString(1)+"','"+rs.getString(2)+"','"+rs.getString(3)+"','"+rs.getString(4)+"','"+rs.getString(5)+"','"+rs.getString(6)+"','"+rs.getString(7)+"','"+rs.getString(8)+"','"+rs.getString(9)+"','"+rs.getString(10)+"')\"><i class=\"fa fa-pencil\"></i></a><a href=\"deleteService?id="+rs.getString(1)+"&requesttype=doctor&userid="+rs.getString(2)+"\" onclick=\"return confirm('Are you sure?')\"><i class=\"fa fa-trash\"></i></a></td>");
				
			}
			
		} catch(Exception e){
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			try {
				con.commit();
				if(con != null){
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return SKIP_BODY;
	}
}
