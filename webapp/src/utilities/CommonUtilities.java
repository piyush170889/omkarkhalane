package utilities;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

public class CommonUtilities{
	public static String popUpSuccessMessage(){
		String alertMssg = "<script type=\"text/javascript\">alert('Appointment booked successfully')</script>";
		return alertMssg;	
	}

	public static void returnToDashboard(HttpServletResponse response) {
		try {
			response.sendRedirect("dashboard.jsp?current=dashboard");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static String popUpErrorMessage(Exception e) {
		String alertMssg = "<script type=\"text/javascript\">alert('Something Went Wrong: "+e.getMessage()+"')</script>";
		return alertMssg;
		
	}
	
	public static void returnToMaster(HttpServletResponse response) {
		/*String alertMssg = "<script type=\"text/javascript\">window.location.href='"+basepath+"Master.jsp?current=Master'</script>";
		return alertMssg;*/
		try {
			response.sendRedirect("Master.jsp?current=Master");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void returnToPatientManagement(HttpServletResponse response) {
		/*String alertMssg = "<script type=\"text/javascript\">window.location.href='"+basepath+"PatientManagement.jsp?current=PatientManagement'</script>";
		return alertMssg;*/
		try {
			response.sendRedirect("PatientManagement.jsp?current=PatientManagement");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void returnToReports(HttpServletResponse response) {
		/*String alertMssg = "<script type=\"text/javascript\">window.location.href='"+basepath+"Reports.jsp?current=Reports'</script>";
		return alertMssg;*/
		try {
			response.sendRedirect("Reports.jsp?current=Reports");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void returnToLogin(HttpServletResponse response) {
		/*String alertMssg = "<script type=\"text/javascript\">window.location.href='"+basepath+"login.html'</script>";
		return alertMssg;*/
		try {
			response.sendRedirect("login.html");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void returnToChangePassword(HttpServletResponse response) {
		/*String alertMssg = "<script type=\"text/javascript\">window.location.href='"+basepath+"ChangePassword.jsp'</script>";
		return alertMssg;*/
		try {
			response.sendRedirect("ChangePassword.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void returnToChangePass(HttpServletResponse response) {
		/*String alertMssg = "<script type=\"text/javascript\">window.location.href='"+basepath+"changepass.jsp'</script>";
		return alertMssg;*/
		try {
			response.sendRedirect("changepass.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static String showErrorMessage(Exception e){
		return "<script type=\"text/javascript\">alert('"+e.getMessage()+"')</script>";
	}
}
