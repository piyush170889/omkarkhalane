<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Patient Profile</title>
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
	text-align:center;
}

th
{
width:100%;	
}

.tb2{
border:none;
float:right;
width:50%;
text-align:center;
}
</style>
</head>
<body>
		<div style="width:100%;float:left;heigh:auto;align:center;">
       		<img src="okmarhosplogo.jpg" style="width:100%;height:auto;" onload="javascript:window.print();self.location.href='dashboard.jsp?current=dashboard';" />
       	</div>
       	
       	<div style="width:100%;float:left;height:auto;margin:1em 0;padding:0.5em 0;">
			<table>
			<tr>
			<td>Name: Mr./Mrs.</td>
			<td colspan="2">${param.name}</td>
			<td>IPD ID</td>
			<td colspan="2">${param.ipdId }</td>
			</tr>
			<tr>
			<td>Age:</td>
			<td>${param.age}</td>
			<td >Sex: M/F</td>
			<td>${param.gender}</td>
			<td>Occupation:</td>
			<td>${param.occ}</td>
			</tr>
			<tr>
			<td>Address:</td>
			<td colspan=5>${param.address}</td>
			</tr>
			<tr>
			<td colspan="2">Next to Kin Mr./Mrs.</td>
			<td colspan="4">${param.ntk}</td>
			</tr>
			<tr>
			<td>Address:</td>
			<td colspan=3></td>
			<td>Tel. No.</td>
			<td>${param.contact}</td>
			</tr>
			<tr>
			<td>Addmited On:</td>
			<td colspan="2">${param.dateofadmission}</td>
			<td>Discharged on</td>
			<td colspan="2">${param.dateofdischarge}</td>
			</tr>
			<tr>
			<td>Primary Diagnosis:</td>
			<td colspan="2">${param.pd}</td>
			<td>Final Diagnosis:</td>
			<td colspan="2">${param.fd}</td>
			</tr>
			
			<% if(request.getParameter("dateofexpiry")!=null && !(request.getParameter("dateofexpiry").equals(""))) {%>
			<tr>
			<td >Date Of Expiry</td>
			<td> ${param.dateofexpiry }</td>
			<td>Cause Of Death:</td>
			<td colspan=3>${param.cod}</td>
			</tr>
			<tr>
			<td colspan="2">Death Certificate No.</td>
			<td>${param.dcno}</td>
			<td colspan="2">Death Certificate Issue Date:</td>
			<td>${param.dcid}</td>
			</tr>
			<%} %>
			<tr>
			<td>Surgeon</td>
			<td>${param.surgeon }</td>
			<td>Date Of Surgery</td>
			<td>${param.dateofsurgery }</td>
			<td>Referred by:</td>
			<td>${param.rd}</td>
			</tr>
			<tr>
			<td>Suregry Description</td>
			<td colspan=5>${param.suregryDescription }</td>
			</tr>
			<tr>
			<td>Anaesthetist Doctor</td>
			<td>${param.anaesthetist }</td>
			<td>Anaesthesia Type</td>
			<td colspan="3">${param.anaesthesiatype }</td>
			</tr>
			
			<tr>
			<td>MLC NO.</td>
			<td colspan=5>${param.mlcno}</td>
			</tr>
			</table>
			<table class="tb2">
			<tr>
			<td><br/><br/>Signature of M.O.</td>
			</tr>
			</table><br/><br/><br/><br/><br/>
			
			<table>
			<tr>
			<th colspan=6>
			MEDICAL LEGAL RECORD
			</th>
			</tr>
			<tr>
			<td>Informed Police Station/ Chowky</td>
			<td colspan=5></td>
			</tr>
			<tr>
			<td>Constable/ Officer Shri.</td>
			<td colspan=3></td>
			<td>Buckle No.</td>
			<td></td>
			</tr>
			<tr>
			<td>at</td>
			<td></td>
			<td>on</td>
			<td></td>
			<td>by</td>
			<td></td>
			</tr>
			</table>
			
			<table class="tb2">
			<tr>
			<td><br/><br/>Signature</td>
			</tr>
			</table>
		</div>
</body>
</html>