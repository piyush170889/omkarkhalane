<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Discharge Card</title>
<style>
table, th{
    border: 1px solid black;
    border-collapse: collapse;
	height:30px;
}
td{
	border: 1px solid black;
    border-collapse: collapse;
	height:30px;
	width:10%;
}

th
{
width:100%;	
}
</style>


</head>
<body>
<div style="width:100%;float:left;heigh:auto;">  
<img src="okmarhosplogo.jpg" style="width:100%;height:auto;" onload="javascript:window.print();self.location.href='dashboard.jsp?current=dashboard'" />
<h3 style="padding-left: 15em;">Discharge Card</h3>
</div>



	<table>
		<tr>
			<td style="font-weight:bold;">I.P.D ID:</td>
			<td>${param.ipdId}</td>
			<td style="font-weight:bold;">Bill Id</td>
			<td>${param.billId} <%= new SimpleDateFormat("dd-MM-yyyy").format(new Date()) %></td>
			<td style="font-weight:bold;">MLC NO</td>
			<td>${param.mlcno }</td>		
		</tr>
		<tr>
			<td style="font-weight:bold;">Name:</td>
			<td>${param.patientname}</td>
			<td style="font-weight:bold;">Address:</td>
			<td colspan=3>${param.patientaddress}</td>		
		</tr>
		<tr>
			<td style="font-weight:bold;">Sex:</td>
			<td>${param.gender}</td>
			<td style="font-weight:bold;">Age:</td>
			<td>${param.age}</td>
			<td style="font-weight:bold;">Blood Group:</td>
			<td>${param.BloodGroup}</td>
		</tr>
		<tr>
			<td style="font-weight:bold;">D.O.A:</td>
			<td colspan=2>${param.dateofadmission}</td>
			<td style="font-weight:bold;">D.O.D:</td>
			<td colspan=2>${param.dateofdischarge}</td>
		</tr>
		<tr>
			<td style="font-weight:bold;">Under Dr.</td>
			<td colspan=2>${param.surgeon}</td>
			<td style="font-weight:bold;">Referred by Dr.</td>
			<td colspan=2>${param.reference}</td>
		</tr>
		<tr>
			<td style="font-weight:bold;">Diagnosis:</td>
			<td colspan=5>${param.finaldiagnosis}</td>
		</tr>
		<tr>
			<td style="font-weight:bold;">Surgery Description:</td>
			<td colspan=5>${param.suregryDescription}</td>
		</tr>
		<tr>
			<td style="font-weight:bold;">Allergy:</td>
			<td colspan=5 style="height:2em;">${param.Allergy}</td>
		</tr>
		<tr>
			<td style="font-weight:bold;">History &amp;Clinical Findings:</td>
			<td colspan=5 style="height:3em;">${param.History}</td>
		</tr>
		<tr>
			<td style="font-weight:bold;">Investigation:</td>
			<td colspan=5 style="height:3em;">${param.Investigation}</td>
		</tr>
		<tr>
			<td style="font-weight:bold;" colspan=2>Operation / Delivery Date</td>
			<td colspan=4>${param.dateofsurgery}</td>
		</tr>
		<tr>
			<td style="font-weight:bold;">Surgeon Dr.</td>
			<td>${param.surgeon}</td>
			<td style="font-weight:bold;">Anaesthetist Dr.</td>
			<td style="font-weight:bold;">${param.anaesthetist}</td>
			<td style="font-weight:bold;">Anaesthesia Type:</td>
			<td>${param.anaesthesiatype}</td>
		</tr>
		<tr>
			<td colspan=2 style="font-weight:bold;">Findings &amp;Procedure/ Child Birth Details:</td>
			<td colspan=4 style="height:3em;">${param.Findings}</td>
		</tr>
		<tr>
			<td colspan=2 style="font-weight:bold;">To Attend O.P.D on:</td>
			<td colspan=4>${param.Attend}</td>
		</tr>
		<tr>
			<td style="font-weight:bold;">Treatment on Discharge:</td>
			<td colspan=5 style="height:5em;">${param.TreatmentON}</td>
		</tr>
	</table>
	
	<br/><br/><br/><br/><label >Signature</label>
			
</body>
 <script>
	  window.print();
	self.location.href='dashboard.jsp?current=dashboard';
</script> 
</html>