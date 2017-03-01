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

/**
 * Servlet implementation class PatientDetails
 */

public class GetOPDPatientReport extends TagSupport {
	private static final long serialVersionUID = 1L;
	String Query,Query1;
	int sumtotal=0,sumpaid=0;
    Connection con = null;
    
	public int doStartTag() throws JspException {
		JspWriter out=pageContext.getOut();//returns the instance of JspWriter  
		try{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String currDate = sdf.format(new Date());
			Connection_Provider connectionProvider = new Connection_Provider();
			con = connectionProvider.getConnection();
			Query="select f_name,opd_consulting_doctor,opd_reference_doctor,opd_bill_id,m_name,l_name from omk_opd_appointments as opd inner join omk_book_appointment as book on opd.opd_id=book.b_opd_id where DATE(opd_date_of_billing)='"+currDate+ "'";
			PreparedStatement pst = con.prepareStatement(Query);
			ResultSet rs = pst.executeQuery();
			
			while (rs.next() ){
				out.println("<tr>");
				
				
				Query1="select servicename,bill_total,bill_paid,bill_balance from omk_opd_billing_details as billd inner join omk_services_taken_details servicetk on servicetk.servicetaken_id=billd.bill_service_taken_id where bill_id='"+rs.getString(4)+"' and DATE(bill_date_of_bill)='"+currDate+"'";
				PreparedStatement pst1 = con.prepareStatement(Query1);
				ResultSet rs1 = pst1.executeQuery();
				if(rs1.next())
				{
				out.println("<td>"+rs.getString(1)+" "+rs.getString(5)+" "+rs.getString(6)+"</td>");
				out.println("<td>"+rs.getString(2)+"</td>");
				out.println("<td>"+rs.getString(3)+"</td>");
				out.println("<td>");
				}
				rs1.beforeFirst();
				while(rs1.next())
				{
					out.println(rs1.getString(1)+"<br>");
					
					
				}
				
				rs1.beforeFirst();
				if(rs1.next())
				{
					out.println("</td>");
					out.println("<td>"+rs1.getString(2)+"</td>");
					out.println("<td>"+rs1.getString(3)+"</td>");
					out.println("<td>"+rs1.getString(4)+"</td>");
					if(!rs1.getString(2).equals("") && rs1.getString(2)!=null  ){
					sumtotal=sumtotal+Integer.parseInt(rs1.getString(2));
					}if(!rs1.getString(3).equals("") && rs1.getString(3)!=null ){
					sumpaid=sumpaid+Integer.parseInt(rs1.getString(3));
					}
				}
				out.println("</tr>");
				
			}
			
			out.println("<tr>");
			out.println("<td>Total OPD Collection:</td><td>"+sumtotal+"</td>");
			out.println("<td>Paid OPD Collection:</td><td>"+sumpaid+"</td><td></td><td></td><td></td>");
			out.println("</tr>");
			
//			out.println("</tr>");
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			sumpaid = 0;
			sumtotal = 0;
			if(con != null){
				try {
					con.close();
				} catch (SQLException sqle) {
					// TODO Auto-generated catch block
					sqle.printStackTrace();
				}
			}
		}
		return SKIP_BODY;				
	}
  


}
