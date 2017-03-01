package bookAppointmentTags;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import dao.Connection_Provider;

public class GetDepartmentList extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5420568071538029326L;
	
	@Override
	public int doStartTag() throws JspException {
			JspWriter out = pageContext.getOut();
			Connection_Provider dao = new Connection_Provider();
			Connection con = dao.getConnection();
			
			try{
				String getDoctorListSql = "SELECT D_name FROM omk_db.omk_departments";
				PreparedStatement ps = con.prepareStatement(getDoctorListSql);
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
					out.print("<option>"+rs.getString(1)+"</option>");
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
