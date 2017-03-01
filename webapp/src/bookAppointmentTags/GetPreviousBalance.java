package bookAppointmentTags;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import dao.Connection_Provider;

public class GetPreviousBalance extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2364319274919379329L;
	
	String billId;
	
	public void setBillId(String billId) {
		this.billId = billId;
	}

	@Override
	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		try{
			PreparedStatement ps = con.prepareStatement("select bill_balance from omk_opd_billing_details as bill inner join omk_opd_appointments as opd on opd.opd_bill_id=bill.bill_id where bill_id=?");
			ps.setString(1, billId);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				out.println(rs.getString(1));
			}else{
				out.println("0");
			}
			
		}catch(Exception e){
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
