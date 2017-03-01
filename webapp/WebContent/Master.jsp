<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="WEB-INF/bookAppointment.tld" prefix="ba"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Omkar Khalane Hospital</title>
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
		
	 	$('#viewServiceTable').dataTable();
	 	$('#viewReceptionTable').dataTable();
	 	$('#viewDoctorTable').dataTable();
	 	$('#viewRefernceDoctorTable').dataTable();
	 	$('#viewDepartmentsTable').dataTable();
	 	$('#viewRoomTable').dataTable();
	 	 			
	});
	</script>
    <!-- /Intialize Scripts on page load -->
    
    
    <script type="text/javascript">
    function displayForm(){
		var selectedOption = document.getElementById("masterSelect").options[document.getElementById("masterSelect").selectedIndex].text;
		if(selectedOption == "Doctor Master"){
			document.getElementById("masterSpace").innerHTML = document.getElementById("doctorMaster").innerHTML;	
		}else if(selectedOption == "Reception Master"){
			document.getElementById("masterSpace").innerHTML = document.getElementById("receptionMaster").innerHTML ;
		}else if(selectedOption == "Service Master"){
			document.getElementById("masterSpace").innerHTML = document.getElementById("serviceMaster").innerHTML ;
		}else if(selectedOption == "Department Master"){
			document.getElementById("masterSpace").innerHTML = document.getElementById("DeparmentMaster").innerHTML ;
		}else if(selectedOption == "Refernce Doctor Master"){
			document.getElementById("masterSpace").innerHTML = document.getElementById("referncedoctorMaster").innerHTML ;
		}else if(selectedOption == "Room Type Master"){
			document.getElementById("masterSpace").innerHTML = document.getElementById("roomMaster").innerHTML ;
		}else if(selectedOption == "--Select--"){
			document.getElementById("masterSpace").innerHTML = "";
		}	
		initializeCombinedPicker();
	}
    
    function displayViewForm(){
    	var selectedOption = document.getElementById("viewMasterSelect").options[document.getElementById("viewMasterSelect").selectedIndex].text;
    	if(selectedOption == "View Doctors"){
			document.getElementById("viewmasterSpace").innerHTML = document.getElementById("viewDoctorsdiv").innerHTML;	
		}else if(selectedOption == "View Receptions"){
			document.getElementById("viewmasterSpace").innerHTML = document.getElementById("viewReceptiondiv").innerHTML ;
		}else if(selectedOption == "View Services"){
			document.getElementById("viewmasterSpace").innerHTML = document.getElementById("viewServicesdiv").innerHTML ;
		}else if(selectedOption == "View Refernce Doctors Master"){
			document.getElementById("viewmasterSpace").innerHTML = document.getElementById("viewRefernceDoctorsdiv").innerHTML ;
		}else if(selectedOption == "View Departments"){
			document.getElementById("viewmasterSpace").innerHTML = document.getElementById("viewDepartmentsdiv").innerHTML ;
		}else if(selectedOption == "View Room Type"){
			document.getElementById("viewmasterSpace").innerHTML = document.getElementById("viewRoomdiv").innerHTML ;
		}else if(selectedOption == "--Select--"){
			document.getElementById("viewmasterSpace").innerHTML = "";
		}	
		initializeCombinedPicker();
    }
    
    function sendServiceVal(serviceId, serviceName, servicePrice){
    	document.getElementById("serviceId").value = serviceId;
    	document.getElementById("serviceName").value = serviceName;
    	document.getElementById("servicePrice").value = servicePrice;
    }
    function sendRoomVal(roomId, roomtype, room_per_price){
    	document.getElementById("roomId").value = roomId;
    	document.getElementById("roomtype").value = roomtype;
    	document.getElementById("room_per_price").value = room_per_price;
    }
    
    function sendDepartmentVal(D_id, D_Name, HOD){
    	document.getElementById("DId").value = D_id;
    	document.getElementById("DName").value = D_Name;
    	document.getElementById("hod").value = HOD;
    }
    
    function sendDocotrVal(id,name,age,gender,address,contact,consultingFees,education,specialization,medregno){
    	document.getElementById("doctorId").value = id;
    	document.getElementById("doctorName").value = name;
    	document.getElementById("doctorAge").value = age;
    	document.getElementById("doctorGender").value = gender;
    	document.getElementById("doctorAddress").value = address;
    	document.getElementById("doctorContact").value = contact;
    	document.getElementById("doctorConsultingFees").value = consultingFees;
    	document.getElementById("doctorEducation").value = education;
    	document.getElementById("doctorSpecialization").value = specialization;
    	document.getElementById("doctormedregno").value = medregno;
    }
    
    function sendRefernceDocotrVal(id,name,age,gender,address,contact,education,specialization){
	  	document.getElementById("RdoctorId").value = id;
    	document.getElementById("RdoctorName").value = name;
    	document.getElementById("RdoctorAge").value = age;
    	document.getElementById("RdoctorGender").value = gender;
    	document.getElementById("RdoctorAddress").value = address;
    	document.getElementById("RdoctorContact").value = contact;
    	document.getElementById("RdoctorEducation").value = education;
    	document.getElementById("RdoctorSpecialization").value = specialization;
    }
 		
  
    function sendReceptionVal(id,name,dateOfJoining,age,gender,contact,education,address,email){
    	document.getElementById("receptionId").value = id;
    	document.getElementById("receptionName").value = name;
    	document.getElementById("combined-picker11").value = dateOfJoining;
    	document.getElementById("receptionAge").value = age;
    	document.getElementById("receptionGender").value = gender;
    	document.getElementById("receptionContact").value = contact;
    	document.getElementById("receptionEducation").value = education;
    	document.getElementById("receptionAddress").value = address;
    	document.getElementById("receptionEmail").value = email;
    }
	</script>
	
