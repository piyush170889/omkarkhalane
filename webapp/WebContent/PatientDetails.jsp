<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="WEB-INF/bookAppointment.tld" prefix="ba"%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Patient Details</title>

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
	 	$('#opdAppointmentDetails').dataTable();
	 	$('#ipdhistory').dataTable();
	});
	</script>
    <!-- /Intialize Scripts on page load -->
    
 <!-- Edit Appointment Js -->
 <script type="text/javascript">
	
	function sendEditOPDVal(opdid, opdname, opdcontact, Occupation, Age, Gender, Address,m_nm,l_nm,ipd_id) {
		document.getElementById("edit_opd_id").value = opdid;
		document.getElementById("f_opd_name").value = opdname;
		document.getElementById("m_opd_name").value = m_nm;
		document.getElementById("l_opd_name").value = l_nm;
		document.getElementById("edit_opd_opdcontact").value = opdcontact;
		document.getElementById("Occupation").value = Occupation;
		document.getElementById("Age").value = Age;
		document.getElementById("Gender").value = Gender;
		document.getElementById("Address").value = Address;
		document.getElementById("fu_ipd_id").value = ipd_id;
	}
	
	function sendIPDToOPDVal(f_name, m_name,l_name, opdcontact,age,sex,occupation,dept,cunsltant_doc,address,ipd_id) {
		document.getElementById("first_name_ipd").value = f_name;
		document.getElementById("middel_name_ipd").value = m_name;
		document.getElementById("last_name_ipd").value = l_name;
		document.getElementById("contact_ipd").value = opdcontact;
		document.getElementById("age_ipd").value = age;
		document.getElementById("gen_ipd").value = sex;
		document.getElementById("occu_ipd").value = occupation;
		document.getElementById("dept_name_ipd").value = dept;
		document.getElementById("cult_doc_ipd").value = cunsltant_doc;
		document.getElementById("add_ipd1").value = address;
		document.getElementById("add_ipd_id").value = ipd_id;
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
		document.getElementById("add_opd_id").value = opd_id;
	}
	
	function sendEditIPDVal(ipdid, ipdname,age,contact,gender,address,occ, ipdnexttokin, admitdate, primarydiagnosis, surgeon, surgerydate, refrencedoc,m_nm,l_nm) {
		try{
		
			
		document.getElementById("ipd_id").value = ipdid;
		document.getElementById("f_name").value = ipdname;
		document.getElementById("m_name").value = m_nm;
		document.getElementById("l_name").value = l_nm;
		/* document.getElementById("next_to_kin").value = ipdnexttokin;
		document.getElementById("combined-picker15").value = admitdate;
		document.getElementById("primary_diagnosis").value = primarydiagnosis;
		document.getElementById("surgeon").value = surgeon;
		document.getElementById("combined-picker7").value = surgerydate;
		document.getElementById("reffered_by").value = refrencedoc; */
		document.getElementById("patient_contact_no").value = contact;
		document.getElementById("patient_age").value = age;
		document.getElementById("patient_gender").value = gender;
		document.getElementById("patient_address").value = address;
		document.getElementById("patient_occupation").value = occ; 
		
		
		}catch(e){
			alert(e);
		}
	}
	
	function sendAdvanceIPDId(ipdid,admitdate){
		document.getElementById("advance_ipd_id").value=ipdid;
		document.getElementById("admit_date_advance").value=admitdate;
	}
</script>
</head>
<body>
  <!-- Menu -->
    <jsp:include page="menu.jsp"></jsp:include>
    <!-- Menu --> 
    <% if(null != request.getParameter("isPrsent")){%>
    <script type="text/javascript">
    	alert('Patient record already exists. Press OK to see the patient details');
    </script>
    <%} %>
