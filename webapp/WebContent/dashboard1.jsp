	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	 	$('#bookAppointmentTable').dataTable({   
            bJQueryUI: true,
            sPaginationType: "full_numbers"
});
	 	$('#opdAppointmentTable').dataTable();
	 	$('#ipdAppointmentTable').dataTable();	 			
	});
	</script>
    <!-- /Intialize Scripts on page load -->
    
 <!-- Edit Appointment Js -->
 <script type="text/javascript">
	function sendBookVal(bid, nm, cntcno, age, gender, address, occ, doa){
		document.getElementById("bookid").value = bid;
		document.getElementById("bookname").value = nm;
		document.getElementById("bookcontact").value = cntcno;
		document.getElementById("bookage").value = age;
		document.getElementById("bookgender").value = gender;
		document.getElementById("bookaddress").value = address;
		document.getElementById("bookoccupation").value = occ; 
		document.getElementById("combined-picker2").value = doa;		
	}
	
	function sendRegisterVal(regnm, regcntcno,  regage, reggender, regaddress, regocc, regdoa){
		document.getElementById("registername").value = regnm;
		document.getElementById("registercontact").value = regcntcno;
		document.getElementById("registerage").value = regage;
		document.getElementById("registergender").value = reggender;
		document.getElementById("registeraddress").value = regaddress;
		document.getElementById("registeroccupation").value = regocc; 
		document.getElementById("registertype").selectedIndex = 0;
		document.getElementById("registrationForm").innerHTML = "";
	}
	
	function displayForm(){
		var selectedOption = document.getElementById("registertype").options[document.getElementById("registertype").selectedIndex].text;
		if(selectedOption == "OPD"){
			document.getElementById("registrationForm").innerHTML = document.getElementById("opd_reg_id").innerHTML+"<div id=\"opd_registration_form\"><table class=\"book_appointment_table\"><tr><td>Appointment For: </td><td><select name=\"opd_appointment_for\"><option>--Select--</option><option>Orthopedic</option><option>Physiotheraphy</option><option>Other</option></select></td><td>Date Time of Appointment: </td><td><input type=\"text\" name=\"datetime_of_appointment\" id=\"combined-picker13\" readonly=\"readonly\"/></td></tr><tr><td>Consulting Doctor</td><td><select name=\"consulting_doctor\"><option>Doctor 1</option><option>Doctor 2</option></select></td><td>Reference Doctor:<input type=\"hidden\" name=\"appointment_type\" value=\"New\"/><input type=\"hidden\" name=\"ipd_id\" value=\"Not Registered\"/></td><td><input name=\"reference_doctor\" type=\"text\" /></td></tr><tr><td colspan=\"2\"><input type=\"submit\" value=\"SAVE\" /></td></tr></table></div>";	
		}else if(selectedOption == "IPD"){
			document.getElementById("registrationForm").innerHTML = document.getElementById("ipd_reg_id").innerHTML+"<div id=\"ipd_registration_form\" ><table class=\"book_appointment_table\"><tr><td>Next To Kin Mr./Mrs: </td><td><input type=\"text\" name=\"next_to_kin\"/></td><td>Admitted On Date Time: </td><td><input type=\"text\" name=\"admitted_on_datetime\" id=\"combined-picker4\" readonly=\"readonly\"/></td></tr><tr><td>Primary Diagnosis: </td><td><textarea rows=\"5\" cols=\"45\" name=\"primary_diagnosis\"></textarea></td><td>Final Diagnosis: </td><td><textarea rows=\"5\" cols=\"45\" name=\"final_diagnosis\"></textarea></td></tr><tr><td>Surgeon: </td><td><select name=\"surgeon\"><option>Doctor 1</option><option>Doctor 2</option></select></td><td>Date Time of Surgery: </td><td><input type=\"text\" id=\"combined-picker7\" readonly=\"readonly\" name=\"surgery_date\" /></td></tr><tr><td>Anaesthetist Doctor: </td><td><select name=\"anaesthetist\"><option>Doctor 1</option><option>Doctor 2</option></select></td><td>Anaesthesia Type: </td><td><select name=\"anaesthesia_type\"><option>GA</option><option>SA</option><option>EA</option><option>LA</option><option>BLOCK</option></select></td></tr><tr><td>Referred By: </td><td><input type=\"text\" name=\"reffered_by\"/></td></tr><tr><td colspan=\"3\"><input type=\"hidden\" name=\"opd_id\" value=\"Not Registered\"/><input type=\"submit\" value=\"REGISTER\" /></td><td></td></tr></table></div>";
		}else if(selectedOption == "--Select--"){
			document.getElementById("registrationForm").innerHTML = "";
		}	
		initializeCombinedPicker();
	}
	
	function sendEditOPDVal(opdid, opdname, opdcontact, opdappointmentfor, opddoa, opdconsultingdoc, opdreferencedoc) {
		document.getElementById("edit_opd_id").value = opdid;
		document.getElementById("edit_opd_name").value = opdname;
		document.getElementById("edit_opd_appointment_for").value = opdappointmentfor;
		document.getElementById("combined-picker14").value = opddoa;
		document.getElementById("edit_opd_consulting_doctor").value = opdconsultingdoc;
		document.getElementById("edit_opd_reference_doctor").value = opdreferencedoc;
		document.getElementById("edit_opd_date_of_appointment_org").value = opddoa;
	}
	
	function sendEditIPDVal(ipdid, ipdname, ipdnexttokin, admitdate, primarydiagnosis, finaldiagnosis, surgeon, surgerydate, anaesthetist, anaesthesiatype, refrencedoc) {
		document.getElementById("edit_ipd_id").value = ipdid;
		document.getElementById("edit_ipd_name").value = ipdname;
		document.getElementById("edit_next_to_kin").value = ipdnexttokin;
		document.getElementById("combined-picker15").value = admitdate;
		document.getElementById("edit_primary_diagnosis").value = primarydiagnosis;
		document.getElementById("edit_final_diagnosis").value = finaldiagnosis;
		document.getElementById("edit_surgeon").value = surgeon;
		document.getElementById("combined-picker18").value = surgerydate;
		document.getElementById("edit_anaesthetist").value = anaesthetist;
		document.getElementById("edit_anaesthesia_type").value = anaesthesiatype;
		document.getElementById("edit_reffered_by").value = refrencedoc;
		document.getElementById("original_admit_date").value = admitdate;
	}
