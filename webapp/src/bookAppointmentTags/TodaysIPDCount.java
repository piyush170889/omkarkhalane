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

public class TodaysIPDCount extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6767719460002016785L;

	@Override
	public int doStartTag() throws JspException {
		String TodaysIPDCount = "0";
		 JspWriter out=pageContext.getOut();//returns the instance of JspWriter  
		 Connection con =null;
		    try{
		    	
		    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String currDate = sdf.format(new Date());
				Connection_Provider connectionProvider = new Connection_Provider();
				con = connectionProvider.getConnection();
				PreparedStatement pst = con.prepareStatement("select count(*) from omk_db.omk_ipd_appointments where DATE(admitted_on_datetime)=?");
				pst.setString(1, currDate);
				ResultSet rs = pst.executeQuery();
				rs.next();
				TodaysIPDCount = Integer.toString(rs.getInt(1));
				out.println(TodaysIPDCount);
			}catch(Exception e){
				try {
					out.println(e.getMessage());
				} catch (IOException e1) {
					// TODO Auto-generated catch block
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
