package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utilities.CommonUtilities;

import dao.Connection_Provider;

/**
 * Servlet implementation class OPDDuplicateBillPrint
 */
@WebServlet("/OPDDuplicateBillPrint")
public class OPDDuplicateBillPrint extends HttpServlet {
	private static final long serialVersionUID = 1L;
   	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

   		Connection con = null;
   		PrintWriter out = response.getWriter();
   		
		try{
			String opdId = request.getParameter("opdId").trim();
			String dateOfAppointment = request.getParameter("dateOfAppointment").trim();
			String billid=request.getParameter("billid");
			
			Connection_Provider connectionProvider = new Connection_Provider();
			con = connectionProvider.getConnection();
			PreparedStatement ps = con.prepareStatement("select F_name,m_name,l_name,patient_contact,patient_age,patient_gender,patient_address,patient_occupation,b_datetime_of_appointment,opd_id,opd_appointment_for,opd_consulting_doctor,opd_reference_doctor,opd_bill_id from omk_opd_appointments inner join omk_book_appointment on b_opd_id=opd_id where opd_id='"+opdId+"' and opd_datetime_of_appointment='"+dateOfAppointment+"'");
			
			ResultSet rs = ps.executeQuery();
			
			PreparedStatement ps1 = con.prepareStatement("select bill_id,bill_total,bill_balance,bill_paid,bill_service_taken_id,bill_opd_id,opd_prev_bal,opd_discount,opd_subtotal from omk_opd_billing_details where bill_id='"+billid+"' and bill_opd_id='"+opdId+"'");
			
			ResultSet rs2 = ps1.executeQuery();
			
			if(rs.next()){
				if(rs2.next())
				{
					String name=rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(3);
					String gender=rs.getString(6);
					String contact=rs.getString(4);
					String age=rs.getString(5);
					String address=rs.getString(7);
					String occupation=rs.getString(8);
					String appointmentFor=rs.getString(11);
					String consultingDoctor=rs.getString(12);
					String maxServiceTakenId=rs2.getString(5);
					String consultingfees="0";
					//String totalPayable=rs2.getString(2);
					String discount=rs2.getString(8);
					String totalAmount=rs2.getString(2);
					String paidAmount=rs2.getString(4);
					String balanceAmount=rs2.getString(3);
					String prevbal=rs2.getString(7);
					String referenceDoctor=rs.getString(13);
					String billingId=billid;
					String subTotal = rs2.getString(9);
					
					
					response.sendRedirect("OPDBillPrint.jsp?id="+opdId+"&name="+name+"&gender="+gender+"&contact="+contact+"&age="+age+"&address="+address+"&occupation="+occupation+"&dateofappointment="+dateOfAppointment+"&appointmentfor="+appointmentFor+"&consultingdoctor="+consultingDoctor+"&stid="+maxServiceTakenId+"&consultingfees="+consultingfees+"&totalpayable="+subTotal+"&discount="+discount+"&totalamount="+totalAmount+"&paid="+paidAmount+"&balance="+balanceAmount+"&prevbal="+prevbal+"&referenceDoc="+referenceDoctor+"&billingId="+billingId+"&current=dashboard");
					
				}	
			}else{
				throw new Exception("Cannot get record");
			}
		}catch(Exception e){
			out.println(CommonUtilities.showErrorMessage(e));
		}finally{
			if(con != null){
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	
   	
   	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
