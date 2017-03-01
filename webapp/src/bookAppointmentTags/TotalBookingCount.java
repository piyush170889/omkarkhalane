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

public class TotalBookingCount extends TagSupport{
		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
		String totalTodaysBooking = "0";
		
		public int doStartTag() throws JspException {  
			JspWriter out=pageContext.getOut();//returns the instance of JspWriter
			Connection con = null;
			try{
		    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String currDate = sdf.format(new Date());
				Connection_Provider dao = new Connection_Provider();
				con = dao.getConnection();
				PreparedStatement pst = con.prepareStatement("select count(*) from omk_db.omk_book_appointment where DATE(b_datetime_of_appointment)=?");
				pst.setString(1, currDate);
				ResultSet rs = pst.executeQuery();
				rs.next();
				totalTodaysBooking = Integer.toString(rs.getInt(1));
				out.println(totalTodaysBooking);
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
