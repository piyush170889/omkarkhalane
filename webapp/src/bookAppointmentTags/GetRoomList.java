package bookAppointmentTags;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import dao.Connection_Provider;

public class GetRoomList extends TagSupport{

	private static final long serialVersionUID = 1L;
	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		try{
			String getDoctorListSql = "select room_per_price,room_type from omk_room";
			PreparedStatement ps = con.prepareStatement(getDoctorListSql);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				out.println("<option value="+rs.getString(1)+">"+rs.getString(2)+"</option>");
			}
		}catch(Exception e){
			e.printStackTrace();
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
