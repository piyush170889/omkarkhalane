package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
 * Servlet implementation class adnvanceDetails
 */
@WebServlet("/adnvanceDetails")
public class adnvanceDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adnvanceDetails() {
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

		Connection_Provider connectionProvider = new Connection_Provider();
		Connection con = connectionProvider.getConnection();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		String currDate = sdf.format(new Date());		
		String advanceAmount = request.getParameter("advanceAmount");
		String ipdId = request.getParameter("advance_ipd_id");
		String admittedOn = request.getParameter("admit_date_advance");
		
		String advanceDetails = "insert into advance_amount(advance_datetime,amount,advance_ipd_id,creattion_datetime,admission_datetime) values (?,?,?,?,?)";
		try{
			
			PreparedStatement pst = con.prepareStatement(advanceDetails);
			pst.setString(1, currDate);
			pst.setString(2, advanceAmount);
			pst.setString(3, ipdId);
			pst.setString(4, currDate);
			pst.setString(5, admittedOn);
			
			int result = pst.executeUpdate();
			
			if(result!=1){
				con.rollback();
				throw new Exception("Unable to insert Advance Record");
			}else{
				out.println("<script type=\"text/javascript\">alert('Advance inserted successfully')</script>");
				out.println("<script type=\"text/javascript\">window.location.href='"+request.getHeader("referer")+"'</script>");
				pst.close();
			}
		}catch(Exception e){
			out.println(utilities.CommonUtilities.showErrorMessage(e));
			e.printStackTrace();
			utilities.CommonUtilities.returnToDashboard(response);
		}finally{
			try {
				con.commit();
				if(con != null){
					con.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
