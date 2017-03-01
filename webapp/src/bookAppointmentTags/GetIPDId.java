package bookAppointmentTags;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import dao.Connection_Provider;

public class GetIPDId extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8996835951113994905L;

	@Override
	public int doStartTag() throws JspException {
		String maxBookId;
		Connection con = null;
		try{			
			JspWriter out = pageContext.getOut();
			Connection_Provider connectionProvider = new Connection_Provider();
			con = connectionProvider.getConnection();
			PreparedStatement pst0 = con.prepareStatement("select count(*) from omk_db.omk_ipd_appointments");
			ResultSet rs0 = pst0.executeQuery();
			rs0.next();
			if(rs0.getInt(1) == 0){
				out.println("IP1");
			}else{
				PreparedStatement pst = con.prepareStatement("select max(ipd_srno) from omk_db.omk_ipd_appointments");
				ResultSet rs = pst.executeQuery();
				rs.next();
				int maxsrno = rs.getInt(1);
				if(maxsrno == 0){
					maxBookId = Integer.toString(rs.getInt(1)+2);
				}else{
					maxBookId = Integer.toString(rs.getInt(1)+1);
				}
				out.println("IP"+maxBookId);
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
