<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="WEB-INF/bookAppointment.tld" prefix="ba"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Omkar Khalane Hospital</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
		
	 	$('#advanceSearchTable').dataTable();
	 	$('#bookAppointmentTable').dataTable();
	 	$('#opdAppointmentTable').dataTable();
	 	$('#ipdAppointmentTable').dataTable();	 			
	});
	</script>
    <!-- /Intialize Scripts on page load -->
 <!-- Edit Appointment Js -->

 <script type="text/javascript">
	function sendBookVal(bid, nm, cntcno, age, gender, address, occ, doa,m_nm,l_nm,dept,c_doc){
		document.getElementById("bookid").value = bid;
		document.getElementById("f_name").value = nm;
		document.getElementById("m_name").value = m_nm;
		document.getElementById("l_name").value = l_nm;
		document.getElementById("bookcontact").value = cntcno;
		document.getElementById("bookage").value = age;
		document.getElementById("bookgender").value = gender;
		document.getElementById("bookaddress").value = address;
		document.getElementById("bookoccupation").value = occ;
		document.getElementById("dept1").value = dept; 
		document.getElementById("c_doc1").value = c_doc; 
		document.getElementById("combined-picker2").value = doa;
		document.getElementById("original_datetime").value = doa;
	}
	
	function sendRegisterBookVal(bid, nm, cntcno, age, gender, address, occ, doa, m_nm,l_nm,dept,c_doc){
		document.getElementById("reg_bookid").value = bid;
		document.getElementById("reg_f_name").value = nm;
		document.getElementById("reg_m_name").value = m_nm;
		document.getElementById("reg_l_name").value = l_nm;
		document.getElementById("reg_bookcontact").value = cntcno;
		document.getElementById("reg_bookage").value = age;
		document.getElementById("reg_bookgender").value = gender;
		document.getElementById("reg_bookaddress").value = address;
		document.getElementById("reg_bookoccupation").value = occ;
		document.getElementById("dept").value = dept; 
		document.getElementById("c_doc").value = c_doc; 
		document.getElementById("reg_doa").value = doa;	
		document.getElementById("reg_original_datetime").value = doa;
	}
	
	function sendRegisterVal(regnm, regcntcno,  regage, reggender, regaddress, regocc, regdoa,m_nm,l_nm,dept,c_doc){
		document.getElementById("f_reg_name").value = regnm;
		document.getElementById("m_reg_name").value = m_nm;
		document.getElementById("l_reg_name").value = l_nm;
		document.getElementById("registercontact").value = regcntcno;
		document.getElementById("registerage").value = regage;
		document.getElementById("registergender").value = reggender;
		document.getElementById("registeraddress").value = regaddress;
		document.getElementById("registeroccupation").value = regocc;
		document.getElementById("dept2").value = dept;
		document.getElementById("c_doc2").value = c_doc;
		document.getElementById("registertype").selectedIndex = 0;
		document.getElementById("registrationForm").innerHTML = "";
	}
	
	function displayForm(){
		var selectedOption = document.getElementById("registertype").options[document.getElementById("registertype").selectedIndex].text;
		if(selectedOption == "OPD"){
			document.getElementById("registrationForm").innerHTML = document.getElementById("opd_reg_id").innerHTML+"<div id=\"opd_registration_form\" class=\"popup\"><table class=\"popuptable\" style=\"padding:1em 0;\"><tr><td>Date Time of Appointment: </td><td><input type=\"text\" name=\"datetime_of_appointment\" id=\"combined-picker13\" readonly=\"readonly\"/></td><td>Reference Doctor:<input type=\"hidden\" name=\"appointment_type\" value=\"New\"/><input type=\"hidden\" name=\"ipd_id\" value=\"Not Registered\"/></td><td><select name=\"reference_doctor\" ><option>--Select--</option>"+document.getElementById("RefdoctorList").innerHTML+"</select></td></tr><tr><td colspan=\"4\"><input type=\"submit\" value=\"SAVE\" class=\"button\" style=\"margin:1em 0 0\"/></td></tr></table></div>";	
		}else if(selectedOption == "IPD"){
			document.getElementById("registrationForm").innerHTML = document.getElementById("ipd_reg_id").innerHTML+"<div id=\"ipd_registration_form\" ><table class=\"popuptable\" cellpadding=\"5\"><tr><td>Next To Kin: </td><td><input type=\"text\" name=\"next_to_kin\"/></td><td>Admission Date: </td><td><input type=\"text\" name=\"admitted_on_datetime\" id=\"combined-picker4\" readonly=\"readonly\"/></td><td>Surgery Date: </td><td><input type=\"text\" id=\"combined-picker7\" readonly=\"readonly\" name=\"surgery_date\" /></td></tr><tr><td>Primary Diagnosis: </td><td colspan=\"2\"><textarea rows=\"5\" cols=\"45\" name=\"primary_diagnosis\"></textarea></td><td>Referred By: </td><td><select name=\"reffered_by\" ><option>--Select--</option>"+document.getElementById("RefdoctorList").innerHTML+"</select></td></tr><tr><td>Advance amount</td><td><input type=\"number\" name=\"advance_amount\" value=\"0\" ></td></tr><tr><td colspan=\"6\"><input type=\"hidden\" name=\"opd_id\" value=\"Not Registered\"/><input type=\"submit\" value=\"REGISTER\" class=\"button\" style=\"margin:1em 0;\"/></td><td></td></tr></table></div>";
		}else if(selectedOption == "--Select--"){
			document.getElementById("registrationForm").innerHTML = "";
		}	
		initializeCombinedPicker();
	}
	
	function displayForm1(){
		var selectedOption = document.getElementById("registertype1").options[document.getElementById("registertype1").selectedIndex].text;
		if(selectedOption == "OPD"){
			document.getElementById("registrationForm1").innerHTML = document.getElementById("opd_reg_id").innerHTML+"<div id=\"opd_registration_form\" class=\"popup\"><table class=\"popuptable\" style=\"padding:1em 0;\"><tr><td>Date Time of Appointment: </td><td><input type=\"text\" name=\"datetime_of_appointment\" id=\"combined-picker13\" readonly=\"readonly\"/></td><td>Reference Doctor:<input type=\"hidden\" name=\"appointment_type\" value=\"New\"/><input type=\"hidden\" name=\"ipd_id\" value=\"Not Registered\"/></td><td><select name=\"reference_doctor\" ><option>--Select--</option>"+document.getElementById("RefdoctorList").innerHTML+"</select></td></tr><tr><td colspan=\"4\"><input type=\"submit\" value=\"SAVE\" class=\"button\" style=\"margin:1em 0 0\"/></td></tr></table></div>";	
		}else if(selectedOption == "IPD"){
			document.getElementById("registrationForm1").innerHTML = document.getElementById("ipd_reg_id").innerHTML+"<div id=\"ipd_registration_form\" ><table class=\"popuptable\" cellpadding=\"5\"><tr><td>Next To Kin: </td><td><input type=\"text\" name=\"next_to_kin\"/></td><td>Admission Date: </td><td><input type=\"text\" name=\"admitted_on_datetime\" id=\"combined-picker4\" readonly=\"readonly\"/></td><td>Surgery Date: </td><td><input type=\"text\" id=\"combined-picker7\" readonly=\"readonly\" name=\"surgery_date\" /></td></tr><tr><td>Primary Diagnosis: </td><td colspan=\"2\"><textarea rows=\"5\" cols=\"45\" name=\"primary_diagnosis\"></textarea></td><td>Referred By: </td><td><select name=\"reffered_by\" ><option>--Select--</option>"+document.getElementById("RefdoctorList").innerHTML+"</select></td></tr><tr><td>Advance amount</td><td><input type=\"number\" name=\"advance_amount\" value=\"0\" ></td></tr><tr><td colspan=\"6\"><input type=\"hidden\" name=\"opd_id\" value=\"Not Registered\"/><input type=\"submit\" value=\"REGISTER\" class=\"button\" style=\"margin:1em 0;\"/></td><td></td></tr></table></div>";
		}else if(selectedOption == "--Select--"){
			document.getElementById("registrationForm1").innerHTML = "";
		}	
		initializeCombinedPicker();
	}
	
	function sendEditOPDVal(opdid, opdname, opdcontact, opdappointmentfor, opddoa, opdconsultingdoc, opdreferencedoc,m_name,l_name) {
		document.getElementById("edit_opd_id").value = opdid;
		document.getElementById("f_opd_name").value = opdname;
		document.getElementById("m_opd_name").value = m_name;
		document.getElementById("l_opd_name").value = l_name;
		document.getElementById("edit_opd_appointment_for").value = opdappointmentfor;
		document.getElementById("combined-picker14").value = opddoa;
		document.getElementById("edit_opd_consulting_doctor").value = opdconsultingdoc;
		document.getElementById("edit_opd_reference_doctor").value = opdreferencedoc;
		document.getElementById("edit_opd_date_of_appointment_org").value = opddoa;
	}
	
	
	function sendOPDToIPDVal(f_name, m_name,l_name, opdcontact,age,sex,occupation,dept,cunsltant_doc,address,opd_id) {
		document.getElementById("first_name_type").value = f_name;
		document.getElementById("middel_name_type").value = m_name;
		document.getElementById("last_name_type").value = l_name;
		document.getElementById("contact_type").value = opdcontact;
		document.getElementById("age_type").value = age;
		document.getElementById("gen").value = sex;
		document.getElementById("occu").value = occupation;
		document.getElementById("dept_name").value = dept;
		document.getElementById("cult_doc").value = cunsltant_doc;
		document.getElementById("add_ipd").value = address;
		document.getElementById("adv_opd_id").value = opd_id;
	}
	
	function sendEditIPDVal(ipdid, ipdname, ipdnexttokin, admitdate, primarydiagnosis, surgeon, surgerydate, refrencedoc,m_name,l_name) {
		document.getElementById("edit_ipd_id").value = ipdid;
		document.getElementById("f_ipd_name").value = ipdname;
		document.getElementById("m_ipd_name").value = m_name;
		document.getElementById("l_ipd_name").value = l_name;
		document.getElementById("edit_next_to_kin").value = ipdnexttokin;
		document.getElementById("combined-picker15").value = admitdate;
		document.getElementById("edit_primary_diagnosis").value = primarydiagnosis;
		document.getElementById("edit_surgeon").value = surgeon;
		document.getElementById("combined-picker18").value = surgerydate;
		document.getElementById("edit_reffered_by").value = refrencedoc;
		document.getElementById("original_admit_date").value = admitdate;
	}
	
	function APSearch() {
		var select=document.getElementById("regType").options[document.getElementById("regType").selectedIndex].text;
 		var date1=document.getElementById("combined-picker9").value;
 		var date2=document.getElementById("combined-picker10").value;
	 	if((date1=="") && (date2=="")){
			alert('Please Fill Fields');
	 		return false;
	 	}
	 	else if(date1==""){
	 		alert('Please Fill Both Fields');
	 		return false;
	 	}else if(date2==""){
	 		alert('Please Fill Both Fields');
	 		return false;
	 	}else if(select == "--Select--"){
	 		alert('Please Select Correct Type');
	 		return false;
		}else if(date1>=date2){
	 		alert('Wrong Date Range Selected');
	 		return false;
		}else{
	 		return true;
	 	}
	} 

	function SearchP() {
 		var id=document.getElementById("searchID").value;
 		var conatct=document.getElementById("searchContact").value;
 		if((id=="") && (conatct=="")){
 			alert('Please Enter Id or Contact Fields');
 			return false;
 		}
 		else if(isNaN(conatct)){
 			alert('Enter Correct Contact in fields');
 			return false;
 		}else{
 			return true;
 		}
	} 
 	
