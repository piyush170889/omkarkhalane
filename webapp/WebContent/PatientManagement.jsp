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
		
	 	$('#OPDdetailsTable').dataTable();	 	
		
	 	$('#IPDdetailsTable').dataTable();	 	
		$('#bookAppointmentTable').dataTable();
	});
	</script>
    <!-- /Intialize Scripts on page load -->
    
 <!-- Edit Appointment Js -->
 <script type="text/javascript">
	/*function sendOPDValue(id, nm, cntcno, adate, cdoctor, rdoctor){
		document.getElementById("id").value = id;
		document.getElementById("name").value = nm;
		document.getElementById("contact").value = cntcno;
		document.getElementById("combined-picker1").value = adate;
		document.getElementById("Cdoctor").value = cdoctor;
		document.getElementById("Rdoctor").value = rdoctor;		
	}
	
	function sendIPDValue(id,nm,contact, adate,ddate, edate, FD,sdate){
		document.getElementById("edit_ipd_id").value = id;
		document.getElementById("edit_ipd_name").value = nm;
		document.getElementById("edit_ipd_Contact").value = contact;
		document.getElementById("combined-picker2").value = adate;
		document.getElementById("combined-picker3").value = ddate;
		document.getElementById("combined-picker4").value = edate; 
		document.getElementById("FD").value = FD;
		document.getElementById("combined-picker15").value = sdate;
	} */
	
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
	
	function sendEditOPDVal(opdid, opdname, opdcontact, opdappointmentfor, opddoa, opdconsultingdoc, opdreferencedoc,m_name,l_name) {
		document.getElementById("edit_opd_id").value = opdid;
		document.getElementById("f_opd_name").value = opdname;
		document.getElementById("m_opd_name").value = m_name;
		document.getElementById("l_opd_name").value = l_name;
		document.getElementById("edit_opd_Contact").value = opdcontact;
		document.getElementById("edit_opd_appointment_for").value = opdappointmentfor;
		document.getElementById("combined-picker14").value = opddoa;
		document.getElementById("edit_opd_consulting_doctor").value = opdconsultingdoc;
		document.getElementById("edit_opd_reference_doctor").value = opdreferencedoc;
		document.getElementById("edit_opd_date_of_appointment_org").value = opddoa;
	}
	
	function sendEditIPDVal(ipdid, ipdname, ipdnexttokin, admitdate, primarydiagnosis, finaldiagnosis, surgeon, surgerydate, anaesthetist, anaesthesiatype, refrencedoc,m_name,l_name) {
		document.getElementById("edit_ipd_id").value = ipdid;
		document.getElementById("f_ipd_name").value = ipdname;
		document.getElementById("m_ipd_name").value = m_name;
		document.getElementById("l_ipd_name").value = l_name;
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
    
   
    
    <!--  Individual Patient Search -->
    <div class="advanceSearch" style="width:40%;margin:1em 3em;">
    	<h4><i class="fa fa-search"></i>Individual Patient Search</h4>
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
	    					<td><input type="text" id="searchID" onkeyup="this.value=this.value.toUpperCase()" name="id" size="10" autocomplete="off"><input type="hidden" name="current" value="" autocomplete="off"></td>
	    					
	    					<td>Contact :</td>
							<td ><input type="text" name="contact" id="searchContact" size="10" autocomplete="off"></td>	
		    			</tr>		
	    			<tr>
	    			<td colspan="4"><input align="middle" onclick="return  SearchP()" name="search1" type="submit" value="SEARCH" style="font-family:Candara;margin: 0 1em;color: #FFFFFF;background-color: #337ab7;padding: 0.2em 1.4em 0.3em;border-radius: 3px;border: 1px solid #337ab7;" /></td>
	    			</tr>
	    			</thead>
	    			<tbody>
	    					
	    			</tbody>
	    		</table>
	    		</form>
    		</div>
    </div>
    <!--  /Follow-Up Patient Search -->
    
     <!--  Advance Search -->
    <div class="advanceSearch" style="width:40%;margin:1em;">
    	<h4><i class="fa fa-search"></i>Advance Search</h4>
    		<div>
    			<form action="PatientManagement.jsp" method="get">
	    		<table  border="0" cellspacing="0" cellpadding="0" class="responstable" style="border-radius:0px;border-left:3px solid #337AB7;border-right:3px solid #337AB7;border-bottom:3px solid #337AB7;border-top:0px;">
	    			<thead>	
	    			</thead>
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
	    					<td><input type="hidden" name="current" value="PatientManagement"></td>
	    				</tr>
	    				<tr>
	    					<td>Date Range: </td><td><input type="text" name="startDate" id="combined-picker9" style="width:70%;"/><label style="margin-left:1.4em;">TO</label></td><td><input type="text" name="endDate" id="combined-picker10" style="width:70%;"/><input type="hidden" name="advanceSearch" value="advanceSearch"/></td>
	    				</tr>
	    				<tr>
	    					<td colspan="3"><input type="submit" onclick="return APSearch()" name="search2" value="SEARCH" style="font-family:Candara;margin: 0 1em;color: #FFFFFF;background-color: #337ab7;padding: 0.2em 1.4em 0.3em;border-radius: 3px;border: 1px solid #337ab7;" /></td>
	    				</tr>
	    			</tbody>
	    		</table>
	    		</form>
    		</div>
    </div>
    
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
      			<thead>
      			<% if(searchty.equals("IPD")){ %>
	      			
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
		                    <!-- <th>Actions</th> -->
		                </tr>
		           
	                
                <%}else{ %>
                	<tr>
						<th>ID</th>
                        <th>Name</th>
                        <th>Contact No.</th>
                        <th>Admit Date</th>
                        <th>Appointment For</th>
                        <th>Consultant Doctor</th>
                        <th>Referance Doctor</th>
                        <!-- <th>Actions</th> -->
                   </tr>
                   <%} %>  
                    </thead>     
              		<tbody>
      					<ba:getAdvanceSearchpatientDetails1 startDate="<%= startdt %>" endDate="<%= enddt %>" searchType="<%= searchty %>" />
      				</tbody>
              
         </table>
        </div>
              <!-- Todays Booking Info -->
                            
    <%
    	}else{
    %>
    <!-- Appointment Information -->
    <div class="appointment_info">
    	<h5>Patient Information</h5>
    </div>
    <!-- /Appointment Information -->
    <!-- Tabs -->
    <div id="tabs" class="tabs" style="float:left;">
				<nav>
					<ul>
						<li style="width:50%"><a href="#section-1"><span>OPD</span></a></li>
						<li style="width:50%"><a href="#section-2"><span>IPD</span></a></li>
					</ul>
				</nav>
				<div class="content">
					<section id="section-1">
						<div class="mediabox">
							<!-- OPD Info -->
                            <div class="book_appointment_table">
                            	<table class="responstable" border="2" id="OPDdetailsTable">
                            	
                                	<thead>                                    	
                                    	<tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Contact No.</th>
                                            <th>Admit Date</th>
											<th>Appointment For</th>
                                            <th>Consultant Doctor</th>
                                            <th>Referance Doctor</th>
                                            <th>Actions</th>
                                        </tr>    
                                    </thead>
                                    <tbody>
                                    		<ba:getOPDPatientDetails/>
                                    </tbody>
                                    
                                </table>
                            </div>
                            <!-- IPD Info -->
                            
						</div>
					</section>
					<section id="section-2">
						 <!-- IPD Info -->
                            <div class="book_appointment_table">
                            	<table class="responstable" border="2" id="IPDdetailsTable">
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
                                    		<ba:getIPDPatientDetails/>
                                    </tbody>
<!-- <tfoot>
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
                                    </tfoot> -->
                                </table>
                            </div>
                            <!-- Todays OPD Info -->
					</section>
					</div>
					</div>
	 <!-- /tabs -->   
    <!-- Required JS for tabs -->
    <script src="js/cbpFWTabs.js"></script>
		<script>
			new CBPFWTabs( document.getElementById( 'tabs' ) );
		</script>
    <!-- /Required JS for tabs -->  
				<%} %>	
    
    
    
    
    <!-- Edit OPD Appointment -->
		<div id="small-dialog2" class="mfp-hide">
			<div class="popup">
        		<form name="editOpdappointmentform" action="EditOPDPatient" method="post">
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
          							<td><input type="text" name="f_opd_name"  required  id="f_opd_name" autocomplete="off"/></td>
          							<td>Middle Name: </td>
          							<td><input type="text" name="m_opd_name" required id="m_opd_name" autocomplete="off" /></td>
          							<td>Last Name: </td>
          							<td><input type="text" name="l_opd_name" required id="l_opd_name" autocomplete="off"/></td>
          						</tr>          						<tr>
          							<td>Contact:</td>
          							<td>
          								<input type="number" name="edit_opd_Contact" required id="edit_opd_Contact" autocomplete="off"/></td>
          									
          							<td>Date of Admit</td>
          							<td><input type="text" name="edit_opd_date_of_admit" required readonly="readonly" id="combined-picker14"/></td>
          							<td>Appointment For: </td>
          							<td>
          								<select name="edit_opd_appointment_for" id="edit_opd_appointment_for">
          									<option>--Select--</option>
          									<ba:getDepartmentList/>
          								</select>
          							</td>
          						</tr>
          						<tr>
								<tr>
          							<td>Reference Doctor: </td>
          							<td>
          								<select name="edit_opd_reference_doctor"  id="edit_opd_reference_doctor">
          									<option>--Select--</option>
          									<ba:getRefernceDoctorList/>
          								</select>
          								
          							</td>
          							<td>Consulting Doctor: </td>
          							<td>
          								<select name="edit_opd_consulting_doctor"  id="edit_opd_consulting_doctor">
          									<option>--Select--</option>
          									<ba:getDoctorList/>									
         									
          								</select>
										<input type="hidden" name="orgDate" id="edit_opd_date_of_appointment_org" />
          							</td>
          						</tr>
          						<tr>
          							<td colspan="6"><input type="submit" value="UPDATE" class="button"/></td>
          						</tr>
          					</table>
          			</fieldset>		
      			</form>
      		</div>
      	</div>
      <!-- /Edit OPD Appointment --> 
      
      
	<!-- Edit IPD Appointment -->
		<div id="small-dialog4" class="mfp-hide">
			<div class="popup">
        		<form name="editIpdappointmentform" action="EditIPDAppointmentInDetail" method="post">
          			<!-- <fieldset>
              			<legend><label>Edit IPD Appointment</label></legend>      -->
              			<h4><i class="fa fa-pencil"></i>Edit IPD Appointment</h4>                                   	
                			<table cellspacing="20" cellpadding="10" class="popuptable">
          						<tr>
          							<td>IPD ID: </td>
          							<td><input type="text" name="edit_ipd_id" id="edit_ipd_id" readonly="readonly"/></td>
								</tr>	
								<tr>	
									<td>First Name: </td>
          							<td><input type="text" name="f_ipd_name" required id="f_ipd_name" autocomplete="off"/></td>
          							<td>Middle Name: </td>
          							<td><input type="text" name="m_ipd_name" required id="m_ipd_name" autocomplete="off"/></td>
          							<td>Last Name: </td>
          							<td><input type="text" name="l_ipd_name" required id="l_ipd_name" autocomplete="off"/></td>
          						</tr>          						
								<tr>
									<td>Next To Kin</td>
									<td><input type="text" name="edit_next_to_kin" id="edit_next_to_kin" autocomplete="off"/>
									<td>Addmision Date: </td>
									<td><input type="text" name="edit_admitted_on_datetime" required id="combined-picker15" readonly="readonly" /></td>
									<td>Surgeon: </td>
									<td>
										<select name="edit_surgeon" id="edit_surgeon">
										<option>--Select--</option>
											<ba:getDoctorList/>
										</select>
									</td>
								</tr>
								<tr>
									<td>Date Time of Surgery: </td>
									<td>
										<input type="text"  id="combined-picker18" readonly="readonly" name="edit_surgery_date"/>
									</td>
									<td>Anaesthesia Doctor</td>
									<td>
										<input type="text" name="edit_anaesthetist" id="edit_anaesthetist" autocomplete="off">
									</td>
									<td>Anaesthesia Type: </td>
									<td>
									<select name="edit_anaesthesia_type" id="edit_anaesthesia_type"><option>--Select--</option><option>GA</option><option>SA</option><option>EA</option><option>LA</option><option>BLOCK</option></select>
									</td>
								</tr>
								<tr>
									<td>Primary Diagnosis: </td>
									<td colspan="2"><textarea rows="3" cols="37" name="edit_primary_diagnosis" id="edit_primary_diagnosis"></textarea></td>
									<td>Final Diagnosis</td>
									<td colspan="2"><textarea rows="3" cols="37" name="edit_final_diagnosis" id="edit_final_diagnosis"></textarea></td>
								</tr>
									<tr>
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

										<td colspan="6"><input type="submit" value="UPDATE" class="button"/></td><td></td>
									</tr>
          					</table><!-- 
          			</fieldset>		 -->
      			</form>
      		</div>
      	</div>
      <!-- /Edit IPD Appointment -->   
    </body>
</html>