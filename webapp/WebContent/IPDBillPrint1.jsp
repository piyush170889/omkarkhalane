<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>IPD Bill</title>
<style>
.billTable{
width: 100%;border: 1px solid #000;border-collapse: collapse;float:left;padding: 0;height:auto;
}
.billTable td, th {
    border: 1px solid black;
}

td.leftalign{
	text-align:left;
	font-weight:bold;
}
td.centeralign{
	text-align:center;
}
</style>
</head>
<body>
<div style="width:100%;float:left;heigh:auto;">
<img src="okmarhosplogo.jpg" style="width:100%;height:auto;" onload="javascript:window.print();self.location.href='dashboard.jsp?current=dashboard'" />
</div>
<div style="width:100%;margin:0;float:left;">
                  <table class="billTable">
                       	<tr>
                       		<td class="leftalign"><label>IPD ID</label></td><td>${param.ipdId}</td>
                       		<td class="leftalign"><label>Bill Id</label></td><td colspan="3">${param.billid } <%= new SimpleDateFormat("dd-MM-yy").format(new Date()) %></td>
                       	</tr>
                       	<tr>
                       		<td class="leftalign"><label>Name</label></td><td colspan="2">${param.patientName }</td>
                       		<td class="leftalign"><label>Occupation</label></td><td colspan="2">${param.patientOccupation }</td>                       		
                       	</tr>
                       	<tr>
                       		<td class="leftalign"><label>Address</label></td><td colspan="5">${param.patientAddress }</td>
                       	</tr>
                       	<tr>
                            <td class="leftalign"><label>Contact</label></td>
                            <td>${param.patientContact }</td> 
                            <td class="leftalign"><label>Next To Kin</label></td>
                            <td>${param.patientNextToKin }</td>
                            <td class="leftalign"><label>Age </label></td>
                            <td>${param.patientAge }</td>                           
                        </tr>
                       	<tr>
                           	<td class="leftalign">Final Diagnosis</td>
                           	<td  colspan="5"> ${param.finaldiagnosis }</td>
                        </tr>
                        <tr>
                        	<td class="leftalign"><label>Admission Date</label></td>
                           	<td colspan="2">${param.dateOfAdmission }</td>                         	
                           	<td class="leftalign">Referred By </td>
                        	<td colspan="2">${param.patientRefrence }</td>   
                        </tr>                                              
                     </table>
        </div>
    	
    	<!-- Billing Details -->
    	<div class="advanceSearch" style="width:100%;margin:0;border-radius:0;height:auto;float:left;">
    		<h4 style="margin:0.3em;padding:0;"><i class="fa fa-file"></i>Billing Details</h4>
    		<table  class="billTable">
    			<tr>
    				<td class="leftalign">Bill Type: </td>
    				<td>${param.billtype }</td>
    				<td class="leftalign" colspan="3">Registration Charges: </td>
    				<td>${param.registrationcharges }</td>
    			</tr>
    			<tr>
    				<td class="leftalign">Room Type: </td>
    				<td colspan="2">${param.roomtype }</td>
    				<td class="leftalign">Room/Bed No</td><td colspan="2">${param.roombedno }</td>
    			</tr>
    			<tr>
    				<td colspan="6" class="leftalign">Room Charges : Rs.${param.roomcharges} @ Rs.: ${param.perunitroomcharges } per day from ${param.admissiondate } To  ${param.dischargedate } </td>
    				
    			</tr>
    			<tr>
    				<td colspan="6" class="leftalign">Nursing Charges : Rs.${param.nursingcharges } @ Rs. :${param.perunitnursingcharges } per day from ${param.admissiondate } To  ${param.dischargedate } </td>
    			</tr>
    			<tr>
    				<td class="leftalign" colspan="3">Dr's Visits/Consulting Doctor: </td>
    				<td>${param.vistingdoctor1 }</td>
    				<td>${param.vistingdoctor2 }</td>
    				<td>${param.vistingdoctor3 }</td>
    			</tr>
    			<tr>
    				<td class="leftalign" colspan="3">& Charges</td>
    				<td>${param.visitingDoctor1charges }</td>
    				<td>${param.visitingDoctor2charges }</td>
    				<td>${param.visitingDoctor3charges }</td>
    			</tr>
    			<tr>
    				<td class="leftalign" colspan="2">Operating Charges: </td><td>${param.operatingcharges }</td>
    				<td class="leftalign" colspan="2">Operation theater charges: </td><td>${param.otcharges }</td>
    			</tr>
    			<tr>
    				<td class="leftalign" colspan="2">Assistant's Charges: </td><td>${param.assistantcharges }</td>
    				<td class="leftalign" colspan="2">Special Instruments/Equipments Charges</td><td>${param.instrumentcharges }</td>
    			</tr>
    			<tr>
    				<td class="leftalign" colspan="2">Anaesthesia Charges Doctor: </td><td>${param.doctorcharges }</td>
    				<td class="leftalign" colspan="2">Anaesthesia Drugs,O.T. Drugs, Suture, Material etc. Charges: </td><td>${param.drugscharges }</td>
    			</tr>
    			<tr>
    				<td class="leftalign" colspan="2">Oxygen Charges: </td><td>${param.oxygencharges }</td>
    				<td class="leftalign" colspan="2">Implants and/Or Other Materials Chrages: </td><td>${param.implants }</td>
    			</tr>
    			<tr>
    				<td class="leftalign" colspan="2">Delivery Charges: </td><td>${param.deliverycharges }</td>
    				<td class="leftalign" colspan="2">Labour Room Charges: </td><td>${param.labour }</td>
    			</tr>
    			<tr>
    				<td class="leftalign" colspan="2">Baby Care Charges: </td><td>${param.babycare }</td>
    				<td class="leftalign" colspan="2">I.V fusions and/or Blood Transfusions: </td><td>${param.ivfusion }</td>
    			</tr>
    			<tr>
    				<td class="leftalign" colspan="2">Disposable Material:</td><td>${param.disposable }</td>
    				<td class="leftalign" colspan="2">Hospital's Drugs, Medicines, etc. and/or Drug Administration charges: </td><td>${param.disposable }</td>
    			</tr>
    			<tr>
    				<td class="leftalign" colspan="2">Laboratory Charges: </td><td>${param.lab }</td>
    				<td class="leftalign" colspan="2">Dressing/or Plaster Charges: </td><td>${param.admincharges }</td>
    			</tr>
    			<tr>
    				<td class="leftalign" colspan="2">Special investigation Charges: </td><td>${param.special }</td>
    				<td class="leftalign" colspan="2">Miscellaneous Charges: </td><td>${param.misc }</td>
    			</tr>
    			<tr>
    				<td class="leftalign" colspan="2">Per X-Ray Price</td><td>${param.xrayperprice }</td>
    				<td class="leftalign" colspan="2">X-Ray Qty </td><td>${param.xrayqty }</td>
    			</tr>
    			<tr>
    				<td class="leftalign" colspan="3">Total X-Ray Charges: </td><td colspan="3">${param.xray }</td>
    			</tr>
    			<tr>
    				<td class="leftalign" colspan="3">Total (Rs. in Words) : </td><td colspan="3">${param.totalinwords }</td>
				</tr>
    			<tr>	
    				<td class="leftalign" colspan="3">Total (Rs.) : </td><td colspan="3">${param.totalinrupees }</td>
    			</tr>
    			<tr>
    				<td class="leftalign" colspan="3">Advance: </td><td>${param.advance }</td>
    				<td class="leftalign">Concession:</td><td>${param.concession }</td>
    			</tr>	
    			<tr>
    			<%-- 	<td>Previous Balance: </td><td>${param.prevbal }</td> --%>
    				<td class="leftalign" colspan="3">Total Payable : </td><td colspan="3">${param.totalpayable }</td>
    			</tr>
    			<tr>
    				<td class="leftalign" colspan="3">Amount paid: </td><td>${param.paid }</td>
    				<td class="leftalign">Balance</td><td>${param.balance }</td>
    			</tr>
    		</table>
    	</div>
    	<div class="advanceSearch" style="width:100%;margin:0;border-radius:0;height:auto;float:left;">
    		 <table class="billTable">
   				<tr>
    				<td style="height:2.2em;"></td><td style="height:12.5px; "></td>
    			</tr>
    			<tr>	
    				<td>Signature and / or Thumb Impression of Patient</td>  
					<td>Authorised Signature</td>
  				</tr>
</table>
    	</div>    	
</body>
</html>