package bookAppointmentTags;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import dao.Connection_Provider;

public class ViewRoom extends TagSupport{
	
	private static final long serialVersionUID = 1L;

	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		try{
			PreparedStatement ps = con.prepareStatement("select * from omk_room");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				out.println("<tr>");
				out.println("<td style=\"display:none;\">"+rs.getInt(4)+"</td>");
				out.println("<td>"+rs.getString(1)+"</td>");
				out.println("<td>"+rs.getString(2)+"</td>");
				out.println("<td>"+rs.getString(3)+"</td>");
				out.println("<td><a href=\"#small-dialog6\" class=\"popup-with-zoom-anim\" onClick=\"sendRoomVal('"+rs.getString(1)+"','"+rs.getString(2)+"','"+rs.getString(3)+"')\"><i class=\"fa fa-pencil\"></i></a><a href=\"deleteService?id="+rs.getString(1)+"&requesttype=room\" onclick=\"return confirm('Are you sure?')\"><i class=\"fa fa-trash\"></i></a></td>");
				
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
