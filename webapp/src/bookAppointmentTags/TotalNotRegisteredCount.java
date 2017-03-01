package bookAppointmentTags;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import dao.Connection_Provider;

public class TotalNotRegisteredCount extends TagSupport{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public int doStartTag() throws JspException {
		String totalAppointmentsNotRegistered = null;
		JspWriter out = pageContext.getOut();
		Connection con = null;
		
		try{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String currDate = sdf.format(new Date());
			Connection_Provider dao = new Connection_Provider();
			con = dao.getConnection();
			PreparedStatement pst = con.prepareStatement("select count(*) from omk_db.omk_book_appointment where DATE(b_datetime_of_appointment)=? and b_status=?");
			pst.setString(1, currDate);
			pst.setString(2, "Not Registered");
			ResultSet rs = pst.executeQuery();
			rs.next();
			totalAppointmentsNotRegistered = Integer.toString(rs.getInt(1));
			out.println(totalAppointmentsNotRegistered);
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
