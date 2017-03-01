package bookAppointmentTags;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import dao.Connection_Provider;

public class GetServiceList extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5341044422797843016L;

	@Override
	public int doStartTag() throws JspException {
		JspWriter out =pageContext.getOut();
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		try{
			String serviceSelect = "select service_name,service_price from omk_service_details";
			PreparedStatement ps = con.prepareStatement(serviceSelect);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				rs.beforeFirst();
				while(rs.next()){
					out.println("<option value=\""+rs.getString(2)+"\">"+rs.getString(1)+"</option>");
				}
			}else{
				throw new Exception("Something went wrong.Cannot get records from DB.");
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