</head>
<body>
    <!-- Menu -->
    	<jsp:include page="menu.jsp"></jsp:include>
    <!-- Menu --> 
    
    <!-- Select Add Master Type Details -->
		<div class="advanceSearch" style="margin:2em 0 0 7em;border-radius:0;">
    	<h4><i class="fa fa-file"></i>Master Add Details</h4>
    		<table cellspacing="5" cellpadding="10" class="book_appointment_table">
               <tr>
               		<td style="text-align:right;">Select Add Master: </td>
               		<td>
               			<select onchange="displayForm();" id="masterSelect">
               				<option>--Select--</option>
               				<option>Doctor Master</option>
               				<option>Reception Master</option>
               				<option>Service Master</option>
               				<option>Department Master</option>
               				<option>Refernce Doctor Master</option>
               				<option>Room Type Master</option>
               			</select>
               		</td>
               </tr>
           </table> 
           
           <!-- Masters Space -->
	           <div id="masterSpace"></div>
           <!-- /Master Space -->
              
     	</div>  	
     <!-- /Select Add Master Type Details -->
    	
   	 <!-- Appointment Information -->
    	<div class="appointment_info">
    	</div>
     <!-- /Appointment Information -->
    <!-- Tabs -->
    <div id="tabs" class="tabs" style="float:left;">
		<nav>
			<ul>
				<li style="width:17%;" ><a href="#section-1"><span>View Service Master</span></a></li>
				<li style="width:17%;"><a href="#section-2"><span>View Reception Master</span></a></li>
				<li style="width:17%;"><a href="#section-3"><span>View Doctors Master</span></a></li>
				<li style="width:17%;"><a href="#section-4"><span>View Refernce Doctors</span></a></li>
				<li style="width:16%;"><a href="#section-5"><span>View Departments</span></a></li>
				<li style="width:16%;"><a href="#section-6"><span>View Room Type</span></a></li>
			</ul>
		</nav>
		<div class="content">
			<section id="section-1">
				<div class="mediabox">
                </div>
							 
                <!--  View Service Master -->
    				<div class="book_appointment_table"  id="viewServicesdiv">
    					<table class="responstable" id="viewServiceTable">
    						<thead>
    							<tr>
    								<th style="display:none;">Sr No.</th>
						    		<th>Service Id</th>
						    			<th>Service Name</th>
						    			<th>Service Value</th>
						    			<th>Actions</th>
								</tr>
						    </thead>
							<tbody>
								<ba:viewServiceDetails></ba:viewServiceDetails>
							</tbody>
						</table>
						    </div>
    	        <!-- /View Service Master -->
                            
            </section>   
						
			<section id="section-2">
				<div class="mediabox">
				</div>
			<!-- View reception master -->
    			<div class="book_appointment_table"  id="viewReceptiondiv">
    				<table class="responstable" id="viewReceptionTable">
    					<thead>
    						<tr>
    							<th style="display:none;">Sr No.</th>
    							<th>Reception Id</th>
    							<th>Reception Name</th>
    							<th>Date Of Joining</th>
    							<th>Age</th>
    							<th>Gender</th>
    							<th>Contact</th>
    							<th>Education</th>
    							<th>E-mail</th>
    							<th>Address</th>
    							<th>Actions</th>
    						</tr>
    					</thead>
    					<tbody>
    						<ba:viewReceptionDetails></ba:viewReceptionDetails>
    					</tbody>
    				</table>
    			</div>
    		<!-- /View reception master -->					
			</section>
			
			<section id="section-3">
				<div class="mediabox">
				</div>
			<!--  View Doctors Master -->
    			<div class="book_appointment_table"  id="viewDoctorsdiv">
    				<table class="responstable" id="viewDoctorTable">
    					<thead>
    						<tr>
    							<th style="display:none;">Sr No.</th>
    							<th>Doctors Id</th>
    							<th>Doctors Name</th>
    							<th>Age</th>
    							<th>Gender</th>
    							<th>Address</th>
    							<th>Contact</th>
    							<th>Consulting Fees</th>
    							<th>Education</th>
    							<th>Specializatio</th>
    							<th>Medical Reg. No.</th>
    							<th>Actions</th>
    						</tr>
    					</thead>
    					<tbody>
    						<ba:viewDocotrsDetails/>
    					</tbody>
    				</table>
    			</div>
    		<!-- /View Doctors Master -->
			</section>
					
			<section id="section-4">
				<div class="mediabox">
				</div>
			<!--  View Refernce Doctors Master -->
    			<div class="book_appointment_table"  id="viewRefernceDoctorsdiv">
    				<table class="responstable" id="viewRefernceDoctorTable">
    					<thead>
    						<tr>
    							<th style="display:none;">Sr No.</th>
    							<th>Refernce Doctors Id</th>
    							<th>Doctors Name</th>
   				 				<th>Age</th>
    							<th>Gender</th>
   				 				<th>Clinic name & Address</th>
    							<th>Contact</th>
    							<th>Education</th>
    							<th>Specializatio</th>
    							<th>Actions</th>
    						</tr>
    					</thead>
    					<tbody>
    						<ba:viewRDocotrsDetails/>
    					</tbody>
    				</table>
    			</div>
    		<!-- /View Refernce Doctors Master -->
			</section>
			<section id="section-5">
				<div class="mediabox">
				</div>
			<!--  View Departments Master -->
    			<div class="book_appointment_table"  id="viewDepartmentsdiv">
    				<table class="responstable" id="viewDepartmentsTable">
    					<thead>
    						<tr>
    							<th style="display:none;">Sr No.</th>
    							<th>Department Id</th>
    							<th>Department Name</th>
    							<th>HOD</th>
    							<th>Creation Date</th>
    							<th>Action</th>
    							
    						</tr>
    					</thead>
    					<tbody>
    						<ba:viewDepartmentDetails/>
    					</tbody>
    				</table>
    			</div>
    		<!-- /View Departments Master -->
			</section>
			<section id="section-6">
				<div class="mediabox">
                </div>
							 
                <!--  View Room type Master -->
    				<div class="book_appointment_table"  id="viewRoomdiv">
    					<table class="responstable" id="viewRoomTable">
    						<thead>
    							<tr>
    								<th style="display:none;">Sr No.</th>
						    		<th>Room Id</th>
						    		<th>Room Type</th>
						    		<th>Room per Price</th>
						    		<th>Actions</th>
								</tr>
						    </thead>
							<tbody>
								<ba:viewRoomDetails/>
							</tbody>
						</table>
						    </div>
    	        <!-- /View Room type Master -->
                            
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
    
    
     
    <!-- Doctors Master -->
    	<div id="doctorMaster" style="display:none;">
    		<form action="AddDoctor" method="post">
    			<table cellspacing="2" cellpadding="5" class="book_appointment_table">
               		<tr>
               			<td>Doctor Id: </td><td><input type="text" name="doctorId" value="<ba:getDoctorId/>" readonly="readonly" /></td>
               			<td></td><td></td>
               		</tr>
               		<tr>
               			<td>Name: </td><td><input type="text" required name="doctorName"  autocomplete="off"/></td>
               			<td>Age: </td><td><input type="number"  name="doctorAge" style="width: 11em;"  autocomplete="off"/></td>
               			<td>Gender: </td><td><select name="doctorGender"><option>--Select--</option><option>Male</option><option>Female</option></select></td>
              		</tr>
               		<tr>
               			<td>Contact: </td><td><input type="number"  name="doctorContact" autocomplete="off"/></td>
               			<td>Education: </td><td><input type="text"  name="doctorEducation" autocomplete="off"/></td>
               			<td>Specialization: </td><td><input type="text"  name="doctorSpecialization" autocomplete="off"/></td>
               		</tr>
               		<tr>
               			<td>Consulting Fees</td><td><input type="number" name="doctorConsultingFees" autocomplete="off"/></td>
						<td>Medical Registration No. :</td><td><input type="text"  name="med_reg_no" autocomplete="off"/></td>
               			<td>Address: </td><td><textarea cols="30"   rows="5" name="doctorAddress" id="doctorAddress"></textarea></td>
               		</tr>
               		<tr>
               			<td colspan="4"><input type="submit" value="SAVE" style="font-family: Candara;margin: 0 1em 0 40em;color: #FFFFFF;background-color: #337ab7;padding: 0.2em 1.4em 0.3em;border-radius: 3px;border: 1px solid #337ab7;"/></td>
               		</tr>
				</table>
			</form>  
		</div>             
    <!-- /Doctors Master -->
    	
    	
    	
    <!-- Refernce Doctors Master -->
    	<div id="referncedoctorMaster" style="display:none;">
    		<form action="AddRDoctor" method="post">
    			<table cellspacing="2" cellpadding="5" class="book_appointment_table">
             		<tr>
               			<td>Doctor Id: </td><td><input type="text" name="RdoctorId" value="<ba:getRDoctorId/>" readonly="readonly"/></td>
               			<td></td><td></td>
               		</tr>
              		<tr>
               			<td>Name: </td><td><input type="text" required name="RdoctorName" autocomplete="off" /></td>
               			<td>Doctor Age: </td><td><input type="number"  name="RdoctorAge"  autocomplete="off"/></td>
               			<td>Gender: </td><td><select name="RdoctorGender" ><option>--Select--</option><option>Male</option><option>Female</option></select></td>
              		</tr>
               		<tr>
               			<td>Contact: </td><td><input type="number"  name="RdoctorContact" autocomplete="off"/></td>
               			<td>Education: </td><td><input type="text"  name="RdoctorEducation" autocomplete="off"/></td>
               			<td>Specialization: </td><td><input type="text" name="RdoctorSpecialization" autocomplete="off"/></td>
               			</tr>
              	 	<tr>
               			<td>Clinic name and Address: </td><td><textarea cols="30"  rows="5" name="RdoctorAddress"></textarea></td>
               		</tr>
               		<tr>
               			<td colspan="4"><input type="submit" value="SAVE" style="font-family: Candara;margin: 0 1em 0 40em;color: #FFFFFF;background-color: #337ab7;padding: 0.2em 1.4em 0.3em;border-radius: 3px;border: 1px solid #337ab7;"/></td>
               		</tr>
				</table>
			</form>  
		</div>             
    <!-- /Refernce Doctors Master -->
    	
    	
    	
    	
    	
	<!-- Departments Master -->
    	<div id="DeparmentMaster" style="display:none;">
    	<form action="AddDepartment" method="post">
    	<table cellspacing="2" cellpadding="5" class="book_appointment_table">
             		<tr>
               			<td>Department Id: </td><td><input type="text" name="DId" value="<ba:getDeptId/>" readonly="readonly"   /></td>
               			<td></td><td></td>
               		</tr>
              		<tr>
               			<td>Department Name: </td><td><input type="text"  name="DName"  autocomplete="off"/></td>
               			<td>Name Of HOD: </td>
               			<td>
          					<select name="hod" id="edit_opd_consulting_doctor">
          							<option>--Select--</option>
          								<ba:getDoctorList/>
          					</select>
          				</td>
              		</tr>
               		<tr>
               			<td colspan="4"><input type="submit" value="SAVE" style="font-family: Candara;margin: 0 1em 0 40em;color: #FFFFFF;background-color: #337ab7;padding: 0.2em 1.4em 0.3em;border-radius: 3px;border: 1px solid #337ab7;"/></td>
               		</tr>
				</table>
		</form>  
		</div>             
    	<!-- /Departmentd Master -->
        
    	
    	<!-- Service Master -->
    	<div id="serviceMaster" style="display:none;">
    	<form action="AddServices" method="post">
    	<table cellspacing="2" cellpadding="5" class="book_appointment_table">
               <tr>
               		<td>Service Id: </td><td><input type="text" name="serviceId" value="<ba:getServiceId/>" readonly="readonly"  /></td>
               		<td></td><td></td>
               </tr>
               <tr>
               		<td>Service Name: </td><td><input type="text" required name="serviceName"  autocomplete="off"/></td>
               		<td>Service Price: </td><td><input type="number" required name="servicePrice" autocomplete="off"/></td>
               </tr>
               <tr>
               		<td colspan="4"><input type="submit" value="SAVE" style="font-family: Candara;margin: 0 1em 0 40em;color: #FFFFFF;background-color: #337ab7;padding: 0.2em 1.4em 0.3em;border-radius: 3px;border: 1px solid #337ab7;"/></td>
               </tr>
		</table>
		</form>  
		</div>     
    	<!-- Service Master -->
    	
    	 <!-- Reception Master -->
    	<div id="receptionMaster" style="display:none;">
    	<form action="AddReception" method="post">
    	<table cellspacing="2" cellpadding="5" class="book_appointment_table">
               <tr>
               		<td>Reception Id: </td><td><input type="text" name="receptionId" value="<ba:getReceptionId />" readonly="readonly" /></td>
               		<td></td><td></td>
               </tr>
               <tr>
               		<td>Name: </td><td><input type="text" required name="receptionName"  autocomplete="off"/></td>
               		<td>Age: </td><td><input type="number"  name="receptionAge" autocomplete="off" /></td>
               		<td>Gender: </td><td><select name="receptionGender"><option>--Select--</option><option>Male</option><option>Female</option></select></td>
               </tr>
               <tr>
               		<td>Contact: </td><td><input type="number"  name="receptionContact" autocomplete="off"/></td>
               		<td>Education: </td><td><input type="text"  name="receptionEducation" autocomplete="off"/></td>
               		<td>Date Of Joining:</td><td><input type="text" name="receptionJoiningDate"  id="combined-picker" autocomplete="off"/></td>
               </tr>
               <tr>
               	<td>CRM Password: </td><td><input type="text" required name="receptionPassword" autocomplete="off"/></td>
               	<td>E-mail: </td><td><input type="text" required name="E-mail" autocomplete="off"/></td> 
               	<td>CRM Username: </td><td><input type="text" required name="receptionUserName" autocomplete="off"/></td>
               </tr>
               <tr>
               	<td>Address: </td><td><textarea cols="30"  rows="5" name="receptionAddress" ></textarea></td>
               </tr>
               <tr>
               		<td colspan="6"><input type="submit" value="SAVE" style="font-family: Candara;margin: 0 1em 0 40em;color: #FFFFFF;background-color: #337ab7;padding: 0.2em 1.4em 0.3em;border-radius: 3px;border: 1px solid #337ab7;"/></td>
               </tr>
		</table>
		</form>  
		</div>
    	<!-- /Reception Master -->
    	
    	
    	<!-- Room Master -->
    	<div id="roomMaster" style="display:none;">
    	<form action="AddRoom" method="post">
    	<table cellspacing="2" cellpadding="5" class="book_appointment_table">
               <tr>
               		<td>Room Id: </td><td><input type="text" name="roomId" value="<ba:getRoomId/>" readonly="readonly"  /></td>
               		<td></td><td></td>
               </tr>
               <tr>
               		<td>Room Type: </td><td><input type="text" required name="roomtype"  autocomplete="off"/></td>
               		<td>Room Per Price: </td><td><input type="number" required name="room_per_price" autocomplete="off"/></td>
               </tr>
               <tr>
               		<td colspan="4"><input type="submit" value="SAVE" style="font-family: Candara;margin: 0 1em 0 40em;color: #FFFFFF;background-color: #337ab7;padding: 0.2em 1.4em 0.3em;border-radius: 3px;border: 1px solid #337ab7;"/></td>
               </tr>
		</table>
		</form>  
		</div>     
    	<!-- Room Master -->
    
    	
    	<!-- Edit Services Master -->
    	<div id="small-dialog1" class="mfp-hide">
			<div class="popup">
                 <form name="editappointmentform" action="EditServices" method="post">
                   	<!-- <fieldset>
                       <legend><label>Edit Services</label></legend>
                           <p>   -->
                           <h4><i class="fa fa-pencil"></i>Edit Services</h4>                              	
                             <table cellspacing="20" cellpadding="10" class="popuptable">
                             	<tr>
               						<td>Service Id: </td><td><input type="text" name="serviceId" readonly="readonly" id="serviceId" /></td>
               						<td></td><td></td>
               					</tr>
               					<tr>
               						<td>Service Name: </td><td><input type="text" required name="serviceName" id="serviceName"  autocomplete="off"/></td>
               						<td>Service Price: </td><td><input type="number" required name="servicePrice" id="servicePrice" autocomplete="off"/></td>
              					 </tr>
              					 <tr>
               						<td colspan="4"><input type="submit" value="SAVE" class="button"/></td>
              					 </tr>
                             </table>
                            <!--  </p>
                    </fieldset> -->
                 </form>
            </div>
       </div>                
    	<!-- Edit Services Master -->
    	
    	<!-- Edit Doctors Master  -->
    	<div id="small-dialog2" class="mfp-hide">
			<div class="popup">
                 <form name="editappointmentform" action="EditDoctors" method="post">
                   	<!-- <fieldset>
                       <legend><label>Edit Doctors</label></legend>
                           <p> -->
                           <h4><i class="fa fa-pencil"></i>Edit Doctors</h4>                                	
                             <table cellspacing="20" cellpadding="10" class="popuptable">
                             	<tr>
               						<td>Doctor Id: </td><td><input type="text" name="doctorId" readonly="readonly" id="doctorId" /></td>
               						<td></td><td></td>
              					 </tr>
             					<tr>
									<td>Gender: </td><td><select name="doctorGender" id="doctorGender"><option>--Select--</option><option>Male</option><option>Female</option></select></td>
               						<td>Name: </td><td><input type="text" required name="doctorName"  id="doctorName" autocomplete="off"/></td>
               						<td>Doctor Age: </td><td><input type="number"  name="doctorAge" id="doctorAge" autocomplete="off"/></td>
               					</tr>
               					<tr>
               						<td>Contact: </td><td><input type="number"  name="doctorContact" id="doctorContact" autocomplete="off"/></td>
               						<td>Education: </td><td><input type="text"  name="doctorEducation" id="doctorEducation" autocomplete="off"/></td>
               						<td>Specialization: </td><td><input type="text"  name="doctorSpecialization" id="doctorSpecialization" autocomplete="off"/></td>
               					</tr>
               					<tr>
               						<td>Consulting Fees</td><td><input type="number"  name="doctorConsultingFees" id="doctorConsultingFees" autocomplete="off"/></td>
               						<td>Medical Reg. No. :</td><td><input type="text"  name="doctormedregno" id="doctormedregno" autocomplete="off"/></td>
               					</tr>
              					 <tr>
               						<td colspan="4"><input type="submit" value="SAVE" class="button"/></td>
               					</tr>
                             </table><!-- 
                             </p>
                    </fieldset> -->
                 </form>
            </div>
       </div>     	
    	<!-- /Edit Doctors Master  -->
    	
    	<!-- Edit Reception master -->
    	<div id="small-dialog3" class="mfp-hide">
    	<div class="popup">
		<form name="editappointmentform" action="EditReception" method="post">
    	<h4><i class="fa fa-pencil"></i>Edit Recption</h4>
    	<table cellspacing="2" cellpadding="5" class="popuptable">
               <tr>
               		<td>Reception Id: </td><td><input type="text" name="receptionId" readonly="readonly" id="receptionId" /></td>
               		<td></td><td></td>
               </tr>
               <tr>
               		<td>Name: </td><td><input type="text" required name="receptionName"  id="receptionName" autocomplete="off"/></td>
               		<td>Date Of Joining:</td><td><input type="text"  name="receptionJoiningDate" id="combined-picker11" autocomplete="off"/></td>
               		<td>Age: </td><td><input type="number"  name="receptionAge" id="receptionAge" autocomplete="off"/></td>
               	</tr>
               	<tr>	
               		
               		<td>Gender: </td><td><select name="receptionGender" id="receptionGender"><option>--Select--</option><option>Male</option><option>Female</option></select></td>
               		<td>Contact: </td><td><input type="Number"  name="receptionContact" id="receptionContact" autocomplete="off"/></td>
               		<td>Education: </td><td><input type="text"  name="receptionEducation" id="receptionEducation" autocomplete="off"/></td>
               </tr>
               <tr>
               		<td>Address: </td><td><textarea cols="30"  rows="5" name="receptionAddress" id="receptionAddress" ></textarea></td>               		
               		<td>Email: </td><td><input type="text"  name="receptionEmail" id="receptionEmail" autocomplete="off"/></td>
               </tr>
               <tr>
               		<td colspan="4"><input type="submit" value="SAVE" class="button"/></td>
               </tr>
		</table>
		 </form>
		</div>
		</div>
    	<!-- Edit Reception master -->
    	
    	
    	
    	<!-- Edit Refernce Doctors Master  -->
    	<div id="small-dialog4" class="mfp-hide">
			<div class="popup">
                 <form name="editappointmentform" action="EditRDoctors" method="post">
                   	<!-- <fieldset>
                       <legend><label>Edit Refernce Doctors</label></legend>
                           <p>  -->
                     <h4><i class="fa fa-pencil"></i>Edit Reference Doctor</h4>                               	
                             <table cellspacing="20" cellpadding="10" class="popuptable">
                             	<tr>
               						<td>Doctor Id: </td><td><input type="text" name="doctorId" id="RdoctorId" readonly="readonly" /></td>
               						<td></td><td></td>
              					 </tr>
             					<tr>
									<td>Gender: </td><td><select  name="doctorGender" id="RdoctorGender"><option>--Select--</option><option>Male</option><option>Female</option></select></td>
               						<td>Name: </td><td><input type="text" required name="doctorName"  id="RdoctorName" autocomplete="off"/></td>
               						<td>Doctor Age: </td><td><input type="number"  name="doctorAge" id="RdoctorAge" autocomplete="off"/></td>
               					</tr>
               					<tr>
               						<td>Contact: </td><td><input type="number"  name="doctorContact" id="RdoctorContact" autocomplete="off"/></td>
               						<td>Education: </td><td><input type="text"  name="doctorEducation" id="RdoctorEducation" autocomplete="off"/></td>
               						<td>Specialization: </td><td><input type="text" name="doctorSpecialization" id="RdoctorSpecialization" autocomplete="off"/></td>
               					</tr>
               					<tr>
               						
               						<td>Clinic name and Address</td><td><textarea cols="30"  rows="5" name="doctorAddress" id="RdoctorAddress" ></textarea></td>
               					</tr>
              					 <tr>
               						<td colspan="4"><input type="submit" value="Update" class="button"/></td>
               					</tr>
                             </table>
                             <!-- </p> 
                    </fieldset> -->
                 </form>
            </div>
       </div>     	
       <!-- /Edit Refernce Doctors Master  -->
       
       
       <!-- Edit Department Master  -->
    	<div id="small-dialog5" class="mfp-hide">
			<div class="popup">
                 <form name="editappointmentform" action="EditDepartment" method="post">
                   <!-- 	<fieldset>
                       <legend><label>Edit Doctors</label></legend>
                           <p> -->
                           <h4><i class="fa fa-pencil"></i>Edit Department</h4>                                	
                             <table cellspacing="20" cellpadding="10" class="popuptable">
                             	 <tr>
               						<td>Department Id: </td><td><input type="text" id="DId" name="D_Id" value="<ba:getServiceId/>" readonly="readonly"  /></td>
               						<td></td><td></td>
               					</tr>
              					<tr>
               						<td>Department Name: </td><td><input type="text" required id="DName" name="D_Name" autocomplete="off" /></td>
               						<td>Name of HOD: </td>
               						<td>
               							<select name="hod" id="hod">
          									<option>--Select--</option>
          									<ba:getDoctorList/>
          								</select>
               						</td>
             				    </tr>
               					<tr>
               						<td colspan="4"><input type="submit" value="Update" class="button"/></td>
              					 </tr>
                             </table><!-- 
                          </p>
                    </fieldset> -->
                 </form>
            </div>
       </div>     	
    	<!-- /Edit Department Master  -->
    	
    	<!-- Edit Room Master -->
    	<div id="small-dialog6" class="mfp-hide">
			<div class="popup">
                 <form name="editappointmentform" action="EditRoom" method="post">
                   	<!-- <fieldset>
                       <legend><label>Edit Rooms</label></legend>
                           <p> --> 
                           <h4><i class="fa fa-pencil"></i>Edit Rooms</h4>                               	
                             <table cellspacing="20" cellpadding="10" class="popuptable">
                             	<tr>
               						<td>Room Id: </td><td><input type="text" name="roomId" id="roomId" readonly="readonly" /></td>
               						<td></td><td></td>
               					</tr>
               					<tr>
               						<td>Room Type: </td><td><input type="text" required name="roomtype" id="roomtype"  autocomplete="off"/></td>
               						<td>Room per Price: </td><td><input type="number" required name="room_per_price" id="room_per_price" autocomplete="off"/></td>
              					 </tr>
              					 <tr>
               						<td colspan="4"><input type="submit" value="SAVE" class="button"/></td>
              					 </tr>
                             </table><!-- 
                             </p>
                    </fieldset> -->
                 </form>
            </div>
       </div>                
    	<!-- Edit Services Master -->
    	
</body>
</html>