</script>
 <!-- Edit Appointment Js -->
 
</head>
<body>
	<!-- header -->
    <!-- <div class="omk_header">
    	<div class="userinfo">
            <div class="userpic">
                <i class="fa fa-user"></i>
            </div>            
            <p>administrator</p>
        </div>     
    </div>     -->
    <!-- /header -->

  
    <!-- Menu -->
    <jsp:include page="menu.jsp"></jsp:include>
    <!-- Menu --> 
    
    <!-- Doctor List -->
    <div id="doctorList" style="display:none;">
    	<ba:getDoctorList/>
    </div>
    <!-- Doctor List -->
    
    <!-- Appointment management Options -->
    <div class="manage_appointments">
	 			<a href="#small-dialog" class="popup-with-zoom-anim"><i class="fa fa-plus"></i>Book New Appointment</a>
	 			<a href="#small-dialog3" class="popup-with-zoom-anim" onclick="sendRegisterVal('','','','','','','',1)"><i class="fa fa-check"></i>Register New Patient</a>	         	
    </div>	
    <!-- Appointment Management Options -->
    
    <!--  Follow-Up Patient Search -->
    <div class="advanceSearch" style="width:50%;margin:1em 2em;">
    	<h4><i class="fa fa-search"></i>Follow-Up Patient Search</h4>
    		<div  style="padding: 0.5em;">
	    		<table  border="2" class="responstable" id="advanceSearchTable">
	    			<thead>
	    				<tr>
		    				<th style="font-size:12px;">ID</th>
		    				<th style="font-size:12px;">NAME</th>
		    				<th style="font-size:12px;">CONTACT</th>
		    				<th style="font-size:12px;">LAST APPOINTMENT DATE</th>
		    				<th style="font-size:12px;">PREVIOUS BALANCE</th>
		    				<th style="font-size:12px;">ACTIONS</th>
		    			</tr>	
	    			</thead>
	    			<tbody>
	    					
	    			</tbody>
	    		</table>
    		</div>
    </div>
    <!--  /Follow-Up Patient Search -->
    
     <!--  Advance Search -->
    <div class="advanceSearch" style="width:40%;margin:1em;">
    	<h4><i class="fa fa-search"></i>Advance Search</h4>
    		<div style="padding:0 0.5em">
    			<form action="dashboard.jsp" method="get">
	    		<table  border="0" cellspacing="0" cellpadding="0" class="responstable" id="advanceSearchTable">
	    			<thead>	
	    			</thead>
	    			<tbody>
	    				<tr>
	    					<td>Registration Type: </td>
	    					<td>
	    						<select name="advanceSearchType" >
	    							<option>--Select--</option>
	    							<option>OPD</option>
	    							<option>IPD</option>
	    							<option>Follow-Up</option>
	    						</select>
	    					</td>
	    					<td></td>
	    				</tr>
	    				<tr>
	    					<td>Date Range: </td><td><input type="text" name="startDate" id="combined-picker9" style="width:70%;"/><label style="margin-left:1.4em;">TO</label></td><td><input type="text" name="endDate" id="combined-picker10" style="width:70%;"/><input type="hidden" name="advanceSearch" value="advanceSearch"/></td>
	    				</tr>
	    				<tr>
	    					<td colspan="3"><input type="submit" value="SEARCH" style="font-family:Candara;margin: 0 1em;color: #FFFFFF;background-color: #337ab7;padding: 0.2em 1.4em 0.3em;border-radius: 3px;border: 1px solid #337ab7;" /></td>
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
    <!-- Appointment Information -->
    <div class="appointment_info">
    	<h5>Appointment Information From : <%= request.getParameter("startDate") %> To <%= request.getParameter("endDate") %></h5>
    </div>
    <!-- /Appointment Information -->
    
      <!-- Todays Booking Info -->
      <div class="book_appointment_table">
      	<table class="responstable" border="2" id="bookAppointmentTable">
              		<ba:getAdvanceSearchDetails startDate="<%= startdt %>" endDate="<%= enddt %>" searchType="<%= searchty %>" />
              <tfoot>
              	<tr>
	               	<td colspan="7" style="padding:0;margin:0.3em">
	                   	<a href="#" style="color:#333;">Email This List</a>
	                </td>
	                <td colspan="3">
	               		<label>EXPORT</label>
	                    <select name="export_to" style="float:none;width:30%;margin:left:1em;">
							<option value="pdf">PDF</option>		                                                    
							<option value="doc">DOC</option>
	                       	<option value="xls">XLS</option>
	                    </select>
	            	</td>	
              	</tr>    
             </tfoot>
         </table>
         </div>
              <!-- Todays Booking Info -->
                            
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
						<li><a href="#section-2"><span>Todays OPD Appointments</span></a></li>
						<li><a href="#section-3"><span>Todays IPD Appointments</span></a></li>
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
                                            <th>Actions</th>
                                        </tr>    
                                    </thead>
                                    <tbody>
                                    		<ba:getTodaysBookedAppointmentDetails />
                                    </tbody>
                                    <tfoot>
                                    	<tr>
	                                    	<td colspan="6" style="padding:0;margin:0.3em">
	                                        	<a href="#" style="color:#333;">Email This List</a>
	                                        </td>
	                                        <td colspan="3">
	                                        	<label>EXPORT</label>
	                                                <select name="export_to" style="float:none;width:30%;margin:left:1em;">
														<option value="pdf">PDF</option>		                                                    
														<option value="doc">DOC</option>
	                                                    <option value="xls">XLS</option>
	                                                </select>
	                                        </td>
	                                    </tr>    
                                    </tfoot>
                                </table>
                            </div>
                            <!-- Todays Booking Info -->
                            
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
                                    <tfoot>
                                    	<tr>
	                                    	<td colspan="7" style="padding:0;margin:0.3em">
	                                        	<a href="#" style="color:#333;">Email This List</a>
	                                        </td>
	                                        <td colspan="3">
	                                        	<label>EXPORT</label>
	                                                <select name="export_to" style="float:none;width:30%;margin:left:1em;">
														<option value="pdf">PDF</option>		                                                    
														<option value="doc">DOC</option>
	                                                    <option value="xls">XLS</option>
	                                                </select>
	                                        </td>
	                                    </tr>    
                                    </tfoot>
                                </table>
                            </div>
                            <!-- Todays OPD Info -->
					</section>
					<section id="section-3">
						<div class="mediabox">
                        	 <div class="info">
                            	<p>
                                	<i class="fa fa-thumbs-up"></i>
                                    <span><ba:getTodaysIPDCount/></span>Total IPD Appointments
                                    <i class="fa fa-check"></i>
                                    <span></span>Appointments Attended
                                    <i class="fa fa-warning"></i>
                                    <span></span>Appointments Not Attended                                    
                                    <i class="fa fa-stop"></i>
                                    <span></span>Appointment Cancelled                                    
                                </p>
                            </div>
						</div>
						
						<!-- Todays OPD Info -->
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
                                    <tfoot>
                                    	<tr>
	                                    	<td colspan="8" style="padding:0;margin:0.3em">
	                                        	<a href="#" style="color:#333;">Email This List</a>
	                                        </td>
	                                        <td colspan="2">
	                                        	<label>EXPORT</label>
	                                                <select name="export_to" style="float:none;width:30%;margin:left:1em;">
														<option value="pdf">PDF</option>		                                                    
														<option value="doc">DOC</option>
	                                                    <option value="xls">XLS</option>
	                                                </select>
	                                        </td>
	                                    </tr>    
                                    </tfoot>
                                </table>
                            </div>
                            <!-- Todays IPD Info -->
					</section>
				<!--	<section id="section-4">
						<div class="mediabox">
                        
						</div>
					</section> -->
				</div><!-- /content -->
			</div><!-- /tabs -->    
    <!-- /tabs -->   
    <!-- Required JS for tabs -->
    <script src="js/cbpFWTabs.js"></script>
		<script>
			new CBPFWTabs( document.getElementById( 'tabs' ) );
		</script>
    <!-- /Required JS for tabs -->    
    
    <!-- OPD Registration ID -->
    <div id="opd_reg_id" style="display: none;">
    	<table class="book_appointment_table">
	    	<tr>
	    		<td>OPD ID: </td>
	    		<td><input type="text" name="opd_id" value="<ba:getOPDID/>" readonly="readonly"/></td>
	    	</tr>
    	</table>
    </div>
    <!-- /OPD Registration ID -->
    
    <!-- IPD Registration ID -->
    <div id="ipd_reg_id" style="display: none;">
    <table class="book_appointment_table">
    	<tr>
    		<td>IPD ID: </td>
    		<td><input type="text" name="ipd_id" value="<ba:getIPDID/>" /></td>    		
    	</tr>
    </table>
    </div>
    <!-- /IPD Registration ID -->
   
   <!-- POP-UP FORMS -->
   
   <!-- Book New Appointment -->
	<div id="small-dialog" class="mfp-hide">
		<div class="bookappointment">
			 <form name="bookappointmentform" action="BookAppointment" method="post">
               	<fieldset>
                   <legend><label>Book An Appointment</label></legend>
                   <p>                                	
                       <table cellspacing="20" cellpadding="10" class="book_appointment_table">
                       	<tr>
                           	<td><label>Booking Id:</label></td>
                               <td><input type="text" name="bookingid" value="<ba:getBookingId />" readonly="readonly"/></td>
                               <td><label>Name:</label></td>
                               <td><input type="text" name="patient_name" placeholder="Enter Name Here"/></td>
                           </tr>
                       	<tr>
                        	<td><label>Contact No:</label></td>
                            <td><input type="text" name="patient_contact_no" placeholder="Enter Contact No.  Here"/></td>
                            <td><label>Age</label></td>
                            <td><input type="text" name="patient_age" /></td>
                        </tr>
                        <tr>
                        	<td><label>Gender: </label></td>
                        	<td>
                        		<select name="patient_gender">
                        			<option>--Select--</option>
                        			<option>Male</option>
                        			<option>Female</option>
                        		</select>                        	
                        	</td>
                        	<td>Address: </td>
                        	<td><textarea name="patient_address" cols="" rows=""></textarea></td>
                        </tr>
                        <tr>
                        	<td>Occupation: </td>
                        	<td><input type="text" name="patient_occupation" /></td>
                       		<td><label>Date of Appointment:</label></td>
                           	<td><input type="text" name="date_of_appointment" id="combined-picker1" style="width:60%;float:left;margin:1em 0 0.5em 2em;" readonly/></td>
                        </tr>
						<tr>
                           	<td colspan="3"><input type="submit" value="BOOK" /></td>
                        </tr>	
                     </table>
            	</p>
        	  </fieldset>
    	    </form>                                                            
	    </div>
    </div>
	<!-- /Book New Appointment -->
	
	 						<!-- Edit Booked Appointment -->
							<div id="small-dialog1" class="mfp-hide">
							<div class="bookappointment">
                            <form name="editappointmentform" action="EditAppointment" method="post">
                            	<fieldset>
                                <legend><label>Book An Appointment</label></legend>
                                <p>                                	
                                    <table cellspacing="20" cellpadding="10" class="book_appointment_table">
                                    	<tr>
				                           	<td><label>Booking Id:</label></td>
				                               <td><input type="text" name="bookingid" readonly="true" id="bookid"/></td>
				                               <td><label>Name:</label></td>
				                               <td><input type="text" name="patient_name" placeholder="Enter Name Here" id="bookname"/></td>
				                           </tr>
				                       	<tr>
				                        	<td><label>Contact No:</label></td>
				                            <td><input type="text" name="patient_contact_no" placeholder="Enter Contact No.  Here" id="bookcontact"/></td>
				                            <td><label>Age</label></td>
				                            <td><input type="text" name="patient_age" id="bookage"/></td>
				                        </tr>
				                        <tr>
				                        	<td><label>Gender: </label></td>
				                        	<td>
				                        		<select name="patient_gender" id="bookgender">
				                        			<option>--Select--</option>
				                        			<option>Male</option>
				                        			<option>Female</option>
				                        		</select>                        	
				                        	</td>
				                        	<td>Address: </td>
				                        	<td><textarea name="patient_address" cols="" rows="" id="bookaddress" ></textarea></td>
				                        </tr>
				                        <tr>
				                        	<td>Occupation: </td>
				                        	<td><input type="text" name="patient_occupation" id="bookoccupation" /></td>
				                       		<td><label>Date of Appointment:</label></td>
				                           	<td><input type="text" name="date_of_appointment" id="combined-picker2" style="width:60%;float:left;margin:1em 0 0.5em 2em;" readonly/></td>
				                        </tr>
										<tr>
                                        	<td colspan="2"><input type="submit" value="UPDATE" /></td>
                                        </tr>	
                                    </table>
                                </p>
                                </fieldset>
                            </form>                                                            
                            </div>
                            </div>
                            <!-- /Edit Booked Appointment -->
 			
 			<!-- Register New Appointment -->
			<div id="small-dialog3" class="mfp-hide">
			<div class="bookappointment">
                     <form name="registerappointmentform" action="RegisterAppointment" method="post">
                     	<fieldset>
                         <legend><label>Patient Registration</label></legend>            	
                             <table cellspacing="20" cellpadding="10" class="book_appointment_table">                                    	
							<tr>
	                           	<td><label>Name:</label></td>
	                            <td><input type="text" name="patient_name" placeholder="Enter Name Here" id="registername"/></td>
	                            <td></td><td></td>
	                        </tr>
	                       	<tr>
	                        	<td><label>Contact No:</label></td>
	                            <td><input type="text" name="patient_contact_no" placeholder="Enter Contact No.  Here" id="registercontact"/></td>
	                            <td><label>Age</label></td>
	                            <td><input type="text" name="patient_age" id="registerage"/></td>
	                        </tr>
	                        <tr>
	                        	<td><label>Gender: </label></td>
	                        	<td>
	                        		<select name="patient_gender" id="registergender">
	                        			<option>--Select--</option>
	                        			<option>Male</option>
	                        			<option>Female</option>
	                        		</select>                        	
	                        	</td>
	                        	<td>Address: </td>
	                        	<td><textarea name="patient_address" cols="" rows="" id="registeraddress" ></textarea></td>
	                        </tr>
	                        <tr>
	                        	<td>Occupation: </td>
	                        	<td><input type="text" name="patient_occupation" id="registeroccupation" /></td>	                       		
	                        </tr>
                            <tr>
                        		<td><label>Registration Type: </label></td>
                        		<td>
                        			<select name="registertype" id="registertype" onchange="displayForm();">
                        				<option>--Select--</option>
                        				<option>OPD</option>
                        				<option>IPD</option>
                        			</select>
                        		</td>	
                        	</tr>	
                        </table>
                        <div id="registrationForm"></div>
                    </p>
                    </fieldset>
                </form>                                                            
              </div>
            </div>
      <!-- /Register New Appointment -->                            
      
      	<!-- Edit OPD Appointment -->
		<div id="small-dialog2" class="mfp-hide">
			<div class="bookappointment">
        		<form name="editOpdappointmentform" action="EditOPDAppointment" method="post">
          			<fieldset>
              			<legend><label>Edit OPD Appointment</label></legend>                                        	
                			<table cellspacing="20" cellpadding="10" class="book_appointment_table">
          						<tr>
          							<td>OPD ID: </td>
          							<td><input type="text" name="edit_opd_id" id="edit_opd_id" readonly="readonly"/></td>
									<td>Name: </td>
          							<td><input type="text" name="edit_opd_name" id="edit_opd_name" readonly="readonly"/></td>
          						</tr>          						<tr>
          							<td>Appointment For:</td>
          							<td>
          								<select name="edit_opd_appointment_for" id="edit_opd_appointment_for">
          									<option>--Select--</option>
          									<option>Orthopedic</option>
          									<option>Physiotheraphy</option>
          									<option>Other</option>
          								</select>
          							</td>
          							<td>Date Of Appointment</td>
          							<td><input type="text" name="edit_opd_date_of_appointment" readonly="readonly" id="combined-picker14"/></td>
          						</tr>
          						<tr>
          							<td>Consulting Doctor: </td>
          							<td>
          								<select name="edit_opd_consulting_doctor" id="edit_opd_consulting_doctor">
          									<option>--Select--</option>
          									<option>Doctor 1</option>
          									<option>Doctor 2</option>          									
          								</select>
          							</td>
          							<td>Reference Doctor: </td>
          							<td><input type="text" name="edit_opd_reference_doctor" id="edit_opd_reference_doctor" />
          								<input type="hidden" name="edit_opd_date_of_appointment_org" id="edit_opd_date_of_appointment_org"/>
          							</td>
          						</tr>
          						<tr>
          							<td colspan="3"><input type="submit" value="UPDATE OPD DETAILS" /></td>
          						</tr>
          					</table>
          			</fieldset>		
      			</form>
      		</div>
      	</div>
      <!-- /Edit OPD Appointment --> 
      
      	<!-- Edit IPD Appointment -->
		<div id="small-dialog4" class="mfp-hide">
			<div class="bookappointment">
        		<form name="editIpdappointmentform" action="EditIPDAppointment" method="post">
          			<fieldset>
              			<legend><label>Edit IPD Appointment</label></legend>                                        	
                			<table cellspacing="20" cellpadding="10" class="book_appointment_table">
          						<tr>
          							<td>IPD ID: </td>
          							<td><input type="text" name="edit_ipd_id" id="edit_ipd_id" readonly="readonly"/></td>
									<td>Name: </td>
          							<td><input type="text" name="edit_ipd_name" id="edit_ipd_name" readonly="readonly"/></td>
          						</tr>          						
								<tr>
									<td>Next To Kin Mr./Mrs: </td>
									<td><input type="text" name="edit_next_to_kin" id="edit_next_to_kin"/>
									<td>Admitted On Date Time: </td>
									<td><input type="text" name="edit_admitted_on_datetime" id="combined-picker15" readonly="readonly" /></td>
								</tr>
								<tr>
									<td>Primary Diagnosis: </td>
									<td><textarea rows="5" cols="45" name="edit_primary_diagnosis" id="edit_primary_diagnosis"></textarea></td>
									<td>Final Diagnosis: </td><td><textarea rows="5" cols="45" name="edit_final_diagnosis" id="edit_final_diagnosis"></textarea></td>
								</tr>
								<tr>
									<td>Surgeon: </td>
									<td>
										<select name="edit_surgeon" id="edit_surgeon">
											<option>Doctor 1</option>
											<option>Doctor 2</option>
										</select>
									</td>
									<td>Date Time of Surgery: </td><td><input type="text" id="combined-picker18" readonly="readonly" name="edit_surgery_date"/></td>
									</tr>
									<tr>
										<td>Anaesthetist Doctor: </td>
										<td>
											<select name="edit_anaesthetist" id="edit_anaesthetist">
												<option>Doctor 1</option>
												<option>Doctor 2</option>
											</select>
										</td>
										<td>Anaesthesia Type: </td>
											<td>
												<select name="edit_anaesthesia_type" id="edit_anaesthesia_type">
													<option>GA</option>
													<option>SA</option>
													<option>EA</option>
													<option>LA</option>
													<option>BLOCK</option>
												</select>
											</td>
									</tr>
									<tr>
										<td>Referred By: </td><td><input type="text" name="edit_reffered_by" id="edit_reffered_by"/>
										<input type="hidden" name="original_admit_date" id="original_admit_date"/>
										</td>
									</tr>
									<tr>
										<td colspan="3"><input type="submit" value="Update IPD Details" /></td><td></td>
									</tr>
          					</table>
          			</fieldset>		
      			</form>
      		</div>
      	</div>
      <!-- /Edit IPD Appointment -->       
      <%
    	}
      %>               
<!-- /Check if advance Search or normal page load -->                            
</body>
</html>