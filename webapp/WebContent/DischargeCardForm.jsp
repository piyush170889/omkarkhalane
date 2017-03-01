<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Discharge Card</title>
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
    
    <script type="text/javascript">
    function ChromonTestChange() {
    	var key = window.event.keyCode;
    	
   	 	// If the user has pressed enter
    	if (key == 13) {
        	document.getElementById("txtArea1").value =document.getElementById("txtArea1").value + "<br/>";
        	return false;
    	}
    	else {
        	return true;
    	}
	};
	function ChromonTestChangeInvestigation() {
    	var key = window.event.keyCode;
    	
   	 	// If the user has pressed enter
    	if (key == 13) {
        	document.getElementById("Investigation1").value =document.getElementById("Investigation1").value + "<br/>";
        	return false;
    	}
    	else {
        	return true;
    	}
	};
	function ChromonTestChangeFindings() {
    	var key = window.event.keyCode;
    	
   	 	// If the user has pressed enter
    	if (key == 13) {
        	document.getElementById("Findings1").value =document.getElementById("Findings1").value + "<br/>";
        	return false;
    	}
    	else {
        	return true;
    	}
	};
	function ChromonTestChangeAttend() {
    	var key = window.event.keyCode;
    	
   	 	// If the user has pressed enter
    	if (key == 13) {
        	document.getElementById("Attend1").value =document.getElementById("Attend1").value + "<br/>";
        	return false;
    	}
    	else {
        	return true;
    	}
	};
	function ChromonTestChangeAllergy() {
		var key = window.event.keyCode;
    	
   	 	// If the user has pressed enter
    	if (key == 13) {
        	document.getElementById("Allergy1").value =document.getElementById("Allergy1").value + "<br/>";
        	return false;
    	}
    	else {
        	return true;
    	}
	};
	
	
	
	
	function FirefoxonTestChange(e) {
		var key ;//= window.event.keyCode;
   	 	// If the user has pressed enter
    	if (e.key == 'Enter') {
        	document.getElementById("txtArea").value =document.getElementById("txtArea").value + "<br/>";
        	return false;
    	}
    	else {
        	return true;
    	}
	};
	function FirefoxonTestChangeInvestigation(e) {
		var key ;//= window.event.keyCode;
   	 	// If the user has pressed enter
    	if (e.key == 'Enter') {
        	document.getElementById("Investigation").value =document.getElementById("Investigation").value + "<br/>";
        	return false;
    	}
    	else {
        	return true;
    	}
	};
	function FirefoxonTestChangeFindings(e) {
		var key ;//= window.event.keyCode;
   	 	// If the user has pressed enter
    	if (e.key == 'Enter') {
        	document.getElementById("Findings").value =document.getElementById("Findings").value + "<br/>";
        	return false;
    	}
    	else {
        	return true;
    	}
	};
	function FirefoxonTestChangeAttend(e) {
		var key ;//= window.event.keyCode;
   	 	// If the user has pressed enter
    	if (e.key == 'Enter') {
        	document.getElementById("Attend").value =document.getElementById("Attend").value + "<br/>";
        	return false;
    	}
    	else {
        	return true;
    	}
	};
	function FirefoxonTestChangeAllergy(e) {
		var key ;//= window.event.keyCode;
   	 	// If the user has pressed enter
    	if (e.key == 'Enter') {
        	document.getElementById("Allergy").value =document.getElementById("Allergy").value + "<br/>";
        	return false;
    	}
    	else {
        	return true;
    	}
	};
	
	
	
	
	
	</script>
</head>
<body>
<!-- Menu -->

<%
String[] header = request.getHeader("User-Agent").split(" ");
String browser = header[(header.length-1)].toLowerCase();
%>
    <jsp:include page="menu.jsp"></jsp:include>
    <!-- Menu -->
    <div class="advanceSearch" style="margin:1em 0 2em 7em;border-radius:0;">
    		<h4><i class="fa fa-file"></i>Discharge Card</h4>
