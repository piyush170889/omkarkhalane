package bookAppointmentTags;

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

public class todaysBookAppointmentDetails extends TagSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public int doStartTag() throws JspException {
		JspWriter out=pageContext.getOut();//returns the instance of JspWriter
		Connection con = null;
		try{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String currDate = sdf.format(new Date());
			Connection_Provider connectionProvider = new Connection_Provider();
			con = connectionProvider.getConnection();
			
			PreparedStatement pst = con.prepareStatement("select srno,booking_id,f_name,patient_contact,patient_age,patient_gender,DATE_FORMAT(b_datetime_of_appointment,'%d-%m-%y %H:%i'),b_status,booking_date,patient_address,patient_occupation,b_datetime_of_appointment,m_name,l_name,appointment_for,consulting_doctor  from omk_db.omk_book_appointment where DATE(b_datetime_of_appointment)=? order by srno DESC LIMIT 0,100");
			pst.setString(1, currDate);
			ResultSet rs = pst.executeQuery();
			while (rs.next()){
				out.println("<tr>");
				out.println("<td>"+rs.getString(2)+"</td>");
				out.println("<td>"+rs.getString(3)+" "+rs.getString(13)+" "+rs.getString(14)+"</td>");
				out.println("<td>"+rs.getString(4)+"</td>");
				out.println("<td>"+rs.getString(5)+"</td>");
				out.println("<td>"+rs.getString(6)+"</td>");
				out.println("<td>"+rs.getString(7)+"</td>");
				out.println("<td>"+rs.getString(8)+"</td>");
				out.println("<td>"+rs.getString(9)+"</td>");
				out.println("<td>"+rs.getString(15)+"</td>");
				out.println("<td>"+rs.getString(16)+"</td>");
				out.println("<td>");
				if(rs.getString(8).equalsIgnoreCase("Registered For OPD") || rs.getString(8).equalsIgnoreCase("Registered For IPD") || rs.getString(8).equalsIgnoreCase("Registered For Both")){
					out.println("<i class=\"fa fa-check\" style=\"background-color:#777;\" title=\"Register Patient\"></i>");
					out.println("</a><a href=\"#small-dialog6\" class=\"popup-with-zoom-anim\" onClick=\"sendRegisterBookVal('"+rs.getString(2)+"','"+rs.getString(3)+"','"+rs.getString(4)+"','"+rs.getString(5)+"','"+rs.getString(6)+"','"+rs.getString(10)+"','"+rs.getString(11)+"','"+rs.getString(12)+"','"+rs.getString(13)+"','"+rs.getString(14)+"','"+rs.getString(15)+"','"+rs.getString(16)+"')\"><i class=\"fa fa-pencil\" title=\"Edit Patient Details\"></i></a>");
					out.println("<i class=\"fa fa-trash\" style=\"background-color:#777;\" title=\"Delete Patient Record\"></i>");
				}else{
					out.println("<a href=\"#small-dialog5\" class=\"popup-with-zoom-anim\" onClick=\"sendRegisterVal('"+rs.getString(3)+"','"+rs.getString(4)+"','"+rs.getString(5)+"','"+rs.getString(6)+"','"+rs.getString(10)+"','"+rs.getString(11)+"','"+rs.getString(12)+"','"+rs.getString(13)+"','"+rs.getString(14)+"','"+rs.getString(15)+"','"+rs.getString(16)+"')\"><i class=\"fa fa-check\" title=\"Register Patient\"></i>");
					out.println("</a><a href=\"#small-dialog1\" class=\"popup-with-zoom-anim\" onClick=\"sendBookVal('"+rs.getString(2)+"','"+rs.getString(3)+"','"+rs.getString(4)+"','"+rs.getString(5)+"','"+rs.getString(6)+"','"+rs.getString(10)+"','"+rs.getString(11)+"','"+rs.getString(12)+"','"+rs.getString(13)+"','"+rs.getString(14)+"','"+rs.getString(15)+"','"+rs.getString(16)+"')\"><i class=\"fa fa-pencil\" title=\"Edit Patient Details\"></i></a>");
					out.println("<a href=\"deleteBookedAppointment?id="+rs.getString(2)+"&requesttype=Booking&dateOfAppointment="+rs.getString(12)+"\" onclick=\"return confirm('Are you sure?')\" ><i class=\"fa fa-trash\" title=\"Delete Patient Record\"></i></a>");
				}				
				out.println("</td>");
				out.println("</tr>");			
			}
		} catch(Exception e){
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
