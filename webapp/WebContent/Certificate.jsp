<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="WEB-INF/bookAppointment.tld" prefix="ba"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Certificate</title>
	<!-- Custom Stylesheet -->
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <!-- /Custom Stylesheet -->
    
    <!-- Font Awesome -->
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
    <!-- /Font Awesome -->
    
    <script type="text/javascript" src="js/jquery-1.11.3.min.js" ></script>
	<script type="text/javascript" src="js/jquery-ui.js" ></script>
	
	<!-- Combined datetime Picker -->
    <link href="datepicker_css/jquery.ui.supr.css" rel="stylesheet" type="text/css"/>
    <!-- Required Js -->
    <script type="text/javascript" src="datepicker_js/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
	<script type="text/javascript" src="datepicker_js/jquery.maskedinput-1.3.min.js"></script>
	<script type="text/javascript" src="datepicker_js/jquery.toggle.buttons.js"></script>
	<script type="text/javascript" src="datepicker_js/select2.min.js"></script>
	<script type="text/javascript" src="datepicker_js/jquery-ui-timepicker-addon.js"></script>
    <script type="text/javascript" src="datepicker_js/forms.js"></script>
    <!-- /Required Js -->
    <!-- Initialize Combined Picker -->
    <script type="text/javascript">
    initializeCombinedPicker();
    </script>    
    <!-- /Initialize Combined Picker -->
    <!-- /Combined datetime Picker -->
    <style>
    .patientDetails{
    	width:90%;float:left;height:auto;
    	margin:2%;    	
    }
    </style>
</head>
<body>

	<!-- Menu -->
    <jsp:include page="menu.jsp"></jsp:include>
    <!-- Menu -->
    
<div class="advanceSearch" style="margin:1em 0 2em 7em;border-radius:0;">
    		<h4><i class="fa fa-file"></i>Issue Medical Certificate</h4>
<form action="CertifictePrint.jsp">
	<table cellpadding="5" cellspacing="5">
		<tbody>
			<tr>
				<td>Name: </td>
				<td><input type="text" name="Pname" autocomplete="off"/></td>
				<td>Age:</td>
				<td><input type="text" name="age" autocomplete="off"/></td>
				<td>Sex:</td>
				<td>
					<select name="patient_gender">
				   		<option>--Select--</option>
				   		<option>Male</option>
				   		<option>Female</option>
					</select>
				</td>	
			</tr>
			<tr>
				<td>Contact </td>
				<td><input type="text" name="contact" autocomplete="off"/>
				<td>Address</td>
				<td colspan="4"><textarea name="patient_address" cols="60" rows="3"></textarea><br></td>
			</tr>
			<tr>
				<td colspan="4">
					<p>
						This is to certify that I have examined above mentioned patient today. He is suffering from<textarea cols="80" rows="5" name="suffering"></textarea>			
					</p>
				</td>			
			</tr>
			<tr>
				<td colspan="4">
					<input type="checkbox" name="illness" value="1">He is advised rest from <input type="text" name="D1" id="combined-picker9" style="width:20%;"/> To <input type="text" name="D2" id="combined-picker8" style="width:20%;"/>
				</td>			
			</tr>
			<tr>
				<td colspan="4"><input type="checkbox" name="illness" value="2">He is Unfit to join Duty in this period.</td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="checkbox" name="illness" value="3">He is Fit to join duty from <input type="text" name="D3" id="combined-picker7" style="width:20%;"/>
				</td>
			</tr>
		</tbody>
	</table>
	
	<div style="float:right; width:100%;height:auto;">
		<table cellpadding="5" cellspacing="5">
		<tr>
			<td>Name of Doctor:-</td>
			<td>
				<select name="doctor" id="doctor">
	        		<option>--Select--</option>
	        			<ba:getDoctorList/>
	    		</select>
	    	</td>
	    	<td>Qualification</td>
	    	<td>
	    		<input type="text" name="Qualification" size="10"/>	
	    	</td>
	    	<td>Registration No</td>
	    	<td><input type="text" name="regno" size="10"/></td>					
		</tr>
		</table>		
	</div>
	
	<input type="submit" value="Print" align="middle" style="float: left;margin:2% 15%;color: #FFF;background-color: #337AB7;padding: 0.2em 0.5em;border-radius: 3px;border: 1px solid #337AB7;">
</form>
</div>

</body>
</html>