<form action="DischargeCard.jsp">
	<table style="padding: 1em;">
		<tr>
			<td style="font-weight:bold;">I.P.D ID:</td>
			<td><input type="text" name="ipdId" readonly="readonly" value="${param.ipdId}"></td>
			<td style="font-weight:bold;padding-left: 1em;">Bill Id</td>
			<td ><input type="text" name="b" readonly="readonly" value="${param.billId}<%= new SimpleDateFormat("dd-MM-yyyy").format(new Date()) %>"> <input type="hidden" name="billId" readonly="readonly" value="${param.billId}"></td>
		</tr>
		<tr>
			<td style="font-weight:bold;">Name:</td>
			<td><input type="text" name="patientname" readonly="readonly" value="${param.patientname }"></td>
			<td style="font-weight:bold;padding-left: 1em;">Address:</td>
			<td colspan=3><input type="text" name="patientaddress" readonly="readonly" value="${param.patientaddress }"></td>		
		</tr>
		<tr>
			<td style="font-weight:bold;">Sex:</td>
			<td><input type="text" name="gender" readonly="readonly" value="${param.gender }"></td>
			<td style="font-weight:bold;padding-left: 1em;">Age:</td>
			<td><input type="text" name="age" readonly="readonly" value="${param.age }"></td>
		</tr>
		<tr>
			<td style="font-weight:bold;">D.O.A:</td>
			<td ><input type="text" name="dateofadmission" readonly="readonly" value="${param.dateofadmission }"></td>
			<td style="font-weight:bold;padding-left: 1em;">D.O.D:</td>
			<td ><input type="text" name="dateofdischarge" readonly="readonly" value="${param.dateofdischarge }"></td>
		</tr>
		<tr>
			<td style="font-weight:bold;">Under Dr.</td>
			<td ><input type="text" name="surgeon" readonly="readonly" value="${param.surgeon }"></td>
			<td style="font-weight:bold;padding-left: 1em;">Referred by Dr.</td>
			<td ><input type="text" name="reference" readonly="readonly" value="${param.reference }"></td>
		</tr>
		<tr>
			<td style="font-weight:bold;">Diagnosis:</td>
			<td ><input type="text" name="finaldiagnosis" readonly="readonly" value="${param.finaldiagnosis }"></td>
			<td style="font-weight:bold;padding-left: 1em;">MLC NO</td>
			<td><input type="text" name="mlcno" readonly="readonly" value="${param.mlcno }"></td>	
		</tr>
		<tr>
			<td style="font-weight:bold;">Surgeon Dr.</td>
			<td><input type="text" name="surgeon" readonly="readonly" value="${param.surgeon }"></td>
			<td style="font-weight:bold;padding-left: 1em;">Anaesthetist Dr.</td>
			<td style="font-weight:bold;"><input type="text" name="anaesthetist" readonly="readonly" value="${param.anaesthetist }"></td>
		</tr>
		<tr>
			<td style="font-weight:bold;" >Operation / Delivery Date</td>
			<td ><input type="text" name="dateofsurgery" readonly="readonly" value="${param.dateofsurgery }"></td>
			<td style="font-weight:bold;padding-left: 1em;">Anaesthesia Type:</td>
			<td><input type="text" name="anaesthesiatype" readonly="readonly" value="${param.anaesthesiatype }"></td>
		</tr>
		<tr>
			<td style="font-weight:bold;">Surgery Description:</td>
			<td ><textarea name="suregryDescription" readonly="readonly" value="${param.suregryDescription }">${param.suregryDescription}</textarea></td>
			<td style="font-weight:bold;padding-left: 1em;">Blood Group:</td>
			<td><input type="text" name="BloodGroup"  ></td>
		</tr>
		<%if(browser.contains(("Firefox").toLowerCase())){ %>
		<tr>
			<td style="font-weight:bold;">Allergy:</td>
			<td  style="height:1em;"><textarea id="Allergy" onkeypress="FirefoxonTestChangeAllergy(event);" name="Allergy"></textarea></td>
			<td style="font-weight:bold;padding-left: 1em;">History &amp;Clinical Findings:</td>
			<td  style="height:2em;"><input type="text" name="History" ></td>
		</tr>
		<tr>
			<td style="font-weight:bold;">Investigation:</td>
			<td  style="height:2em;"><textarea id="Investigation" onkeypress="FirefoxonTestChangeInvestigation(event);"  name="Investigation" ></textarea></td>
		</tr>
		<tr>
			<td style="font-weight:bold;">Findings &amp;Procedure/ Child Birth Details:</td>
			<td  style="height:2em;"><textarea id="Findings" onkeypress="FirefoxonTestChangeFindings(event);"  name="Findings" ></textarea></td>
		</tr>
		<tr>
			<td style="font-weight:bold;">To Attend O.P.D on:</td>
			<td ><textarea id="Attend" onkeypress="FirefoxonTestChangeAttend(event);" name="Attend" ></textarea></td>
		</tr>
		<tr>
			<td style="font-weight:bold;">Treatment on Discharge:</td>
			<td  style="height:3em;"><textarea id="txtArea" onkeypress="FirefoxonTestChange(event);"  name="TreatmentON"  ></textarea>
			</td>
		</tr>
		<%}else{ %>
		<tr>
			<td style="font-weight:bold;">Allergy:</td>
			<td  style="height:1em;"><textarea id="Allergy1" onkeypress="ChromonTestChangeAllergy();" name="Allergy"></textarea></td>
			<td style="font-weight:bold;padding-left: 1em;">History &amp;Clinical Findings:</td>
			<td  style="height:2em;"><input type="text" name="History" ></td>
		</tr>
		<tr>
			<td style="font-weight:bold;">Investigation:</td>
			<td  style="height:2em;"><textarea id="Investigation1" onkeypress="ChromonTestChangeInvestigation();"  name="Investigation" ></textarea></td>
		</tr>
		<tr>
			<td style="font-weight:bold;">Findings &amp;Procedure/ Child Birth Details:</td>
			<td  style="height:2em;"><textarea id="Findings1" onkeypress="ChromonTestChangeFindings();"  name="Findings" ></textarea></td>
		</tr>
		<tr>
			<td style="font-weight:bold;">To Attend O.P.D on:</td>
			<td ><textarea id="Attend1" onkeypress="ChromonTestChangeAttend();" name="Attend" ></textarea></td>
		</tr>
		<tr>
			<td style="font-weight:bold;">Treatment on Discharge:</td>
			<td  style="height:3em;"><textarea id="txtArea1" onkeypress="ChromonTestChange();"  name="TreatmentON"  ></textarea>
			</td>
		</tr>
		<%} %>
		<tr>
			<td colspan="4"><input type="submit" value="Print" align="middle" style="float: left;margin:2% 50%;color: #FFF;background-color: #337AB7;padding: 0.2em 0.5em;border-radius: 3px;border: 1px solid #337AB7;"></td>
		</tr>
	</table>
</form>
</div>

</body>
</html>