<%
if(request.getParameter("pd").equals("IPD")){%>
 <!--  Individual Patient Search for IPD-->
    <div class="advanceSearch" style="margin:2em 0 2em 7em;border-radius:0;">
    	<h4><i class="fa fa-search"></i>IPD Patient Details</h4>
    		<div  style="padding:0 0.5em;">
	    		<table border="0" cellspacing="3" cellpadding="5"  class="book_appointment_table">
	    			<tbody>
	    			<%if(request.getParameter("contact")!="" || request.getParameter("id")!="" ){	%>
	    				<ba:getINDIPDPatientDetails contact="<%= request.getParameter(\"contact\")%>" id="<%= request.getParameter(\"id\")%>" />
	    			<%}%>	
	    			</tbody>		
	    		</table>
    		</div>
    </div>
    <!--  /Follow-Up Patient Search For IPD-->
     <!--  Individual Patient Search for OPD-->
     <div class="advanceSearch" style="width:100%;margin:0;border-radius:0;">
    	<h4><i class="fa fa-search"></i>Patient IPD History</h4>
    		<div class="book_appointment_table" style="padding:0 0.5em;">
	    		<table border="0" cellspacing="0" cellpadding="0"  class="responstable" id="ipdhistory">
	    			<thead>
	    				<tr>
	    					<th>Admission Date</th>
	    					<th>Discharge Date</th>
	    					<th>Expiry Date</th>
	    					<th>Surgery Date</th>
	    					<th>Suregry Description</th>
	    					<th>Final Diagnosis</th>
	    					<th>Reference Doctor</th>
	    					<th>Advance Details</th>
	    					<th>Bill ID</th>
	    					<th>Action</th>
	    				</tr>
	    			</thead>
	    			<tbody>
	    			<%if(request.getParameter("contact")!="" || request.getParameter("id")!="" ){	%>
	    				<ba:getINDAPIPDAPPatientDetails contact="<%= request.getParameter(\"contact\")%>" id="<%= request.getParameter(\"id\")%>"  />
	    			<%}%>	
	    			</tbody>			
	    		</table>
    		</div>
    </div>
    <!--  /Follow-Up Patient Search for OPD-->
    
<%}else{ %>
<!--  Individual Patient Search for OPD-->
    <div class="advanceSearch" style="margin:2em 0 2em 7em;border-radius:0;">
    	<h4 style="text-align:center;"><i class="fa fa-file"></i>OPD Patient Details</h4>
    		<div  style="padding:0 0.5em;">
	    		<table border="0" cellspacing="3" cellpadding="5"  class="book_appointment_table">
	    			<tbody>
	    				<%if(request.getParameter("contact")!="" || request.getParameter("id")!="" ){	%>
	    				<ba:getINDOPDPatientDetails contact="<%= request.getParameter(\"contact\")%>" id="<%= request.getParameter(\"id\")%>"  />
	    				
	    			<%}%>	
	    			
	    			</tbody>		
	    		</table>
    		</div>
    </div>
    <!--  /Follow-Up Patient Search for OPD-->
    <!--  Individual Patient Search for OPD-->
     <div class="advanceSearch" style="width:100%;margin:0;border-radius:0;">
    	<h4 style="text-align:center;"><i class="fa fa-file"></i>Patient Appointment Details</h4>
    		<div class="book_appointment_table" style="padding:0 0.5em;">
	    		<table border="0" cellspacing="0" cellpadding="0"  class="responstable" id="opdAppointmentDetails">
	    			<thead>
	    				<tr>
	    					<th>Date Of Appointment</th>
	    					<th>Appointment Type</th>
	    					<th>Appointment For</th>
	    					<th>Consulting Doctor</th>
	    					<th>Refernce Doctor</th>
	    					<th>Billing ID</th>
	    				</tr>
	    			</thead>
	    			<tbody>
	    			<%if(request.getParameter("contact")!="" || request.getParameter("id")!="" ){	%>
	    				<ba:getINDOPDAPPatientDetails contact="<%= request.getParameter(\"contact\")%>" id="<%= request.getParameter(\"id\")%>"  />
	    			<%}%>	
	    			</tbody>			
	    		</table>
    		</div>
    </div>
    <!--  /Follow-Up Patient Search for OPD-->
    
  

<%}%>


