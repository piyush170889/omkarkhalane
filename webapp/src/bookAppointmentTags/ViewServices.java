package bookAppointmentTags;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import dao.Connection_Provider;

public class ViewServices extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4730133442862694887L;

	@Override
	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		try{
			PreparedStatement ps = con.prepareStatement("select * from omk_service_details order by service_sr_no");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				out.println("<tr>");
				out.println("<td style=\"display:none;\">"+rs.getInt(1)+"</td>");
				out.println("<td>"+rs.getString(2)+"</td>");
				out.println("<td>"+rs.getString(3)+"</td>");
				out.println("<td>"+rs.getString(4)+"</td>");
				out.println("<td><a href=\"#small-dialog1\" class=\"popup-with-zoom-anim\" onClick=\"sendServiceVal('"+rs.getString(2)+"','"+rs.getString(3)+"','"+rs.getString(4)+"')\"><i class=\"fa fa-pencil\"></i></a><a href=\"deleteService?id="+rs.getString(2)+"&requesttype=service\" onclick=\"return confirm('Are you sure?')\"><i class=\"fa fa-trash\"></i></a></td>");
				
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
