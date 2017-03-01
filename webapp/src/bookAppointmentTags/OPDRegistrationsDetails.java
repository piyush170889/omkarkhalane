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

public class OPDRegistrationsDetails extends TagSupport {
		
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public int doStartTag() throws JspException {
		JspWriter out=pageContext.getOut();//returns the instance of JspWriter  
		//GET Database Connection
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		try{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String currDate = sdf.format(new Date());
			
			PreparedStatement pst = con.prepareStatement("select opd_id,f_name,patient_contact,opd_appointment_for,opd_appointment_type,DATE_FORMAT(opd_datetime_of_appointment,'%d-%m-%y %H:%i'),opd_appointment_status,opd_consulting_doctor,opd_reference_doctor,opd_datetime_of_appointment,opd_date_of_billing,m_name,l_name,patient_age,patient_gender,patient_occupation,patient_address,o_ipd_id from omk_book_appointment as b inner join omk_opd_appointments as o on b.b_opd_id=o.opd_id where DATE(opd_datetime_of_appointment)=?  ");
			pst.setString(1, currDate);
			ResultSet rs = pst.executeQuery();
			while (rs.next()){
				out.println("<tr>");
				out.println("<td>"+rs.getString(1)+"</td>");
				out.println("<td>"+rs.getString(2)+" "+rs.getString(12)+" "+rs.getString(13)+"</td>");
				out.println("<td>"+rs.getString(3)+"</td>");
				out.println("<td>"+rs.getString(4)+"</td>");
				out.println("<td>"+rs.getString(5)+"</td>");
//				out.println("<td>"+rs.getString("registrationtime")+"</td>");
				out.println("<td>"+rs.getString(6)+"</td>");
				out.println("<td>"+rs.getString(7)+"</td>");
				out.println("<td>"+rs.getString(8)+"</td>");
				out.println("<td>"+rs.getString(9)+"</td>");
				out.println("<td><a href=\"PrintPrescription.jsp?referencedoc="+rs.getString(9)+"&opdId="+rs.getString(1)+"&patientName="+rs.getString(2)+" "+rs.getString(12)+" "+rs.getString(13)+"&patientContact="+rs.getString(3)+"&patientAge="+rs.getString(14)+"&patientGender="+rs.getString(15)+"&consultingDoctor="+rs.getString(8)+"&dateOfAppointment="+rs.getString(6)+"\"><i class=\"fa fa-download\" title=\"Print Prescription\"></i></a>");
				out.println("<a href=\"OPDBillprocess?opdId="+rs.getString(1)+"&dateOfAppointment="+rs.getString(10)+"\"><i class=\"fa fa-print\" title=\"Generate Bill\"></i></a>");
				if(rs.getString(18).equals("Not Registered")){
				out.println("<a href=\"#small-dialog7\" class=\"popup-with-zoom-anim\" onClick=\"sendOPDToIPDVal('"+rs.getString(2)+"','"+rs.getString(12)+"','"+rs.getString(13)+"','"+rs.getString(3)+"','"+rs.getString(14)+"','"+rs.getString(15)+"','"+rs.getString(16)+"','"+rs.getString(4)+"','"+rs.getString(8)+"','"+rs.getString(17)+"','"+rs.getString(1)+"')\"><i class=\"fa fa-expand\" title=\"Go to IPD\"></i></a>");
				}else{
					out.println("<i class=\"fa fa-expand\" style=\"background-color:#CCC;\" title=\"Transfer to IPD\"></i>");
				}
				if(rs.getString(7).equals("Attended")){
					//out.println("<i class=\"fa fa-print\" style=\"background-color:#CCC;\" title=\"Generate Bill\"></i>");
					out.println("<i class=\"fa fa-pencil\" style=\"background-color:#CCC;\" title=\"Edit Patient Detais\"></i>");
					out.println("<i class=\"fa fa-trash\" style=\"background-color:#CCC;\" title=\"Delete Patient\"></i>");
				}else{		
					out.println("<a href=\"#small-dialog2\" class=\"popup-with-zoom-anim\" onClick=\"sendEditOPDVal('"+rs.getString(1)+"','"+rs.getString(2)+"','"+rs.getString(3)+"','"+rs.getString(4)+"','"+rs.getString(10)+"','"+rs.getString(8)+"','"+rs.getString(9)+"','"+rs.getString(12)+"','"+rs.getString(13)+"')\"><i class=\"fa fa-pencil\" title=\"Edit Patient Detais\"></i></a><a href=\"deleteBookedAppointment?id="+rs.getString(1)+"&requesttype=OPD&dateOfAppointment="+rs.getString(10)+"\" onclick=\"return confirm('Are you sure?')\" ><i class=\"fa fa-trash\" title=\"Delete Patient\"></i></a><a href=\"#\"></a></td>");
				}
				out.println("</tr>");			
			}			
		} catch(Exception e){
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			try{
				con.commit();
				if(con != null)
					con.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
		return SKIP_BODY;				
	}
}
