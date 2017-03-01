package bookAppointmentTags;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import dao.Connection_Provider;

public class GetReceptionId extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 982749592087006352L;
	
	@Override
	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		
		//Get Connection Details
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		String maxBookId;
		try{			
			PreparedStatement pst0 = con.prepareStatement("select count(*) from omk_db.omk_reception_details");
			ResultSet rs0 = pst0.executeQuery();
			rs0.next();
			if(rs0.getInt(1) == 0){
				out.println("R1");
			}else{
				PreparedStatement pst = con.prepareStatement("select max(reception_srno) from omk_db.omk_reception_details");
				ResultSet rs = pst.executeQuery();
				if(rs.next()){
					int maxsrno = rs.getInt(1);
					if(maxsrno == 0){
						maxBookId = Integer.toString(rs.getInt(1)+2);
					}else{
						maxBookId = Integer.toString(rs.getInt(1)+1);
					}
					out.println("R"+maxBookId);
				}else{
					throw new Exception("Something went wrong. Please contact your administrator");
				}
			}	
			
		}catch(Exception e){
			try {
				out.println(e.getMessage());
			} catch (IOException e1) {
				e1.printStackTrace();
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
