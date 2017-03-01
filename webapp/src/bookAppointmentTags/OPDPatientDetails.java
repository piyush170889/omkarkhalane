package bookAppointmentTags;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import dao.Connection_Provider;

/**
 * Servlet implementation class PatientDetails
 */
@WebServlet("/PatientDetails")
public class OPDPatientDetails extends TagSupport {
	private static final long serialVersionUID = 1L;
       
	public int doStartTag() throws JspException {
		JspWriter out=pageContext.getOut();//returns the instance of JspWriter
		Connection con = null;
		try{
			/*SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String currDate = sdf.format(new Date());*/
			Connection_Provider connectionProvider = new Connection_Provider();
			con = connectionProvider.getConnection();
			
			PreparedStatement pst = con.prepareStatement("select opd_id as OPD_ID,f_name as Name,patient_contact as Contact,DATE_FORMAT(opd_datetime_of_appointment,'%d-%m-%y %H:%i') as Date_Of_Appointment ,opd_consulting_doctor as Consulting_Doctor,opd_reference_doctor as Reference_Doctor,opd_datetime_of_appointment,opd_appointment_for,m_name,l_name from omk_opd_appointments as opd inner join omk_book_appointment as book on opd.opd_id=book.b_opd_id group by OPD_id order by opd_id DESC LIMIT 0,100 ");
			ResultSet rs = pst.executeQuery();
			while (rs.next()){
				out.println("<tr>");
				out.println("<td>"+rs.getString(1)+"</td>");
				out.println("<td><a href=\"PatientDetails.jsp?id="+rs.getString(1)+"&pd=OPD&current=PatientManagement\">"+rs.getString(2)+" "+rs.getString(9)+" "+rs.getString(10)+"</a></td>");
				out.println("<td>"+rs.getString(3)+"</td>");
				out.println("<td>"+rs.getString(4)+"</td>");
				out.println("<td>"+rs.getString(8)+"</td>");
				out.println("<td>"+rs.getString(5)+"</td>");
				out.println("<td>"+rs.getString(6)+"</td>");				


				out.println("<td>");
				
				out.println("</a><a href=\"#small-dialog2\" class=\"popup-with-zoom-anim\" onClick=\"sendEditOPDVal('"+rs.getString(1)+"','"+rs.getString(2)+"','"+rs.getString(3)+"','"+rs.getString(8)+"','"+rs.getString(7)+"','"+rs.getString(5)+"','"+rs.getString(6)+"','"+rs.getString(9)+"','"+rs.getString(10)+"')\"><i class=\"fa fa-pencil\"></i></a>");
				
//				out.println("<a href=\"DeletePatient?id="+rs.getString(1)+"&requesttype=OPD&dateOfAppointment="+rs.getString(7)+"\" onclick=\"return confirm('Are you sure?')\" ><i class=\"fa fa-trash\"></i></a>");
				
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
