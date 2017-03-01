<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OPD Prescription</title>
<script>
</script>
<style>
.doctorsList{
	width:30%;
	float:left;
	height:auto;
	list-style-type:none;
	border-right:2px solid red;
	margin:0;
	padding:1em 0 0;
}

.doctorsList li{
	color:red;
	font-size:16px;
	font-style:italic;
	font-weight:bold;
	margin-bottom:1em;
}

.doctorsList span{
	color:#22287D;
	font-size: 14px;
}

.facilityList li{
	color:#22287D;
	font-style:normal;
	font-size:14px;
}
</style>
</head>
<body onload="javascript:window.print();self.location.href='dashboard.jsp?current=dashboard';">
		
		<div style="width:100%;float:left;heigh:auto;padding-top: 15em;">
       <!-- 	<img src="okmarhosplogo.jpg" style="width:100%;height:auto;" /> -->
       </div>
       <div id="PatientDetails" style="width:100%;height:auto;margin:0;padding:0;border-top:2px solid #CCC;padding-left: 5em;">
       		<!-- <ul class="doctorsList">
       			<li>
       				Dr. Sachin Khalane<br/>
       				<span>
       					Consultant Orthopaedic and Join Replacement Surgeon
       				</span>
       			</li>
       			<li>
       				Dr. Anjali Khalane<br/>
       				<span>
       					Consultant Chest &amp; Respiratory Diseases, Critical Care Specialist
       				</span>
       			</li>
       			<li>
       				Dr. Vishal Khalane<br/>
       				<span>
       					Consultant Obstetrician Gynaecologist Laparoscopic Surgeon
       				</span>
       			</li>
       			<li>
       				Dr. Manisha Khalane<br/>
       				<span>
       					Ayurveda and Panchkarma Specialist, Family Phsician
       				</span>
       			</li>
       			<li style="margin:0;padding:0;font-size:12px;font-style:normal;">
       				FACILITIES AT THE HOSPITAL
       				<ul class="facilityList">
       					<li>Digital X-Ray</li>
       					<li>24 X 7 Emergency dept</li>
       					<li>Govt recognised MTP(Abortion) Centre</li>
       					<li>ECG</li>
       					<li>Indoor facility with General &amp; Special wards</li>
       					<li>Well equipped Operation Theatres</li>
       					<li>Ayurveda and Panchkarma Center</li>
       					<li>Pathalogy Lab</li>
       					<li>Physiotheraphy Department</li>
       					<li>Ambulance</li>
       				</ul>
       			</li>
       		</ul>      -->  		
       		<table style="width:100%;padding-left: 21em;padding-top:5em;font-size:12px;">
		       	<thead>
		       	</thead>
		       	<tbody>
		       		<tr>
		       			<td style="text-align:left;font-weight:bold;font-size:22px;" >OPD ID </td><td colspan="5" style="font-size:22px;">: ${param.opdId }</td>
		       		</tr>
		       		<tr>
		       			<td style="text-align:left;font-weight:bold;font-size:22px;" >Name </td><td colspan="5" style="font-size:22px;">: ${param.patientName }</td>
		       		</tr>
		       		<tr>
		       			<td style="text-align:left;font-weight:bold;font-size:22px;">Appointment Date</td><td colspan="5" style="font-size:22px;">: ${param.dateOfAppointment }</td>
		       		</tr>
		       		<tr>
		       			<td style="text-align:left;font-weight:bold;font-size:22px;">Consulting Doctor </td><td colspan="5" style="font-size:22px;">: ${param.consultingDoctor }</td>
		       		</tr>
		       		<tr>
		       			<td style="text-align:left;font-weight:bold;font-size:22px;">Reference Doctor</td><td colspan="5" style="font-size:22px;">: ${param.referencedoc }</td>
		       		</tr>
		       		<tr>
						<td style="text-align:left;font-weight:bold;font-size:22px;">Age </td><td colspan="2" style="font-size:22px;">: ${param.patientAge }</td>
		       			<td style="text-align:left;font-weight:bold;font-size:22px;">Gender </td><td colspan="2" style="font-size:22px;">: ${param.patientGender }</td>
		       		</tr>
		       	</tbody>
       		</table>
       </div>
     	<div style="width:100%;padding-left: 25em;padding-top: 55em;font-weight:normal;">
     		<table cellpadding="12" style="font-size:22px;">
     			<tbody>
     				<tr>
     					<td>Total</td><td>: _________</td><td>Paid</td><td>: _________</td><td>Balance</td><td>: _________</td>
     				</tr>
     			</tbody>
     		</table>
     	</div>
       
</body>
</html>