<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="WEB-INF/bookAppointment.tld" prefix="ba"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reffered Patients</title>
	<!-- Required JS -->
    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <!-- /Required JS -->
    
    <!-- Required JS -->
    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <!-- /Required JS -->
    
    <!-- Tabs -->
    <link rel="stylesheet" type="text/css" href="css/demo.css" />
	<link rel="stylesheet" type="text/css" href="css/component.css" />		
    <!--[if IE]>
  		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
    <!-- /Tabs -->
   
    <!-- Custom Stylesheet -->
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <!-- /Custom Stylesheet -->
    
    <!-- Font Awesome -->
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
    <!-- /Font Awesome -->    
   
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
    
        
    <!-- Magnific Pop-Up -->
    <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="js/jquery.magnific-popup.js" type="text/javascript"></script>   
    <!-- /Magnific Pop-up -->
    
     
   
    <!-- DataTables CSS -->
	<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css">
	<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
    <!-- /DataTables CSS -->
    
    <!-- Intialize Scripts on page load -->
     <script>
	$(document).ready(function() {
		$('.popup-with-zoom-anim').magnificPopup({
			type: 'inline',
			fixedContentPos: false,
			fixedBgPos: true,
			overflowY: 'auto',
			closeBtnInside: true,
			preloader: false,
			midClick: true,
			removalDelay: 300,
			mainClass: 'my-mfp-zoom-in'
		});
		$('#opdAppointmentDetails').dataTable();
	 	
	 	
	 	
	 				
	});
	</script>
</head>
<body>
 	<!-- Menu -->
    	<jsp:include page="menu.jsp"></jsp:include>
    <!-- Menu --> 
    <!-- Reffernce Doctor Details -->
     <div class="advanceSearch" style="margin:2em 0 2em 7em;border-radius:0;">
    	<h4><i class="fa fa-search"></i>Refernce Doctor Details</h4>
    	<div  style="padding:0 0.5em;">
	    	<table border="0" cellspacing="3" cellpadding="5"  class="book_appointment_table">
	    		<tbody>
	    			<ba:getRefernceDoctorDetails refernceDoctor="<%= request.getParameter(\"reffered\")%>" id="<%= request.getParameter(\"id\") %>" />
	    		</tbody>		
	    	</table>
    	</div>
    </div>
    <!-- /Reffernce Doctor Details -->
    <%
    if(request.getParameter("type").equals("OPD")){
    %>
    <div class="advanceSearch" style="width:100%;margin:0;border-radius:0;">
    	<h4 style="text-align:center;"><i class="fa fa-file"></i>reffered OPD Patient Details</h4>
    		<div class="book_appointment_table" style="padding:0 0.5em;">
	    		<table border="0" cellspacing="0" cellpadding="0"  class="responstable" id="opdAppointmentDetails">
	    			<thead>
	    				<tr>
	    					<th>OPD Id</th>
	    					<th>Name</th>
	    					<th>Contact No.</th>
	    					<th>Admit Date</th>
	    					<th>Appointment For</th>
	    					<th>Consultant Doctor</th>
	    				</tr>
	    			</thead>
	    			<tbody>
	    				
	    				<ba:getRefernceOPDPatientDetails refernceDoctor="<%= request.getParameter(\"reffered\")%>" id="<%= request.getParameter(\"id\")%>" startDate="<%= request.getParameter(\"startDate\") %>" endDate="<%=request.getParameter(\"endDate\") %>" />
	    				
	    			</tbody>			
	    		</table>
    		</div>
    </div>
    <%}else{ %>
    
    	<div class="advanceSearch" style="width:100%;margin:0;border-radius:0;">
    	<h4 style="text-align:center;"><i class="fa fa-file"></i>reffered IPD Patient Details</h4>
    		<div class="book_appointment_table" style="padding:0 0.5em;">
	    		<table border="0" cellspacing="0" cellpadding="0"  class="responstable" id="ipdAppointmentDetails">
	    			<thead>
	    				<tr>
							<th>IPD ID</th>
                            <th>Name</th>
                            <th>Contact No.</th>
                            <th>Admitted On</th>
                            <th>Primary Diagnosis</th>
                            <th>Surgeon</th>
                            <th>Date of Surgery</th>
                        </tr>  
	    			</thead>
	    			<tbody>
	    				
	    				<ba:getRefernceIPDPatientDetails refernceDoctor="<%= request.getParameter(\"reffered\")%>" id="<%= request.getParameter(\"id\")%>" startDate="<%= request.getParameter(\"startDate\") %>" endDate="<%=request.getParameter(\"endDate\") %>" />
	    				
	    			</tbody>			
	    		</table>
    		</div>
    </div>
    <%}%>
</body>
</html>