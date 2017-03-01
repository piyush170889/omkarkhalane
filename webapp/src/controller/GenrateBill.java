package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Connection_Provider;

/**
 * Servlet implementation class GenrateBill
 */
@WebServlet("/GenrateBill")
public class GenrateBill extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private boolean isServiceTakenRecordCreated;
	private boolean isBillingRecordCreated;
	private String maxServiceTakenId;
      
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenrateBill() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		String currDate = sdf.format(new Date());		
		
		//Get Patient Details
		String opdId = request.getParameter("bookingid");
		String dateOfAppointment = request.getParameter("date_of_appointment");
		String appointmentFor = request.getParameter("appointment_for");
		String consultingDoctor = request.getParameter("consulting_doctor");
		String referenceDoctor = request.getParameter("reference_doctor");
		String name = request.getParameter("patient_name");
		String age = request.getParameter("patient_age");
		String gender = request.getParameter("patient_gender");
		String contact = request.getParameter("patient_contact_no");
		String address = request.getParameter("patient_address");
		String occupation = request.getParameter("patient_occupation");
		String consultingfees = request.getParameter("consulting_serviceValue");
		String totalPayable = request.getParameter("servicesTotalPrice");
		String discount = request.getParameter("Discount").trim();
		String prevbal = request.getParameter("previousbalance").trim();
		
		//GET Service Taken Details
		String[] serviceNames = request.getParameterValues("serviceName");
		String[] serviceValues = request.getParameterValues("serviceValue"); 
		String[] serviceQuantity = request.getParameterValues("quantity");
		String[] perServiceTotal = request.getParameterValues("serviceTotal");
		
		
		//GET Billing Details
		String totalAmount = request.getParameter("totalPayable");
		String paidAmount = request.getParameter("amountPaid");
		String balanceAmount = request.getParameter("amountBalance");
		String followUpDate = request.getParameter("followupdate"); 
		
		//Get Connection
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		
		try{
			//Required 
			if(serviceNames == null || serviceNames.length==0){
				String billid=request.getParameter("billId").trim();
				con.rollback();
				throw new Exception("Service Not Selected. Please Select Service");
				//String redirectURL = "OPDBill.jsp?opdId="+opdId+"&patientName="+name+"&patientGender="+gender+"&patientContact="+contact+"&patientAge="+age+"&patientAddress="+address+"&patientOccupation="+occupation+"&dateOfAppointment="+dateOfAppointment+"&appointmentFor="+appointmentFor+"&consultingDoctor="+consultingDoctor+"&consultingFees="+consultingfees+"&referenceDoctor="+referenceDoctor+"&billId="+billid+"&current=dashboard";
				//out.println("<script type=\"text/javascript\">alert('Please Select Services');</script>");
				//response.sendRedirect(redirectURL);
				
				//out.println("<script type=\"text/javascript\">self.location.href='"+redirectURL+"'</script>");
			}
			int maxServiceSrno;
			String billingId = null;
			
			//Step 1: Insert Service taken Details
			
			if(serviceNames != null && serviceNames.length >= 1){
				//Get ServiceTaken Id
				PreparedStatement pst0 = con.prepareStatement("select count(*) from omk_db.omk_services_taken_details");
				ResultSet rs0 = pst0.executeQuery();
				rs0.next();
				if(rs0.getInt(1) == 0){
					maxServiceTakenId = "ST1";
					maxServiceSrno = 1;
				}else{
					String serviceTakenIdSql = "select max(current_id) from omk_services_taken_details";
					PreparedStatement pst1 = con.prepareStatement(serviceTakenIdSql);
					ResultSet rs = pst1.executeQuery();
					if(rs.next()){
						maxServiceSrno = rs.getInt(1);
						if(maxServiceSrno == 0){
							maxServiceTakenId = "ST"+(rs.getInt(1)+2);
						}else{
							maxServiceTakenId = "ST"+(rs.getInt(1)+1);
						}
						maxServiceSrno = maxServiceSrno+1;
					}else{
						throw new Exception("Service Taken ID cannot be generated. Please contact your administrator");
					}
				}	
				
				//Insert service taken Details
				String InsertServiceDetails = "insert into omk_db.omk_services_taken_details(servicename,servicequantity,service_total_price,service_per_price,services_date_of_billing,servicetaken_id,current_id) values(?,?,?,?,?,?,?)";
				int i=0;
				
				for(i=0;i<serviceNames.length;i++){
					PreparedStatement pst2 = con.prepareStatement(InsertServiceDetails);
					pst2.setString(1, serviceNames[i]);
					pst2.setString(2, serviceQuantity[i]);
					pst2.setString(3, perServiceTotal[i]);
					pst2.setString(4, serviceValues[i]);
					pst2.setString(5, currDate);
					pst2.setString(6, maxServiceTakenId);
					pst2.setInt(7, maxServiceSrno);
					
					int result1 = pst2.executeUpdate();
					
					if(result1==1){
						//Required 
						isServiceTakenRecordCreated = true;
					}else{
						isServiceTakenRecordCreated = false;
						throw new Exception("Something Went Wrong while inserting service details. Contact your Administrator");
					}
				}
				
				if(i==serviceNames.length){
					//Step 2: Insert Billing Details
					//Get Billing Id
					String maxBillingId;
					
						PreparedStatement pst3 = con.prepareStatement("select count(*) from omk_db.omk_opd_billing_details");
						ResultSet rs1 = pst3.executeQuery();
						rs1.next();
						if(rs1.getInt(1) == 0){
							billingId = "BL1";
						}else{
							PreparedStatement pst4 = con.prepareStatement("select max(bill_srno) from omk_db.omk_opd_billing_details");
							ResultSet rs2 = pst4.executeQuery();
							if(rs2.next()){
								int maxBillsrno = rs2.getInt(1);
								if(maxBillsrno == 0){
									maxBillingId = Integer.toString(rs2.getInt(1)+2);
								}else{
									maxBillingId = Integer.toString(rs2.getInt(1)+1);
								}
								billingId = "BL"+maxBillingId;
							}else{
								throw new Exception("Something went wrong. Please contact your administrator");
							}
						}
						
						//Insert Billing Details
						String insertBillingSql = "insert into omk_opd_billing_details(bill_id,bill_date_of_bill,bill_total,bill_balance,bill_paid,bill_service_taken_id,bill_opd_id,bill_opd_datetime_of_appointment,opd_prev_bal,opd_discount,opd_subtotal) values(?,?,?,?,?,?,?,?,?,?,?)";
						PreparedStatement pst5 = con.prepareStatement(insertBillingSql);
						pst5.setString(1, billingId);
						pst5.setString(2, currDate);
						pst5.setString(3, totalAmount);
						pst5.setString(4, balanceAmount);
						pst5.setString(5, paidAmount);
						pst5.setString(6, maxServiceTakenId);
						pst5.setString(7, opdId);
						pst5.setString(8, dateOfAppointment);
						pst5.setString(9, prevbal);
						pst5.setString(10, discount);
						pst5.setString(11, totalPayable);
						
						int result3 = pst5.executeUpdate();
						
						if(result3 == 1){
							isBillingRecordCreated = true;
							//Step 3: Update OPD Billing Id Details of Patient
							String updateOPDDetailsSql = "update omk_db.omk_opd_appointments set opd_date_of_billing=?, opd_bill_id=?, opd_appointment_status=? where opd_id=? and opd_datetime_of_appointment=? and srno<>0";
							PreparedStatement pst6 = con.prepareStatement(updateOPDDetailsSql);
							pst6.setString(1, currDate);
							pst6.setString(2, billingId);
							pst6.setString(3, "Attended");
							pst6.setString(4, opdId);
							pst6.setString(5, dateOfAppointment);
							
							int result4 = pst6.executeUpdate();
							if(result4 == 1){
								if(isServiceTakenRecordCreated && isBillingRecordCreated){
									if(followUpDate.equals("") || followUpDate == null ){
										String redirectURL = "OPDBillPrint.jsp?id="+opdId+"&name="+name+"&gender="+gender+"&contact="+contact+"&age="+age+"&address="+address+"&occupation="+occupation+"&dateofappointment="+dateOfAppointment+"&appointmentfor="+appointmentFor+"&consultingdoctor="+consultingDoctor+"&stid="+maxServiceTakenId+"&consultingfees="+consultingfees+"&totalpayable="+totalPayable+"&discount="+discount+"&totalamount="+totalAmount+"&paid="+paidAmount+"&balance="+balanceAmount+"&prevbal="+prevbal+"&referenceDoc="+referenceDoctor+"&billingId="+billingId;
										out.println("<script type=\"text/javascript\">self.location.href='"+redirectURL+"'</script>");
									}else{
											String createOPDRecordSql = "insert into omk_db.omk_opd_appointments(opd_id,opd_appointment_for,opd_datetime_of_appointment,opd_appointment_type,opd_appointment_status,opd_registration_datetime,opd_consulting_doctor,o_ipd_id,opd_reference_doctor,opd_bill_id) values(?,?,?,?,?,?,?,?,?,?)";
											PreparedStatement pst7 = con.prepareStatement(createOPDRecordSql);
											pst7.setString(1, opdId);
											pst7.setString(2, appointmentFor);
											pst7.setString(3, followUpDate);
											pst7.setString(4, "Follow-Up");
											pst7.setString(5, "Not Attended");
											pst7.setString(6, currDate);
											pst7.setString(7, consultingDoctor);
											pst7.setString(8, "Not Registered");
											pst7.setString(9, "");
											pst7.setString(10, billingId);
											
											int result7 = pst7.executeUpdate();
											
											if(result7 == 1){
												String redirectURL = "OPDBillPrint.jsp?id="+opdId+"&name="+name+"&gender="+gender+"&contact="+contact+"&age="+age+"&address="+address+"&occupation="+occupation+"&dateofappointment="+dateOfAppointment+"&appointmentfor="+appointmentFor+"&consultingdoctor="+consultingDoctor+"&stid="+maxServiceTakenId+"&consultingfees="+consultingfees+"&totalpayable="+totalPayable+"&discount="+discount+"&totalamount="+totalAmount+"&paid="+paidAmount+"&balance="+balanceAmount+"&prevbal="+prevbal+"&referenceDoc="+referenceDoctor+"&billingId="+billingId;
												out.println("<script type=\"text/javascript\">self.location.href='"+redirectURL+"'</script>");
											}else{
												throw new Exception("Something went wrong. Please contact your administrator");
											}
									}
									
								}else{
									throw new Exception("Something went wrong. Please contact your administrator");
								}
							}else{
								throw new Exception("Something went wrong. Please contact your administrator");	
							}
						}else{
							isBillingRecordCreated = false;
							throw new Exception("Something went wrong. Please contact your administrator");
						}
				}				
			}else{
				//Step 2: Insert Billing Details
				//Get Billing Id
				isServiceTakenRecordCreated = true;
				String maxBillingId;
				
					PreparedStatement pst3 = con.prepareStatement("select count(*) from omk_db.omk_opd_billing_details");
					ResultSet rs1 = pst3.executeQuery();
					rs1.next();
					if(rs1.getInt(1) == 0){
						billingId = "BL1";
					}else{
						PreparedStatement pst4 = con.prepareStatement("select max(bill_srno) from omk_db.omk_opd_billing_details");
						ResultSet rs2 = pst4.executeQuery();
						if(rs2.next()){
							int maxBillsrno = rs2.getInt(1);
							if(maxBillsrno == 0){
								maxBillingId = Integer.toString(rs2.getInt(1)+2);
							}else{
								maxBillingId = Integer.toString(rs2.getInt(1)+1);
							}
							billingId = "BL"+maxBillingId;
						}else{
							throw new Exception("Cannot create billing id. Please contact your administrator");
						}
					}
					
					//Insert Billing Details
					String insertBillingSql = "insert into omk_opd_billing_details(bill_id,bill_date_of_bill,bill_total,bill_balance,bill_paid,bill_service_taken_id,bill_opd_id,bill_opd_datetime_of_appointment,opd_prev_bal,opd_discount,opd_subtotal) values(?,?,?,?,?,?,?,?,?,?,?)";
					PreparedStatement pst5 = con.prepareStatement(insertBillingSql);
					pst5.setString(1, billingId);
					pst5.setString(2, currDate);
					pst5.setString(3, totalAmount);
					pst5.setString(4, balanceAmount);
					pst5.setString(5, paidAmount);
					pst5.setString(6, "None");
					pst5.setString(7, opdId);
					pst5.setString(8, dateOfAppointment);
					pst5.setString(9, prevbal);
					pst5.setString(10, discount);
					pst5.setString(11, totalAmount);
					
					int result3 = pst5.executeUpdate();
					
					if(result3 == 1){
						isBillingRecordCreated = true;
						//Step 3: Update OPD Billing Id Details of Patient
						String updateOPDDetailsSql = "update omk_db.omk_opd_appointments set opd_date_of_billing=?, opd_bill_id=?, opd_appointment_status=? where opd_id=? and opd_datetime_of_appointment=? and srno<>0";
						PreparedStatement pst6 = con.prepareStatement(updateOPDDetailsSql);
						pst6.setString(1, currDate);
						pst6.setString(2, billingId);
						pst6.setString(3, "Attended");
						pst6.setString(4, opdId);
						pst6.setString(5, dateOfAppointment);
						
						int result4 = pst6.executeUpdate();
						
						if(result4 == 1){
							if(isServiceTakenRecordCreated && isBillingRecordCreated){
								if(followUpDate.equals("") || followUpDate == null ){
									String redirectURL = "OPDBillPrint.jsp?id="+opdId+"&name="+name+"&gender="+gender+"&contact="+contact+"&age="+age+"&address="+address+"&occupation="+occupation+"&dateofappointment="+dateOfAppointment+"&appointmentfor="+appointmentFor+"&consultingdoctor="+consultingDoctor+"&stid="+maxServiceTakenId+"&consultingfees="+consultingfees+"&totalpayable="+totalPayable+"&discount="+discount+"&totalamount="+totalAmount+"&paid="+paidAmount+"&balance="+balanceAmount+"&prevbal="+prevbal+"&referenceDoc="+referenceDoctor+"&billingId="+billingId;
									out.println("<script type=\"text/javascript\">self.location.href='"+redirectURL+"'</script>");
								}else{
										String createOPDRecordSql = "insert into omk_db.omk_opd_appointments(opd_id,opd_appointment_for,opd_datetime_of_appointment,opd_appointment_type,opd_appointment_status,opd_registration_datetime,opd_consulting_doctor,o_ipd_id,opd_reference_doctor,opd_bill_id) values(?,?,?,?,?,?,?,?,?,?)";
										PreparedStatement pst7 = con.prepareStatement(createOPDRecordSql);
										pst7.setString(1, opdId);
										pst7.setString(2, appointmentFor);
										pst7.setString(3, followUpDate);
										pst7.setString(4, "Follow-Up");
										pst7.setString(5, "Not Attended");
										pst7.setString(6, currDate);
										pst7.setString(7, consultingDoctor);
										pst7.setString(8, "Not Registered");
										pst7.setString(9, "");
										pst7.setString(10, billingId);
										
										int result7 = pst7.executeUpdate();
										
										if(result7 == 1){
											out.println("<script>alert('"+maxServiceTakenId+"')</script>");
											String redirectURL = "OPDBillPrint.jsp?id="+opdId+"&name="+name+"&gender="+gender+"&contact="+contact+"&age="+age+"&address="+address+"&occupation="+occupation+"&dateofappointment="+dateOfAppointment+"&appointmentfor="+appointmentFor+"&consultingdoctor="+consultingDoctor+"&stid="+maxServiceTakenId+"&consultingfees="+consultingfees+"&totalpayable="+totalPayable+"&discount="+discount+"&totalamount="+totalAmount+"&paid="+paidAmount+"&balance="+balanceAmount+"&prevbal="+prevbal+"&referenceDoc="+referenceDoctor+"&billingId="+billingId;
											out.println("<script type=\"text/javascript\">self.location.href='"+redirectURL+"'</script>");
										}else{
											throw new Exception("Something went wrong. Please contact your administrator");
										}
								}
								
							}else{
								throw new Exception("Something went wrong. Please contact your administrator");
							}
						}else{
							throw new Exception("Something went wrong. Please contact your administrator");	
						}
					}else{
						isBillingRecordCreated = false;
						throw new Exception("Something went wrong. Please contact your administrator");
					}
			}
		}catch(Exception e){
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			out.println(e.getMessage());
			e.printStackTrace();
		}finally{
			try {
				con.commit();
				if(con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		
		
		
		
	}

}
