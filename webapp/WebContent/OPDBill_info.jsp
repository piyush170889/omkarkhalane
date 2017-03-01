<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="WEB-INF/bookAppointment.tld" prefix="ba"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OPD Bill Information</title>


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
	 	$('#serviceTakenTable').dataTable();
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


</head>
<body>

<!-- Menu -->
    <jsp:include page="menu.jsp"></jsp:include>
    <!-- Menu --> 

<div class="advanceSearch" style="margin:2em 0 2em 7em;border-radius:0;">
    	<h4 style="text-align:center;"><i class="fa fa-file"></i>OPD Patient <%=request.getParameter("o_id") %> Billing Details</h4>
    		<div  style="padding:0 0.5em;">
    			<form action="OPDDuplicateBillPrint" method="get">
				<ba:OPDBill_info bill_id="<%= request.getParameter(\"billid\")%>" o_id="<%= request.getParameter(\"o_id\")%>"/>
	    		<input align="middle" name="Print" type="submit" value="PRINT DUPLICATE BILL" style="font-family:Candara;margin: 1% 0 0.5% 40%;color: #FFFFFF;background-color: #337ab7;padding: 0.2em 1.4em 0.3em;border-radius: 3px;border: 1px solid #337ab7;">
	    		<input type="hidden" name="opdId" value="<%= request.getParameter("o_id") %>" />
	    		<input type="hidden" name="billid" value="<%= request.getParameter("billid") %>" />
	    		<input type="hidden" name="dateOfAppointment" value="<%= request.getParameter("dateofappointment") %>" />
 				</form>   		
    		</div>
    </div>
</body>
</html>