<!-- Book Follow-Up OPD Appointment -->
		<div id="small-dialog2" class="mfp-hide">
			<div class="popup">
        		<form name="editOpdappointmentform" action="RegisterBookAppointment" method="post">
          			<!-- <fieldset>
              			<legend><label>OPD Data</label></legend> -->
              			<h4><i class="fa fa-file"></i>Book Follow-Up Appointment</h4>                                        	
                			<table class="popuptable" cellpadding="5" >                                    	
							<tbody>
							<tr>
	    						<td>OPD ID: </td>
	    						<td><input name="opd_id" id="edit_opd_id" readonly="readonly" type="text"></td>
	    					</tr>
							<tr>
	                           	<td><label>First Name:</label></td>
	                            <td><input name="f_name"  id="f_opd_name" type="text" readonly="readonly"></td>
	                            <td><label>Middle Name:</label></td>
	                            <td><input name="m_name"  id="m_opd_name" type="text" readonly="readonly"></td>
	                            <td><label>Last Name:</label></td>
	                            <td><input name="l_name" id="l_opd_name" type="text" readonly="readonly"></td>
	                            
	                        </tr>
	                       	<tr>
	                        	<td><label>Contact No:</label></td>
	                            <td><input name="patient_contact_no" id="edit_opd_opdcontact" type="number" readonly="readonly"></td>
	                            <td><label>Age</label></td>
	                            <td><input name="patient_age" id="Age" readonly="readonly" type="number"></td>
	                            <td><label>Gender: </label></td>
	                        	<td>
	                        		<select name="patient_gender" id="Gender">
	                        			<option>--Select--</option>
	                        			<option>Male</option>
	                        			<option>Female</option>
	                        		</select>	                      	
	                        	</td>
	                        </tr>
	                        <tr>
	                        	<td>Occupation: </td>
	                        	<td><input name="patient_occupation" id="Occupation" type="text" autocomplete="off"></td>	
	                        	<td>Appointment For: </td>
	    						<td>
	    							<select name="dept" id="edit_opd_appointment_for">
	    									<option>--Select--</option>
          									<ba:getDepartmentList/>
          							</select>
	    						</td>
	                        	<td><label>Date of Appointment:</label></td>
				                <td><input name="datetime_of_appointment" required id="combined-picker" readonly="readonly" style="width:60%;float:left;margin:1em 0 0.5em 2em;" type="text"></td>                       		
	                        </tr>                        	
	                        <tr>	                        	
	                        	<td>Address: </td>
	                        	<td colspan="2"><textarea name="patient_address" cols="37" rows="" id="Address"></textarea></td>
	                        	<td>Consulting Doctor: </td>
          						<td>
       								<select name="c_doc" id="consulting_doctor">
       									<option>--Select--</option>
       									<ba:getDoctorList/>
       								</select>
       								<input type="hidden" name="appointment_type" value="Follow-Up" />
          						</td>
	                        </tr>
    						<tr>
    							<td>Reference Doctor:</td>
    							<td>
    								<select name="reference_doctor" id="edit_opd_reference_doctor">
    										<option>--Select--</option>
          									<ba:getRefernceDoctorList/>
          							</select>
    								<input type="hidden" name="registertype" value="OPD" />
    								<input type="hidden" name="ipd_id" id="fu_ipd_id"/>
    							</td>    							
    						</tr>
    						<tr>
    							<td colspan="6"><input value="SAVE" type="submit" class="button"></td>
    						</tr>	
                        </tbody>
                        </table><!-- 
          			</fieldset>	 -->	
      			</form>
      		</div>
      	</div>
      <!-- /Edit OPD Appointment --> 
      
      <!-- Folow-Up IPD Patient Book Appointment -->
			<div id="small-dialog4" class="mfp-hide">
			<div class="popup">
                     <form name="registerappointmentform" action="RegisterBookAppointment" method="post">
                     	<!-- <fieldset> -->
                     	<h4><i class="fa fa-pencil"></i>Book Follow-Up Appointmennt</h4>
                      <table cellspacing="20" cellpadding="10" class="popuptable">                                    	
					<tr>
                     	<td>IPD ID: </td>
                     	<td><input type="text" name="ipd_id" id="ipd_id"/></td>
                     </tr>
                     <tr>	
                     	<td><label>First Name:</label></td>
                      	<td><input type="text" name="f_name" id="f_name" readonly/></td>
                      	<td><label>Middel Name:</label></td>
                      	<td><input type="text" name="m_name"  id="m_name" readonly/></td>
                      	<td><label>Last Name:</label></td>
                      	<td><input type="text" name="l_name" id="l_name" readonly/></td>
                      	
                  	</tr>
                 	<tr>
                  	<td><label>Contact No:</label></td>
                      <td><input type="number" name="patient_contact_no"  id="patient_contact_no" readonly/></td>
                      <td><label>Age</label></td>
                      <td><input type="number" name="patient_age" id="patient_age" readonly/></td>
                      <td><label>Gender: </label></td>
	                  	<td>
	                  		<select name="patient_gender" id="patient_gender">
	                  			<option>--Select--</option>
	                  			<option>Male</option>
	                  			<option>Female</option>
	                  		</select>                        	
	                  	</td>
                  </tr>
                  <tr>
                  	<td>Occupation: </td>
                  	<td><input type="text" name="patient_occupation" id="patient_occupation" readonly/></td>	
                  	<td>Address: </td>
                  	<td colspan="2"><textarea name="patient_address" cols="37" rows="" id="patient_address" readonly ></textarea></td>
                  </tr>
                  <tr>
                  	<td>Departments</td>
                  	<td>
                        <select name="dept" id="dept2">
          					<option>--Select--</option>
          						<ba:getDepartmentList/>
          				</select>
          			</td>
          			<td>Next To Kin: </td><td><input name="next_to_kin" type="text" id="next_to_kin" autocomplete="off"></td>
      				<td>Admission Date: </td><td><input name="admitted_on_datetime" required id="combined-picker15" readonly="readonly" type="text"></td>
            	</tr> 
      	<tr>
      		<td>Primary Diagnosis: </td>
      		<td colspan="2"><textarea rows="5" cols="37" name="primary_diagnosis" id="primary_diagnosis"></textarea></td>
      		<td>Advance Amount: </td><td><input type="text" name="advance_amount" value="0"/></td>
      	</tr>
      	<tr>
      		<td>Surgeon: </td>
      		<td>
      			<select name="c_doc" id="surgeon">
      				<option>--Select--</option>
    				<ba:getDoctorList/>
    			</select>
    		</td>
    		<td>Surgery Date: </td><td><input id="combined-picker7" readonly="readonly" name="surgery_date" type="text"></td>
    		<td>Referred By: </td>
    		<td>
    			<select name="reffered_by" id="reffered_by">
    				<option>--Select--</option>
          			<ba:getRefernceDoctorList/>
          		</select>
    			<input type="hidden" name="registertype" value="IPD" />
    		</td>
    	</tr>
    	<tr>
    		<td colspan="6"><input name="opd_id" value="Not Registered" type="hidden"><input value="REGISTER" type="submit" class="button"></td>
    	</tr>
    
    </table><!-- 
    </fieldset> -->
    </form>
    </div>
    </div>
    
      <!-- / -->

    <!-- Register opd to ipd Appointment -->
	<div id="small-dialog5" class="mfp-hide">
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
	                      	<td><input type="text" name="f_name" id="first_name_type"  placeholder="First Name" autocomplete="off" readonly/></td>
	                       	<td><label>Middel Name:</label></td>
	                      	<td><input type="text" name="m_name" id="middel_name_type" placeholder="Middle Name" autocomplete="off" readonly/></td>
	                      	<td><label>Last Name:</label></td>
	                      	<td><input type="text" name="l_name" id="last_name_type" placeholder="Last Name"  autocomplete="off" readonly/></td>
	                 	</tr>
	                  	<tr>
	                     	<td><label>Contact No:</label></td>
	                      	<td><input type="number" name="patient_contact_no" id="contact_type" autocomplete="off" readonly/></td>
	                     	<td><label>Age</label></td>
	                    	<td><input type="number" name="patient_age" id="age_type"  autocomplete="off" readonly/></td>
	                    	<td><label>Gender: </label></td>
	                    	<td>
	                        	<select name="patient_gender" id="gen" style="width:100%;">
	                        		<option>--Select--</option>
	                        		<option>Male</option>
	                        		<option>Female</option>
	                        	</select>                        	
	                       	</td>
	                  	</tr>
	                  	<tr>
	                        <td>Occupation: </td>
	                        <td><input type="text" name="patient_occupation" id="occu"  autocomplete="off"readonly/></td>
	                         <td><label>Department</label></td>
	                        <td>
                        		<select name="dept" id="dept_name" style="width:100%;" readonly>
          							<option>--Select--</option>
          								<ba:getDepartmentList/>
          						</select>
          					</td>
                        	<td><label>Consulting Doctor</label></td>
	                        <td><select name="c_doc" id="cult_doc" >
          							<option>--Select--</option>
          								<ba:getDoctorList/>
          						</select>
          					</td>	                       		
	                    </tr>
	                 	<tr>
	                        <td>Address: </td>
	                        <td colspan="2"><textarea name="patient_address" id="add_ipd" cols="34" rows="" readonly></textarea></td>
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
                        	<td><input type="text" name="admitted_on_datetime" id="combined-picker4" required readonly="readonly"/></td>
                        	<td>Surgery Date: </td><td><input type="text" id="combined-picker8" readonly="readonly" name="surgery_date" /></td>
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
                        	<td><input type="number" name="advance_amount" value="0"></td>
               
                        </tr>
                        <tr>
                        	<td colspan="6"><input type="hidden" name="opd_id" id="add_opd_id" /><input type="submit" value="REGISTER" class="button" style="margin:1em 0;\"/></td><td></td></tr>
                    </table>
                
            </form>                                                            
        </div>
    </div>
   
       <!-- /Register opd to ipd Appointment -->
       
       <!-- Take Advance Amount -->
       <div id="small-dialog6" class="mfp-hide" style="width:35%;">
       		<div class="popup">
       			<form name="AdvanceAmount" action="adnvanceDetails" method="post">
       				<h4><i class="fa fa-inr"></i>Advance Amount</h4>
       				<table cellspacing="20" cellpadding="10" class="popuptable">
       					<tr>
       						<td>Advance Amount</td>
       						<td>
       							<input type="text" autocomplete="off" name="advanceAmount" />
       							<input type="hidden" name="advance_ipd_id" id="advance_ipd_id"/>
       							<input type="hidden" name="admit_date_advance" id="admit_date_advance"/>
       						</td>
       					</tr>
       					<tr>
       						<td colspan="2"><input type="submit" value="Take Advance" class="button"/></td>
       					</tr>
       				</table>
       			</form>
       		</div>
       </div>
       <!-- /Take Advance Amount -->
       
       <!-- Register ipd to opd Appointment -->
	<div id="small-dialog7" class="mfp-hide">
		<div class="popup">
        	<form name="registerappointmentform" action="RegisterIPDToOPDAppointment" method="post">
            	<!-- <fieldset>
                	<legend><label>Patient Registration</label></legend>    -->
                	<h4><i class="fa fa-check-circle"></i>Patient Registration</h4>         	
                    <table cellspacing="20" cellpadding="10" class="popuptable">
                    	<tr>
                    		<td style="text-align:right;width: 13.5%;">OPD ID: </td>
    						<td><input type="text" name="opd_id" value="<ba:getOPDID/>" autocomplete="off" style="float:left;margin-left: 3.5em;" readonly="readonly"/></td>   
                    	</tr>                                    	
						<tr>
	                    	<td><label>First Name:</label></td>
	                      	<td><input type="text" name="f_name" id="first_name_ipd" readonly="readonly" /></td>
	                       	<td><label>Middel Name:</label></td>
	                      	<td><input type="text" name="m_name" id="middel_name_ipd" placeholder="Middle Name" autocomplete="off" readonly="readonly"/></td>
	                      	<td><label>Last Name:</label></td>
	                      	<td><input type="text" name="l_name" id="last_name_ipd" placeholder="Last Name"  autocomplete="off" readonly="readonly"/></td>
	                 	</tr>
	                  	<tr>
	                     	<td><label>Contact No:</label></td>
	                      	<td><input type="number" name="patient_contact_no" id="contact_ipd" autocomplete="off" readonly="readonly"/></td>
	                     	<td><label>Age</label></td>
	                    	<td><input type="number" name="patient_age" id="age_ipd"  autocomplete="off" readonly="readonly"/></td>
	                    	<td><label>Gender: </label></td>
	                    	<td>
	                        	<select name="patient_gender" id="gen_ipd" style="width:100%;" readonly="readonly">
	                        		<option>--Select--</option>
	                        		<option>Male</option>
	                        		<option>Female</option>
	                        	</select>                        	
	                       	</td>
	                  	</tr>
	                  	<tr>
	                        <td>Occupation: </td>
	                        <td><input type="text" name="patient_occupation" id="occu_ipd"  autocomplete="off" readonly="readonly"/></td>
	                         <td><label>Department</label></td>
	                        <td>
                        		<select name="dept" id="dept_name_ipd" style="width:100%;" readonly="readonly">
          							<option>--Select--</option>
          								<ba:getDepartmentList/>
          						</select>
          					</td>
                        	<td><label>Consulting Doctor</label></td>
	                        <td><select name="c_doc" id="cult_doc_ipd" >
          							<option>--Select--</option>
          								<ba:getDoctorList/>
          						</select>
          					</td>	                       		
	                    </tr>
	                 	<tr>
	                        <td>Address: </td>
	                        <td colspan="2"><textarea name="patient_address" id="add_ipd1" cols="34" rows="" readonly="readonly"  ></textarea></td>
	                    </tr>	                    
                        <tr>
                        	<td><label>Registration Type: </label></td>
                        	<td>
                        		<input type="text" name="registertype" value="OPD" readonly="readonly">
                        	</td>	
                        </tr>	
                       	<tr>
                       		<td>Date Time of Appointment: </td>
                       		<td><input type="text" name="datetime_of_appointment" required id="combined-picker13"  readonly="readonly" /></td>
                       		<td>Reference Doctor:</td>
                       		<td><input type="hidden" name="appointment_type" value="New"/>
                       			<input type="hidden" name="ipd_id" id="add_ipd_id"/>
                       			<select name="reference_doctor" >
                       				<option>--Select--</option>
                       					<ba:getRefernceDoctorList/>
                       			</select>
                       		</td>
                       	</tr>
                        <tr>
                        	<td colspan="6"><input type="hidden" name="ipd_id" id="add_ipd_id" /><input type="submit" value="REGISTER" class="button" style="margin:1em 0;\"/></td><td></td></tr>
                    </table>
                
            </form>                                                            
        </div>
    </div>



</body>
</html>