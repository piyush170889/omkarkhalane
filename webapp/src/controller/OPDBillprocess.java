package controller;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.Connection_Provider;

/**
 * Servlet implementation class OPDBillprocess
 */
@WebServlet("/OPDBillprocess")
public class OPDBillprocess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OPDBillprocess() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		//PrintWriter out = response.getWriter();
		Connection con = null;
		
		try{
			String opdId = request.getParameter("opdId").trim();
			String dateOfAppointment = request.getParameter("dateOfAppointment").trim();
			
			Connection_Provider connectionProvider = new Connection_Provider();
			con = connectionProvider.getConnection();
			PreparedStatement ps = con.prepareStatement("select F_name,patient_contact,patient_age,patient_gender,patient_address,patient_occupation,opd_appointment_for,opd_consulting_doctor,doc_consulting_fees,opd_bill_id,m_name,l_name,opd_reference_doctor from omk_db.omk_book_appointment as book inner join omk_opd_appointments as opd on book.b_opd_id=opd.opd_id  and opd_id=? and opd_datetime_of_appointment=? left outer join omk_doctor_details as doc on opd.opd_consulting_doctor=doc.doc_name");
			ps.setString(1, opdId);
			ps.setString(2, dateOfAppointment);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				response.sendRedirect("OPDBill.jsp?opdId="+opdId+"&patientName="+rs.getString(1)+" "+rs.getString(11)+" "+rs.getString(12)+"&patientContact="+rs.getString(2)+"&patientAge="+rs.getString(3)+"&patientGender="+rs.getString(4)+"&patientAddress="+rs.getString(5)+"&patientOccupation="+rs.getString(6)+"&dateOfAppointment="+dateOfAppointment+"&appointmentFor="+rs.getString(7)+"&consultingDoctor="+rs.getString(8)+"&consultingFees="+rs.getString(9)+"&referenceDoctor="+rs.getString(13)+"&billId="+rs.getString(10)+"&current=dashboard");
			}else{
				throw new Exception("Cannot get record");
			}
		}catch(Exception e){
//			out.println(CommonUtilities.showErrorMessage(e));
			e.printStackTrace();
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