</script>
<!-- Edit Appointment Js -->
 
</head>
<body>
    <!-- Menu -->
   		<jsp:include page="menu.jsp"></jsp:include>
    <!-- Menu --> 
    
    <div id="doctorList" style="display:none;">
    	<ba:getDoctorList/>
    </div>
    
    <div id="RefdoctorList" style="display:none;">
    	<ba:getRefernceDoctorList/>
    </div>
    
    <div id="deptList" style="display:none;">
    	<ba:getDepartmentList/>
    </div>
    
    <!-- Appointment management Options -->
    <div class="manage_appointments">
	 			<a href="#small-dialog" class="popup-with-zoom-anim"><i class="fa fa-plus"></i>Book New Appointment</a>
	 			<a href="#small-dialog3" class="popup-with-zoom-anim" onclick="sendRegisterVal('','','','','','','','','')"><i class="fa fa-check"></i>Register New Patient</a>
	 			<a href="Certificate.jsp?current=dashboard"><i class="fa fa-certificate"></i>Medical Certificate</a>	         	
    </div>	
    <!-- /Appointment Management Options -->
   
    <!--  Individual Patient Search -->
    <div class="advanceSearch" style="width:40%;margin:1em 3em;">
    	<h4><i class="fa fa-search"></i>Book Follow-Up Patient Appointment</h4>
    	<div>
    		<form action="PatientDetails.jsp" method="get">
	    		<table border="0" cellspacing="0" cellpadding="0" class="responstable" style="border-radius:0px;border-left:3px solid #337AB7;border-right:3px solid #337AB7;border-bottom:3px solid #337AB7;border-top:0px;">
	    			<thead>
	    				<tr>
		    				<td>Select Type :</td>
							<td><input type='radio' name='pd' value='OPD' checked='checked'>OPD</td>
							<td colspan="2"><input type='radio' name='pd' value='IPD' >IPD</td>
						</tr>
						<tr>
							<td>Id :</td>
	    					<td><input type="text" id="searchID" onkeyup="this.value=this.value.toUpperCase()" name="id" size="10" autocomplete="off" ><input type="hidden" name="current" value="dashboard" autocomplete="off"/></td>
	    					<td>Contact :</td>
							<td ><input type="text" id="searchContact" name="contact" size="10" autocomplete="off" ></td>	
		    			</tr>		
	    				<tr>
	    					<td colspan="4"><input align="middle" name="search1" onclick="return SearchP()" type="submit" value="SEARCH" class="button" /></td>
	    				</tr>
	   				</thead>
	   			</table>
	   		</form>
   		</div>
    </div>
    <!--  /Individual Patient Search -->
    
    <!--  Advance Search -->
    <div class="advanceSearch" style="width:40%;margin:1em;">
    	<h4><i class="fa fa-search"></i>Advance Search</h4>
    	<div>
    		<form action="dashboard.jsp" method="get">
	    		<table  border="0" cellspacing="0" cellpadding="0" class="responstable" style="border-radius:0px;border-left:3px solid #337AB7;border-right:3px solid #337AB7;border-bottom:3px solid #337AB7;border-top:0px;">
	    			<tbody>
	    				<tr>
	    					<td>Registration Type: </td>
	    					<td>
	    						<select name="advanceSearchType" id="regType" >
	    							<option>--Select--</option>
	    							<option>OPD</option>
	    							<option>IPD</option>
	    						</select>
	    					</td>
	    					<td></td>
	    				</tr>
	    				<tr>
	    					<td>Date Range: </td>
	    					<td><input type="text" name="startDate" id="combined-picker9" style="width:70%;"autocomplete="off"/><label style="margin-left:1.4em;">TO</label></td>
	    					<td><input type="text" name="endDate" id="combined-picker10" style="width:70%;"autocomplete="off"/><input type="hidden" name="advanceSearch" value="advanceSearch"/></td>
	    				</tr>
	    				<tr>
	    					<td colspan="3"><input type="submit" onclick="return APSearch()" value="SEARCH" class="button" /><input type="hidden"  name="current" value="dashboard" /></td>
	    				</tr>
	    			</tbody>
	    		</table>
	    	</form>
    	</div>
    </div>
    <!--  /Advance Search -->
    
    <!-- Check if advance Search or normal page load -->
    <%
    	if(request.getParameter("advanceSearch") != null && request.getParameter("advanceSearch").equals("advanceSearch")){
    		String startdt = request.getParameter("startDate");
    		String enddt = request.getParameter("endDate");
    		String searchty = request.getParameter("advanceSearchType");
    %>
    <!-- advance Search Appointment Information -->
    <div class="appointment_info">
    	<h5>Appointment Information From : <%= request.getParameter("startDate") %> To <%= request.getParameter("endDate") %></h5>
    </div>
     
    <div class="book_appointment_table">
      	<table class="responstable" border="2" id="bookAppointmentTable">
              		<ba:getAdvanceSearchDetails startDate="<%= startdt %>" endDate="<%= enddt %>" searchType="<%= searchty %>" />
        </table>
    </div>
    <!-- /advance Search Appointment Information -->
                            
    <%
    	}else{
    %>
    <!-- Appointment Information -->
    <div class="appointment_info">
    	<h5>Todays Appointment Information</h5>
    </div>
    <!-- /Appointment Information -->
    <!-- Tabs -->
    <div id="tabs" class="tabs" style="float:left;">
		<nav>
			<ul>
				<li><a href="#section-1"><span>Todays Booked Appointments</span></a></li>
				<li><a href="#section-2"><span>Todays OPD Patients</span></a></li>
				<li><a href="#section-3"><span>Todays IPD Patients</span></a></li>
			</ul>
		</nav>
		<div class="content">
			<section id="section-1">
				<div class="mediabox">
					<div class="info">
                    	<p>
                        	<i class="fa fa-thumbs-up"></i>
                            <span><ba:getTotalTodaysBookingCount /></span> Appointments Booked
                            <i class="fa fa-check"></i>
                            <span><ba:getTodaysRegisteredAppointmentCount /></span>Appointments Registered
                            <i class="fa fa-warning"></i>
                            <span><ba:getTodaysNotRegisteredAppointmentCount /> </span>Appointments Not Registered                                    
                            <i class="fa fa-times"></i>
                            <span><ba:getTodaysCancelledCount /></span>Appointment Cancelled                                    
                        </p>
                    </div>
                    <!-- Todays Booking Info -->
                    <div class="book_appointment_table">
                    	<table class="responstable" border="2" id="bookAppointmentTable">
                        	<thead>                                    	
                            	<tr>
                                	<th>ID</th>
                                    <th>Name</th>
                                    <th>Contact No.</th>
                                    <th>Age</th>
                                    <th>Gender</th>
                                    <th>Date Of Appt.</th>
                                    <th>Appt. Status</th>
                                    <th>Booking Date</th>
                                    <th>Department</th>
                                    <th>Consulting Doctor</th>
                                    <th>Actions</th>
                                </tr>    
                            </thead>
                            <tbody>
                                <ba:getTodaysBookedAppointmentDetails />
                            </tbody>
                        </table>
                    </div>
                    <!-- /Todays Booking Info -->
                </div>
			</section>
			<section id="section-2">
				<div class="mediabox">
                	<div class="info">
                    	<p>
                        	<i class="fa fa-thumbs-up"></i>
                            <span><ba:getTodaysOPDAppointments /></span>OPD Appointments
                            <i class="fa fa-check"></i>
                            <span><ba:getTodaysAttendedOPDCount/></span>Appointments Attended
                            <i class="fa fa-warning"></i>
                            <span><ba:getTodaysNotAttendedOPDCount/></span>Appointments Not Attended                                    
                            <i class="fa fa-times"></i>
                            <span><ba:getTodaysCancelledOPDCount /></span>Appointment Cancelled                                    
                        </p>
                    </div> 
				</div>
				<!-- Todays OPD Info -->
                <div class="book_appointment_table">
                	<table class="responstable" border="2" id="opdAppointmentTable">
                    	<thead>                                    	
                        	<tr>
                            	<th>OPD ID</th>
                                <th>Name</th>
                                <th>Contact No.</th>
                                <th>Appt. For</th>
                                <th>Appt. Type</th>
                                <th>Date Of Appt.</th>
                                <th>Status</th>
                                <th>Consulting Doctor</th>
                                <th>Reference Doctor</th>
                                <th>Actions</th>
                            </tr>    
                        </thead>
                        <tbody>
                            <ba:getTodaysOPDAppointmentDetails />
                        </tbody>
                    </table>
                </div>
              	<!-- /Todays OPD Info -->
			</section>
			<section id="section-3">
				<div class="mediabox">
                	 <div class="info" style="text-align:center;">
                     <p>
                    	<i class="fa fa-thumbs-up"></i>
                        <span><ba:getTodaysIPDCount/></span>Total IPD Appointments
                        <!-- <i class="fa fa-check"></i>
                        <span></span>Appointments Attended
                        <i class="fa fa-warning"></i>
                        <span></span>Appointments Not Attended                                    
                        <i class="fa fa-stop"></i>
                        <span></span>Appointment Cancelled    -->                                 
                    </p> 
                	</div>
				</div>
				<!-- Todays IPD Info -->
                <div class="book_appointment_table">
                	<table class="responstable" border="2" id="ipdAppointmentTable">
                    	<thead>                                    	
                        	<tr>
                            	<th>IPD ID</th>
                                <th>Name</th>
                                <th>Contact No.</th>
                                <th>Admitted On</th>
                                <th>Booking Date</th>
                                <th>Primary Diagnosis</th>
                                <th>Surgeon</th>
                                <th>Date of Surgery</th>
                                <th>Reference Doctor</th>
                                <th>Actions</th>
                            </tr>    
                        </thead>
                        <tbody>
                        	<ba:getTodaysIPDAppointmentDetails />
                        </tbody>
                    </table>
                </div>
                <!-- /Todays IPD Info -->
			</section>
		</div><!-- /content -->
	</div>   
    <!-- /tabs -->   
    <!-- Required JS for tabs -->
    <script src="js/cbpFWTabs.js"></script>
		<script>
			new CBPFWTabs( document.getElementById( 'tabs' ) );
		</script>
    <!-- /Required JS for tabs -->  
     <%
    	}
    %>               
	<!-- /Check if advance Search or normal page load -->  
      
    <!-- OPD Registration ID -->
    <div id="opd_reg_id" style="display: none;">
    	<table class="popuptable" style="padding:1em 0;">
	    	<tr>
	    		<td style="text-align:right;width: 13.5%;">OPD ID: </td>
	    		<td><input type="text" name="opd_id" value="<ba:getOPDID/>" readonly="readonly" autocomplete="off" style="float:left;margin-left: 3.5em;"/></td>
	    		<td></td><td></td><td></td><td></td>
	    	</tr>
    	</table>
    </div>
    <!-- /OPD Registration ID -->
    
    <!-- IPD Registration ID -->
    <div id="ipd_reg_id" style="display: none;">
    	<table class="popuptable" style="padding:1em 0;">
    		<tr>
    			<td style="text-align:right;width: 13.5%;">IPD ID: </td>
    			<td><input type="text" name="ipd_id" value="<ba:getIPDID/>" autocomplete="off" style="float:left;margin-left: 3.5em;"/></td>    		
    		</tr>
    	</table>
    </div>
    <!-- /IPD Registration ID -->
  	<!-- POP-UP FORMS -->
   	<!-- Book New Appointment -->
	<div id="small-dialog" class="mfp-hide">
		<div class="popup">
			 <form name="bookappointmentform" action="BookAppointment" method="post">
               	<!-- <fieldset>
                   <legend><label>Book An Appointment</label></legend>
                   <p> --> 
                   <h4><i class="fa fa-plus-circle"></i>Book New Appointment</h4>                               	
                        <table cellspacing="20" cellpadding="10" class="popuptable">
                        <tr>
							<td><label>Booking Id:</label></td>
                            <td><input type="text" name="bookingid" value="<ba:getBookingId />" readonly="readonly" autocomplete="off"/></td>
                        </tr>
                        <tr>    
                        	<td><label>First Name:</label></td>
                            <td><input type="text" name="f_name" required placeholder="First Name"autocomplete="off"/></td>
                            <td><label>Middle Name:</label></td>
                            <td><input type="text" name="m_name" placeholder="Middle Name"autocomplete="off"/></td>
                            <td><label>Last Name:</label></td>
                            <td><input type="text" name="l_name"  placeholder="Last Name"autocomplete="off"/></td>
                        </tr>
                       	<tr>
                        	<td><label>Contact No:</label></td>
                            <td><input type="number" name="patient_contact_no" required placeholder="" autocomplete="off"/></td>
                            <td><label>Age</label></td>
                            <td><input type="number" name="patient_age" autocomplete="off"/></td>
                            <td><label>Gender: </label></td>
                        	<td>
                        		<select name="patient_gender" style="width:100%;">
                        			<option>--Select--</option>
                        			<option>Male</option>
                        			<option>Female</option>
                        		</select>                        	
                        	</td>
                        </tr>
                        <tr>
                       		<td><label>Date of Appointment:</label></td>
                           	<td><input type="text" name="date_of_appointment" required id="combined-picker1" style="float:left;" readonly autocomplete="off"/></td>
                           	<td>Department: </td>
                        	<td>
                        		<select name="dept" style="width:100%;">
          							<option>--Select--</option>
          								<ba:getDepartmentList/>
          						</select>
          					</td>
                       		<td><label>Consulting Doctor:</label></td>
                           	<td><select name="c_doc" >
          							<option>--Select--</option>
          								<ba:getDoctorList/>
          						</select>
          					</td>
                        </tr>
                        <tr>
                        	<td>Address: </td>
                        	<td colspan="2"><textarea name="patient_address" cols="33" rows=""></textarea></td>
                        	<td>Occupation: </td>
                        	<td><input type="text" name="patient_occupation" autocomplete="off"/></td>
                        </tr>
						<tr>
							<td><input type="hidden" name="registerType" value="Book" />
                           	<td colspan="4"><input type="submit" value="BOOK APPOINTMENT" class="button"/></td>
                        </tr>	
                        </table><!-- 
            	   </p>
        	    </fieldset> -->
    	     </form>                                                            
	    </div>
    </div>
	<!-- /Book New Appointment -->
	
	<!-- Edit Booked Appointment -->
	<div id="small-dialog1" class="mfp-hide">
		<div class="popup">
        	<form name="editappointmentform" action="EditAppointment" method="post">
            	<!-- <fieldset>
                	<legend><label>Book An Appointment</label></legend>
                    <p> -->   
                    <h4><i class="fa fa-pencil"></i>Edit Booked Appointment</h4>                             	
                    	<table cellspacing="20" cellpadding="10" class="popuptable">
                        	<tr>
				            	<td><label>Booking Id:</label></td>
				            	<td><input type="text" name="bookingid" readonly="true" id="bookid" autocomplete="off"/></td>
				            </tr>
				            <tr>     
				            	<td><label>First Name:</label></td>
				                <td><input type="text" name="f_name" required placeholder="First Name" id="f_name" autocomplete="off"/></td>
				                <td><label>Middle Name:</label></td>
				                <td><input type="text" name="m_name"  placeholder="Middle Name" id="m_name" autocomplete="off"/></td>
				                <td><label>Last Name:</label></td>
				                <td><input type="text" name="l_name"  placeholder="Last Name" id="l_name" autocomplete="off"/></td>
                            </tr>
				            <tr>
				            	<td><label>Contact No:</label></td>
				                <td><input type="number" name="patient_contact_no"  id="bookcontact" autocomplete="off"/></td>
				                <td><label>Age</label></td>
				                <td><input type="number" name="patient_age" id="bookage"  autocomplete="off"/></td>
				            	<td><label>Gender: </label></td>
				                <td>
				                	<select name="patient_gender" id="bookgender" style="width:100%;">
				                    	<option>--Select--</option>
				                    	<option>Male</option>
				                    	<option>Female</option>
				                	</select>                        	
				                </td>
				            </tr>
				            <tr>
				            	<td>Department: </td>
				            	<td>
                        			<select name="dept" id="dept1" style="width:100%;">
          								<option>--Select--</option>
          									<ba:getDepartmentList/>
          							</select>
          						</td>
				            	<td><label>Date of Appointment:</label></td>
				            	<td><input type="text" name="date_of_appointment" required id="combined-picker2" style="width:60%;float:left;margin:1em 0 0.5em 2em;" readonly autocomplete="off"/></td>
				            	<td><label>Consulting Doctor:</label></td>
				           		<td><select name="c_doc" id="c_doc1">
          							<option>--Select--</option>
          								<ba:getDoctorList/>
          							</select>
          						</td>
				       		</tr>
				            <tr>
				            	<td>Occupation: </td>
				            	<td><input type="text" name="patient_occupation" id="bookoccupation" autocomplete="off"/></td>
				                <td>Address: </td>
				                <td colspan="2"><textarea name="patient_address"  cols="37" rows="" id="bookaddress" ></textarea></td>				            	
				            </tr>
							<tr>
                            	<td colspan="6">
                            		<input type="submit" value="UPDATE" class="button"/>
                            		<input type="hidden" name="reg_original_datetime" id="original_datetime" />                    	
                            	</td>
                        	</tr>	
                       	</table><!-- 
                    </p>
                </fieldset> -->
            </form>                                                            
        </div>
    </div>
    <!-- /Edit Booked Appointment -->
 			
 	<!-- Edit Registered Booked Appointment -->
	<div id="small-dialog6" class="mfp-hide">
		<div class="popup">
        	<form name="editappointmentform" action="EditAppointment" method="post">
            	<!-- <fieldset>
                	<legend><label>Book An Appointment</label></legend>
                	<p>  --> 
                	<h4><i class="fa fa-pencil"></i>Edit Booked Appointment</h4>                              	
                    	<table cellspacing="20" cellpadding="10" class="popuptable">
                        	<tr>
				            	<td><label>Booking Id:</label></td>
				                <td><input type="text" name="bookingid" readonly="true" id="reg_bookid" /></td>
				            </tr>
				            <tr>     
				            	<td><label>First Name:</label></td>
				            	<td><input type="text" name="f_name"  required placeholder="First Name" id="reg_f_name" autocomplete="off"/></td>
				            	<td><label>Middel Name:</label></td>
				            	<td><input type="text" name="m_name"  placeholder="Middle Name" id="reg_m_name" autocomplete="off"/></td>
				            	<td><label>Last Name:</label></td>
				            	<td><input type="text" name="l_name"  placeholder="Last Name" id="reg_l_name" autocomplete="off"/></td>
					        </tr>
				        	<tr>
				            	<td><label>Contact No:</label></td>
				            	<td><input type="number" name="patient_contact_no" required id="reg_bookcontact" autocomplete="off"/></td>
				           		<td><label>Age</label></td>
				           		<td><input type="number" name="patient_age"  id="reg_bookage" autocomplete="off"/></td>
				           		<td><label>Gender: </label></td>
				            	<td>
				                	<select name="patient_gender" id="reg_bookgender" style="width:100%;">
				                    	<option>--Select--</option>
				                        <option>Male</option>
				                        <option>Female</option>
				                    </select>                        	
				            	</td>
				    		</tr>
				        	<tr>
				            	<td>Occupation: </td>
				             	<td><input type="text" name="patient_occupation" id="reg_bookoccupation" autocomplete="off"/><input type="hidden" name="date_of_appointment" id="reg_doa"/></td>
				            	<td><label>Department</label></td>
				            	<td>
                        			<select name="dept" id="dept" style="width:100%;">
          								<option>--Select--</option>
          									<ba:getDepartmentList/>
          							</select>
          						</td>
				             	<td><label>Cunslting Doctor</label></td>
				              	<td><select name="c_doc" id="c_doc">
          							<option>--Select--</option>
          								<ba:getDoctorList/>
          							</select>
          						</td>
					        </tr>
				      		<tr>
				           		<td>Address: </td>
				             	<td colspan="2"><textarea name="patient_address"  cols="37" rows="" id="reg_bookaddress" ></textarea></td>
				         	</tr>
							<tr>
                            	<td colspan="6">
                            	<input type="submit" value="UPDATE" class="button"/>
                            	<input type="hidden" name="reg_original_datetime" id="reg_original_datetime" />
                            	</td>
                          	</tr>	
                        </table><!-- 
                    </p>
                </fieldset> -->
            </form>                                                            
        </div>
    </div>
    <!-- /Edit Registered Booked Appointment -->
    <!-- Register New Appointment -->
	<div id="small-dialog3" class="mfp-hide">
		<div class="popup">
        	<form name="registerappointmentform" action="RegisterAppointment" method="post">
            	<!-- <fieldset>
                	<legend><label>Patient Registration</label></legend>    -->
                	<h4><i class="fa fa-check-circle"></i>Patient Registration</h4>         	
                    <table cellspacing="20" cellpadding="10" class="popuptable">                                    	
						<tr>
	                    	<td><label>First Name:</label></td>
	                      	<td><input type="text" name="f_name" required placeholder="First Name" autocomplete="off"/></td>
	                       	<td><label>Middel Name:</label></td>
	                      	<td><input type="text" name="m_name"  placeholder="Middle Name" autocomplete="off"/></td>
	                      	<td><label>Last Name:</label></td>
	                      	<td><input type="text" name="l_name"  placeholder="Last Name"  autocomplete="off"/></td>
	                 	</tr>
	                  	<tr>
	                     	<td><label>Contact No:</label></td>
	                      	<td><input type="number" name="patient_contact_no" required autocomplete="off"/></td>
	                     	<td><label>Age</label></td>
	                    	<td><input type="number" name="patient_age"   autocomplete="off"/></td>
	                    	<td><label>Gender: </label></td>
	                    	<td>
	                        	<select name="patient_gender"   style="width:100%;">
	                        		<option>--Select--</option>
	                        		<option>Male</option>
	                        		<option>Female</option>
	                        	</select>                        	
	                       	</td>
	                  	</tr>
	                  	<tr>
	                        <td>Occupation: </td>
	                        <td><input type="text" name="patient_occupation"  autocomplete="off"/></td>
	                         <td><label>Department</label></td>
	                        <td>
                        		<select name="dept"  style="width:100%;">
          							<option>--Select--</option>
          								<ba:getDepartmentList/>
          						</select>
          					</td>
                        	<td><label>Cunsulting Doctor</label></td>
	                        <td><select name="c_doc" >
          							<option>--Select--</option>
          								<ba:getDoctorList/>
          						</select>
          					</td>	                       		
	                    </tr>
	                 	<tr>
	                        <td>Address: </td>
	                        <td colspan="2"><textarea name="patient_address"  cols="34" rows=""  ></textarea></td>
	                    </tr>	                    
                        <tr>
                        	<td><label>Registration Type: </label></td>
                        	<td>
                        		<select name="registertype" id="registertype" onchange="displayForm();" style="width:100%;">
                        			<option>--Select--</option>
                        			<option>OPD</option>
                        			<option>IPD</option>
                        		</select>
                        	</td>	
                        </tr>	
                    </table>
                <div id="registrationForm"></div><!-- 
              </fieldset> -->
            </form>                                                            
        </div>
    </div>
    <!-- /Register New Appointment -->  
    
    
    <!-- Register Book Appointment -->
	<div id="small-dialog5" class="mfp-hide">
		<div class="popup">
        	<form name="registerappointmentform" action="RegisterBookAppointment" method="post">
            	<!-- <fieldset>
                	<legend><label>Patient Registration</label></legend>    -->
                	<h4><i class="fa fa-check-circle"></i>Patient Registration</h4>         	
                    <table cellspacing="20" cellpadding="10" class="popuptable">                                    	
						<tr>
	                    	<td><label>First Name:</label></td>
	                      	<td><input type="text" name="f_name" readonly="readonly" id="f_reg_name" autocomplete="off"/></td>
	                       	<td><label>Middel Name:</label></td>
	                      	<td><input type="text" name="m_name" readonly="readonly" id="m_reg_name" autocomplete="off"/></td>
	                      	<td><label>Last Name:</label></td>
	                      	<td><input type="text" name="l_name" readonly="readonly" id="l_reg_name" autocomplete="off"/></td>
	                 	</tr>
	                  	<tr>
	                     	<td><label>Contact No:</label></td>
	                      	<td><input type="number" name="patient_contact_no" readonly="readonly" id="registercontact" autocomplete="off"/></td>
	                     	<td><label>Age</label></td>
	                    	<td><input type="number" name="patient_age" readonly="readonly"  id="registerage" autocomplete="off"/></td>
	                    	<td><label>Gender: </label></td>
	                    	<td>
	                        	<select name="patient_gender"   id="registergender" style="width:100%;">
	                        		<option>--Select--</option>
	                        		<option>Male</option>
	                        		<option>Female</option>
	                        	</select>                        	
	                       	</td>
	                  	</tr>
	                  	<tr>
	                        <td>Occupation: </td>
	                        <td><input type="text" name="patient_occupation" readonly="readonly" id="registeroccupation" autocomplete="off"/></td>
	                         <td><label>Department</label></td>
	                        <td>
                        		<select name="dept" id="dept2" style="width:100%;">
          							<option>--Select--</option>
          								<ba:getDepartmentList/>
          						</select>
          					</td>
                        	<td><label>Cunsulting Doctor</label></td>
	                        <td><select name="c_doc" id="c_doc2">
          							<option>--Select--</option>
          								<ba:getDoctorList/>
          						</select>
          					</td>	                       		
	                    </tr>
	                 	<tr>
	                        <td>Address: </td>
	                        <td colspan="2"><textarea name="patient_address" readonly="readonly"  cols="34" rows="" id="registeraddress" ></textarea></td>
	                    </tr>	                    
                        <tr>
                        	<td><label>Registration Type: </label></td>
                        	<td>
                        		<select name="registertype" id="registertype1" onchange="displayForm1();" style="width:100%;">
                        			<option>--Select--</option>
                        			<option>OPD</option>
                        			<option>IPD</option>
                        		</select>
                        	</td>	
                        </tr>	
                    </table>
                <div id="registrationForm1"></div><!-- 
              </fieldset> -->
            </form>                                                            
        </div>
    </div>
    <!-- /Register Book Appointment -->  
    
    
                              
    <!-- Edit OPD Appointment -->
	<div id="small-dialog2" class="mfp-hide">
		<div class="popup">
        	<form name="editOpdappointmentform" action="EditOPDAppointment" method="post">
          		<!-- <fieldset>
              		<legend><label>Edit OPD Appointment</label></legend>   -->
              		<h4><i class="fa fa-pencil"></i>Edit OPD Appointment</h4>                                      	
                	<table cellspacing="20" cellpadding="10" class="popuptable">
          				<tr>
          					<td>OPD ID: </td>
          					<td><input type="text" name="edit_opd_id" id="edit_opd_id" readonly="readonly"/></td>
						</tr>
						<tr>	
							<td>First Name: </td>
          					<td><input type="text" name="f_name"  id="f_opd_name" readonly="readonly" autocomplete="off"/></td>
          					<td>Middle Name: </td>
          					<td><input type="text" name="m_name"  id="m_opd_name" readonly="readonly" autocomplete="off"/></td>
          					<td>Last Name: </td>
          					<td><input type="text" name="l_name" required id="l_opd_name" readonly="readonly" autocomplete="off"/></td>
          				</tr>          						
          				<tr>
          					<td>Appointment For:</td>
	          				<td>
     	     					<select name="edit_opd_appointment_for" id="edit_opd_appointment_for" style="width:100%;">
          							<option>--Select--</option>
          								<ba:getDepartmentList/>
          						</select>
          					</td>
          					<td>Date Of Appointment</td>
          					<td><input type="text" name="edit_opd_date_of_appointment" required readonly="readonly" id="combined-picker14"/></td>
          					<td>Consulting Doctor: </td>
          					<td>
          						<select name="edit_opd_consulting_doctor" id="edit_opd_consulting_doctor">
          							<option>--Select--</option>
          								<ba:getDoctorList/>
          						</select>
          					</td>
          				</tr>
          				<tr>
          					<td>Reference Doctor: </td>
          					<td>
          						<select name="edit_opd_reference_doctor" id="edit_opd_reference_doctor">
          							<option>--Select--</option>
          								<ba:getRefernceDoctorList/>
          						</select>
          						<input type="hidden" name="edit_opd_date_of_appointment_org" id="edit_opd_date_of_appointment_org"/>
          					</td>
          				</tr>
          				<tr>
          					<td colspan="6"><input type="submit" value="UPDATE" class="button"/></td>
          				</tr>
          			</table><!-- 
          		</fieldset>	 -->	
      		</form>
      	</div>
    </div>
    <!-- /Edit OPD Appointment --> 
    <!-- Edit IPD Appointment -->
	<div id="small-dialog4" class="mfp-hide">
		<div class="popup">
        	<form name="editIpdappointmentform" action="EditIPDAppointment" method="post">
          		<!-- <fieldset>
              		<legend><label>Edit IPD Appointment</label></legend>  -->
              		<h4><i class="fa fa-pencil"></i>Edit IPD Appointment</h4>                                       	
                	<table cellspacing="20" cellpadding="5" class="popuptable">
          				<tr>
          					<td>IPD ID: </td>
          					<td><input type="text" name="edit_ipd_id" id="edit_ipd_id" readonly="readonly"/></td>
						</tr>
						<tr>	
							<td>First Name: </td>
          					<td><input type="text" name="f_name" required id="f_ipd_name" readonly="readonly" autocomplete="off"/></td>
          					<td>Middle Name: </td>
          					<td><input type="text" name="m_ipd_name" required id="m_ipd_name" readonly="readonly" autocomplete="off"/></td>
          					<td>Last Name: </td>
          					<td><input type="text" name="l_ipd_name" required id="l_ipd_name" readonly="readonly" autocomplete="off"/></td>
          				</tr>          						
						<tr>
							<td>Next To Kin: </td>
							<td><input type="text" name="edit_next_to_kin" id="edit_next_to_kin" autocomplete="off"/>
							<td>Admission Date: </td>
							<td><input type="text" name="edit_admitted_on_datetime" required id="combined-picker15" readonly="readonly" autocomplete="off"/></td>
							<td>Surgeon: </td>
							<td>
								<select name="edit_surgeon" id="edit_surgeon">
									<option>--Select--</option>
										<ba:getDoctorList/>
								</select>
							</td>
						</tr>
						<tr>
							<td>Surgery Date: </td><td><input type="text" id="combined-picker18" readonly="readonly" name="edit_surgery_date"/></td>
							<td>Referred By: </td>
							<td>
								<select name="edit_reffered_by" id="edit_reffered_by">
									<option>--Select--</option>
          								<ba:getRefernceDoctorList/>
          						</select>
								<input type="hidden" name="original_admit_date" id="original_admit_date"/>
							</td>
						</tr>
						<tr>
							<td>Primary Diagnosis: </td>
							<td colspan="2"><textarea rows="3" cols="37" name="edit_primary_diagnosis" id="edit_primary_diagnosis"></textarea></td>						
						</tr>
						<tr>
							<td colspan="6"><input type="submit" value="UPDATE" class="button"/></td><td></td>
						</tr>
          			</table>
          		</fieldset>		
      		</form>
      	</div>
    </div>
    <!-- /Edit IPD Appointment -->     
    
    
    
    <!-- Register opd to ipd Appointment -->
	<div id="small-dialog7" class="mfp-hide">
		<div class="popup">
        	<form name="registerappointmentform" action="RegisterOPDToIPDAppointment" method="post">
            	<!-- <fieldset>
                	<legend><label>Patient Registration</label></legend>    -->
                	<h4><i class="fa fa-check-circle"></i>Patient Registration</h4>         	
                    <table cellspacing="20" cellpadding="10" class="popuptable">
                    	<tr>
                    		<td style="text-align:right;width: 13.5%;">IPD ID: </td>
    						<td><input type="text" name="ipd_id" value="<ba:getIPDID/>" autocomplete="off" style="float:left;margin-left: 3.5em;"/></td>   
                    	</tr>                                    	
						<tr>
	                    	<td><label>First Name:</label></td>
	                      	<td><input type="text" name="f_name" id="first_name_type" required placeholder="First Name" autocomplete="off"/></td>
	                       	<td><label>Middel Name:</label></td>
	                      	<td><input type="text" name="m_name" id="middel_name_type"  placeholder="Middle Name" autocomplete="off"/></td>
	                      	<td><label>Last Name:</label></td>
	                      	<td><input type="text" name="l_name" id="last_name_type"  placeholder="Last Name"  autocomplete="off"/></td>
	                 	</tr>
	                  	<tr>
	                     	<td><label>Contact No:</label></td>
	                      	<td><input type="number" name="patient_contact_no" id="contact_type" required autocomplete="off"/></td>
	                     	<td><label>Age</label></td>
	                    	<td><input type="number" name="patient_age"  id="age_type"  autocomplete="off"/></td>
	                    	<td><label>Gender: </label></td>
	                    	<td>
	                        	<select name="patient_gender" id="gen"   style="width:100%;">
	                        		<option>--Select--</option>
	                        		<option>Male</option>
	                        		<option>Female</option>
	                        	</select>                        	
	                       	</td>
	                  	</tr>
	                  	<tr>
	                        <td>Occupation: </td>
	                        <td><input type="text" name="patient_occupation" id="occu"  autocomplete="off"/></td>
	                         <td><label>Department</label></td>
	                        <td>
                        		<select name="dept" id="dept_name" style="width:100%;">
          							<option>--Select--</option>
          								<ba:getDepartmentList/>
          						</select>
          					</td>
                        	<td><label>Cunsulting Doctor</label></td>
	                        <td><select name="c_doc" id="cult_doc" >
          							<option>--Select--</option>
          								<ba:getDoctorList/>
          						</select>
          					</td>	                       		
	                    </tr>
	                 	<tr>
	                        <td>Address: </td>
	                        <td colspan="2"><textarea name="patient_address" id="add_ipd"  cols="34" rows=""  ></textarea></td>
	                    </tr>	                    
                        <tr>
                        	<td><label>Registration Type: </label></td>
                        	<td>
                        		<input type="text" name="registertype" id="res_type" value="IPD">
                        	</td>	
                        </tr>	
                        <tr>
                        	<td>Next To Kin: </td>
                        	<td><input type="text" name="next_to_kin"/></td>
                        	<td>Admission Date: </td>
                        	<td><input type="text" name="admitted_on_datetime" id="combined-picker4" readonly="readonly"/></td>
                        	<td>Surgery Date: </td><td><input type="text" id="combined-picker7" readonly="readonly" name="surgery_date" /></td>
                        </tr>
                        <tr>
                        	<td>Primary Diagnosis: </td>
                        	<td colspan="2"><textarea rows="5" cols="45" name="primary_diagnosis"></textarea></td>
                        	<td>Referred By: </td>
                        	<td><select name="reffered_by" >
                        		<option>--Select--</option>
                        			<ba:getRefernceDoctorList/>
                        		</select>
                        	</td>
                        </tr>
                        <tr>
                        	<td>Advance amount</td>
                        	<td><input type="number" name="advance_amount" value="0" ></td>
               
                        </tr>
                        <tr>
                        	<td colspan="6"><input type="hidden" name="opd_id"  id="adv_opd_id" /><input type="submit" value="REGISTER" class="button" style="margin:1em 0;\"/></td><td></td></tr>
                    </table>
               
            </form>                                                            
        </div>
    </div>
   
      
                             
</body>
</html>