package bookAppointmentTags;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import dao.Connection_Provider;

public class OPDBill_info extends TagSupport{
	private static final long serialVersionUID = 1L;
	String bill_id;
	String o_id;
	String temp;
    
	public void setBill_id(String bill_id) {
		this.bill_id = bill_id;
	}
	public void setO_id(String o_id) {
		this.o_id = o_id;
	}

	public int doStartTag() throws JspException {
		JspWriter out=pageContext.getOut();//returns the instance of JspWriter
		Connection con = null;
		try{			
			Connection_Provider connectionProvider = new Connection_Provider();
			con = connectionProvider.getConnection();
			PreparedStatement pst1;
			ResultSet rs11; 
			PreparedStatement pst = con.prepareStatement("select bill_id,bill_date_of_bill,bill_total,bill_paid,bill_balance,bill_service_taken_id,opd_prev_bal,opd_discount,opd_subtotal from omk_opd_billing_details as opdbill where bill_id='"+bill_id+"'");
			ResultSet rs = pst.executeQuery();
			out.println("<table border=\"0\" cellspacing=\"3\" cellpadding=\"5\"  class=\"book_appointment_table\"><tbody>");
				rs.next();
				out.println("<tr>");
				out.println("<td>Bill ID:</td><td>"+rs.getString(1)+"</td>");
				out.println("<td>Date of Bill:</td><td>"+rs.getString(2)+"</td>");
				out.println("</tr><tr>");
				out.println("<td>Sub-Total:</td><td>"+rs.getString(9)+"</td>");
				out.println("<td>Previous Balance:</td><td>"+rs.getString(7)+"</td>");
				out.println("<td>Discount:</td><td>"+rs.getString(8)+"</td>");
				out.println("</tr><tr>");
				out.println("<td>Total:</td><td>"+rs.getString(3)+"</td>");
				out.println("<td>Bill Paid:</td><td>"+rs.getString(4)+"</td>");
				out.println("<td>Bill Balance :</td><td>"+rs.getString(5)+"</td>");
				out.println("</tr>");
			out.println("</tbody></table>");
			
			out.println("<div class=\"advanceSearch\" style=\"margin:2em 0 2em 7em;border-radius:0;\"><h4 style=\"text-align:center;\"><i class=\"fa fa-file\"></i>Services Taken</h4>");
			out.println("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\"  class=\"responstable\" id=\"serviceTakenTable\">");
			out.println("<thead>");
			out.println("<th>Service Taken ID</th>");
			out.println("<th>Service Name</th>");
			out.println("<th>Service per Price</th>");
			out.println("<th>Service Quantity</th>");
			out.println("<th>Service Total Price</th>");
			out.println("</thead><tbody>");
				pst1=con.prepareStatement("select servicename,servicequantity,service_total_price,service_per_price,services_date_of_billing,servicetaken_id from omk_services_taken_details where servicetaken_id='"+rs.getString(6)+"'" );
				 rs11 = pst1.executeQuery();
				 while(rs11.next())
				 {
					out.println("<tr><td>"+rs11.getString(6)+"</td>");
					out.println("<td>"+rs11.getString(1)+"</td>");
					out.println("<td>"+rs11.getString(4)+"</td>");
					out.println("<td>"+rs11.getString(2)+"</td>");
					out.println("<td>"+rs11.getString(3)+"</td>");
					out.println("</tr>");
				 }
			out.println("</tbody></table></div>");		
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
