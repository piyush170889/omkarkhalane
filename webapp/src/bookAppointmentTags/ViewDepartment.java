package bookAppointmentTags;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import dao.Connection_Provider;

public class ViewDepartment extends TagSupport {

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
			PreparedStatement ps = con.prepareStatement("select  D_id,D_name,HOD,c_date,srno from omk_departments");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				out.println("<tr>");
				out.println("<td style=\"display:none;\">"+rs.getInt(5)+"</td>");
				out.println("<td>"+rs.getString(1)+"</td>");
				out.println("<td>"+rs.getString(2)+"</td>");
				out.println("<td>"+rs.getString(3)+"</td>");
				out.println("<td>"+rs.getString(4)+"</td>");
				
				out.println("<td><a href=\"#small-dialog5\" class=\"popup-with-zoom-anim\" onClick=\"sendDepartmentVal('"+rs.getString(1)+"','"+rs.getString(2)+"','"+rs.getString(3)+"')\"><i class=\"fa fa-pencil\"></i></a><a href=\"DeleteDepartment?id="+rs.getString(1)+"\" onclick=\"return confirm('Are you sure?')\"><i class=\"fa fa-trash\"></i></a></td>");
				
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
				if(con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return SKIP_BODY;
	}
}
