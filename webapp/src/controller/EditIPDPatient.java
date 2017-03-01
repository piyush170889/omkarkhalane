package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Connection_Provider;

/**
 * Servlet implementation class EditIPDPatient
 */
@WebServlet("/EditIPDPatient")
public class EditIPDPatient extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		//GET OPD Parameters
		String Id = request.getParameter("edit_ipd_id").trim();
		String f_name = request.getParameter("f_ipd_name").trim();
		String m_name = request.getParameter("m_ipd_name").trim();
		String l_name = request.getParameter("l_ipd_name").trim();
		String contact = request.getParameter("edit_ipd_Contact").trim();
		String admitdate = request.getParameter("edit_ipd_date_of_admit").trim();
		String disdate = request.getParameter("edit_ipd_date_of_discharge").trim();
		String exdate = request.getParameter("edit_ipd_date_of_expiry").trim();
		String FD = request.getParameter("edit_ipd_Final_dignoses").trim();
		String sdate = request.getParameter("edit_ipd_date_of_surgery").trim();
		
		//GET Database Connection 
		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();  
		
		try{			
			PreparedStatement ps = con.prepareStatement("update omk_db.omk_book_appointment set f_name=?,m_name=?,l_name=?,patient_contact=? where b_ipd_id=?");
			
			ps.setString(1, f_name);
			ps.setString(2, m_name);
			ps.setString(3, l_name);
			ps.setString(4, contact);
			ps.setString(5, Id);
			
			
			int result = ps.executeUpdate();
			
			if(result == 1){                                                                   
				PreparedStatement ps1 = con.prepareStatement("update omk_db.omk_ipd_appointments set discharge_on_datetime=?,expiry_on_datetime=?,final_diagnosis=?,datetime_of_surgery=? where ipd_id=? and ipd_srno<>0 and admitted_on_datetime=? ");
				
				ps1.setString(1, disdate);
				ps1.setString(2, exdate);
				ps1.setString(3, FD);
				ps1.setString(4, sdate);
				ps1.setString(5, Id);
				ps1.setString(6, admitdate);
				
				int result1 = ps1.executeUpdate();
				
				if(result1 == 1){
					out.println("<script type=\"text/javascript\">alert('"+Id+" Updated successfully')</script>");
					utilities.CommonUtilities.returnToDashboard(response);
				}else{
					throw new Exception("Cannot Update "+Id);
				}
			}else{
				throw new Exception("Cannot Update "+Id);
			}
		}catch(Exception e){
//			out.println(utilities.CommonUtilities.popUpErrorMessage(e));
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
			out.println("<h3 style=\"color:red;text-align:center;\">Something went wrong. Please contact your administrator. <br/>Error message: "+e.getMessage()+"</h3>");
		}finally{
			try{
				con.commit();
				if(con != null)
					con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
	}

	
}
