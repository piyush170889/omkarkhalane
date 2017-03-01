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



public class GetIPDPatientReport extends TagSupport {
	private static final long serialVersionUID = 1L;
	String Query,Query1;
	int sumtotal=0,sumpaid=0;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String currDate = sdf.format(new Date());
    String todaysAdvnaceAmountSQL = "SELECT SUM(amount) FROM omk_db.advance_amount where DATE(advance_datetime)='"+currDate+"'";   
	String advanceAmount="0";
	
	//GET Connection
	
    public int doStartTag() throws JspException {
		JspWriter out=pageContext.getOut();//returns the instance of JspWriter
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		
		try{
			Query="select f_name,m_name,l_name,surgeon,ipd_reference_doctor,ipd_billing_id,ipd_bill_totalbill,ipd_bill_paid,ipd_bill_balance,ipd_bill_subtotal,ipd_id,admitted_on_datetime from omk_ipd_appointments as ipd inner join omk_book_appointment as book on ipd.ipd_id=book.b_ipd_id inner join omk_ipd_billing_details as ipdbill on billing_id_ipd=ipd_billing_id where DATE(ipd_bill_generation_datetime)='"+currDate+"'";
			PreparedStatement pst = con.prepareStatement(Query);
			ResultSet rs = pst.executeQuery();

			PreparedStatement pst1 = con.prepareStatement(todaysAdvnaceAmountSQL);
			ResultSet rs2 = pst1.executeQuery();
			
			if(rs2.next()){
				if(rs2.getString(1)!=null)
					advanceAmount = rs2.getString(1);
			}else{
				advanceAmount = "0";
			}
			
			String individualAdvanceAmountPaidSQL = "select SUM(amount) from advance_amount where advance_ipd_id=? and admission_datetime=?";
			
			while (rs.next() ){
				// Individual Advance Amount Paid
				String advanceAmountPaid = "0";
				PreparedStatement pst2 = con.prepareStatement(individualAdvanceAmountPaidSQL);
				pst2.setString(1,rs.getString(11));
				pst2.setString(2,rs.getString(12));
				
				ResultSet rs3 = pst2.executeQuery();
				if(rs3.next() && rs3.getString(1) != null){
					advanceAmountPaid = rs3.getString(1);
				}
				
				out.println("<tr>");
				out.println("<td>"+rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(3)+"</td>");
				out.println("<td>"+rs.getString(4)+"</td>");
				out.println("<td>"+rs.getString(10)+"</td>");
				//INDIVIDUAL ADVACNCE PAID
				out.println("<td>"+advanceAmountPaid+"</td>");
				out.println("<td>"+rs.getString(7)+"</td>");
				out.println("<td>"+rs.getString(8)+"</td>");
				out.println("<td>"+rs.getString(9)+"</td>");
				out.println("</tr>");	
				if(!rs.getString(7).equals("") && rs.getString(7)!=null ){
				sumtotal=sumtotal+Integer.parseInt(rs.getString(7));
				}if(!rs.getString(8).equals("") && rs.getString(8)!=null ){
				sumpaid=sumpaid+Integer.parseInt(rs.getString(8));
				}
			}
			out.println("<tr>");
			out.println("<td>Total IPD Collection:</td><td>"+sumtotal+"</td>");
			out.println("<td>Paid IPD Collection:</td><td>"+sumpaid+"</td>");
			out.println("<td>Advance Amount Collection:</td><td >"+advanceAmount+"</td><td></td>");
			out.println("</tr>");
//			out.println("<tr>");
//			out.println("<td></td><td>Total OPD Collection:</td><td><input type=\"text\" value="+sumtotal+"/></td>");
//			out.println("<td></td><td>Paid OPD Collection:</td><td><input type=\"text\" value="+sumpaid+"/></td>");
//			out.println("<tr>");
		} catch(Exception e){
			e.printStackTrace();
		}finally{
			sumtotal = 0;
			sumpaid = 0;
			advanceAmount = "0";
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
