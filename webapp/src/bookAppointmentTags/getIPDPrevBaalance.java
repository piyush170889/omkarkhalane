package bookAppointmentTags;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import utilities.CommonUtilities;

import dao.Connection_Provider;

public class getIPDPrevBaalance extends TagSupport {
	String ipdId;
	public void setIpdId(String ipdId) {
		this.ipdId = ipdId;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = -690856270462895461L;
	
	//DB Connection;
	Connection_Provider connectionProvider = new Connection_Provider();
	Connection con = connectionProvider.getConnection();
	
	@Override
	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		try{
			String prevBalQuery = "select max(ipd_bill_generation_datetime) from omk_ipd_billing_details where ipd_bill_ipd_id=?";
			PreparedStatement ps = con.prepareStatement(prevBalQuery);
			ps.setString(1, ipdId);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				String balanceQuery = "select ipd_bill_balance from omk_ipd_billing_details where ipd_bill_ipd_id=? and ipd_bill_generation_datetime=?";
				
				PreparedStatement ps1 = con.prepareStatement(balanceQuery);
				ps1.setString(1, ipdId);
				ps1.setString(2, rs.getString(1));
				
				ResultSet rs1 = ps1.executeQuery();
				
				if(rs1.next()){
					out.println(rs1.getString(1));
				}else{
					throw new Exception();
				}
			}else{
				out.println("0");
			}
		}catch(Exception e){
			try {
				out.println(CommonUtilities.showErrorMessage(e));
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
