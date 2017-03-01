<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="WEB-INF/bookAppointment.tld" prefix="ba"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>IPD Bill</title>
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
   

<style>
.billTable{
width: 100%;border: 1px solid #000;border-collapse: collapse;float:left;padding: 0;height:auto;
}
.billTable td, th {
    border: 1px solid black;
    text-align:center;
}
</style>
</head>
<body>
	<!-- Menu -->
    	<jsp:include page="menu.jsp"></jsp:include>
    <!-- Menu --> 
    
<div style="width:100%;float:left;heigh:auto;">
<img src="okmarhosplogo.jpg" style="width:100%;height:auto;" />
</div>

		<div style="width:100%;margin:0;float:left;">
			
                  <table class="billTable">
                       	<tr>
                       		<td><label>IPD ID</label></td><td colspan="2">${param.ipdId}</td>
                       		<td><label>Bill Id</label></td><td colspan="3">${param.billid }</td>
                       	</tr>
                       	<tr><td><label>Name</label></td><td>${param.patientName }</td>
                       		<td><label>Age </label></td><td>${param.patientAge }</td>
                       		<td><label>Occupation</label></td><td>${param.patientOccupation }</td>
                       	</tr>
                       	<tr>
                       		<td><label>Address</label></td><td colspan="3">${param.patientAddress }</td>
                       		<td><label>Next To Kin</label></td><td>${param.patientNextToKin }</td>
                       	</tr>
                       	<tr>
                            <td><label>Contact No</label></td>
                            <td>${param.patientContact }</td>                            
                       		<td colspan="2"><label>Date of Admission</label></td>
                           	<td colspan="2">${param.dateOfAdmission }</td>                             
                           </tr>
                       	<tr>
                           	<td>Final Diagnosis</td>
                           	<td  colspan="3"> ${param.finaldiagnosis }</td>                         	
                           	<td>Referred By </td>
                        	<td>${param.patientRefrence }</td>
                        </tr>                                              
                     </table>
        </div>
    	
    	<!-- Billing Details -->
    	<div class="advanceSearch" style="width:100%;margin:0;border-radius:0;height:auto;float:left;">
    		<h4><i class="fa fa-file"></i>Billing Details</h4>
    		<table  class="billTable">
    			<tr>
    				<td>Bill Type: </td>
    				<td>${param.billtype }</td>
    				<td>Registration Charges: </td>
    				<td>${param.registrationcharges }</td>
    			</tr>
    			<tr>
    				<td>Room Type: </td>
    				<td>${param.roomtype }</td>
    				<td>Room/Bed No</td><td>${param.roombedno }</td>
    			</tr>
    			<tr>
    				<td colspan="4">Room Charges : Rs.${param.roomcharges} @ Rs.: ${param.perunitroomcharges } per day from ${param.admissiondate } To  ${param.dischargedate } </td>
    				
    			</tr>
    			<tr>
    				<td colspan="4">Nursing Charges : Rs.${param.nursingcharges } @ Rs. :${param.perunitnursingcharges } per day from ${param.admissiondate } To  ${param.dischargedate } </td>
    			</tr>
    			<tr>
    				<td>Dr's Visits/Consulting Doctor: </td>
    				<td>${param.vistingdoctor1 }</td>
    				<td>${param.vistingdoctor2 }</td>
    				<td>${param.vistingdoctor3 }</td>
    			</tr>
    			<tr>
    				<td>& Charges</td>
    				<td>${param.visitingDoctor1charges }</td>
    				<td>${param.visitingDoctor2charges }</td>
    				<td>${param.visitingDoctor3charges }</td>
    			</tr>
    			<tr>
    				<td>Operating Charges: </td><td>${param.operatingcharges }</td>
    				<td>Assistant's Charges: </td><td>${param.assistantcharges }</td>
    			</tr>
    			<tr>
    				<td>Operation theater charges: </td><td>${param.otcharges }</td>
    				<td>Oxygen Charges: </td><td>${param.oxygencharges }</td>
    			</tr>
    			<tr>
    				<td>Anaesthesia Drugs,O.T. Drugs, Suture, Material etc. Charges: </td><td>${param.drugscharges }</td>
    				<td>Anaesthesia Charges Doctor: </td><td>${param.doctorcharges }</td>
    			</tr>
    			<tr>
    				<td>Special Instruments/Equipments CHarges</td><td>${param.instrumentcharges }</td>
    				<td>Implants and/Or Other Materials Chrages: </td><td>${param.implants }</td>
    			</tr>
    			<tr>
    				<td>Delivery Charges: </td><td>${param.deliverycharges }</td>
    				<td>Labour Room Charges: </td><td>${param.labour }</td>
    			</tr>
    			<tr>
    				<td>Baby Care Charges: </td><td>${param.babycare }</td>
    				<td>I.V fusions and/or Blood Transfusions: </td><td>${param.ivfusion }</td>
    			</tr>
    			<tr>
    				<td>Disposable Material:</td><td>${param.disposable }</td>
    				<td>Hospital's Drugs, Medicines, etc. and/or Drug Administration charges: </td><td>${param.disposable }</td>
    			</tr>
    			<tr>
    				<td>Dressing/or Plaster Charges: </td><td>${param.admincharges }</td>
    				<td>Laboratory Chrages: </td><td>${param.lab }</td>
    			</tr>
    			<tr>
    				<td>Special investigation Charges: </td><td>${param.special }</td>
    				<td>Miscellaneous Charges: </td><td>${param.misc }</td>
    			</tr>
    			<tr>
    				<td>Per X-Ray Price</td><td>${param.xrayperprice }</td>
    				<td>X-Ray Qty </td><td>${param.xrayqty }</td>
    			</tr>
    			<tr>
    				<td>Total X-Ray Charges: </td><td colspan="3">${param.xray }</td>
    			</tr>
    			<tr>
    				<td>Total bill</td><td colspan="3">${param.totalinrupees }</td>
    			</tr>
    			<tr>
    				<td>Concession</td><td>${param.concession }</td>
    				<td>Advance amount</td><td>${param.advanceamount }</td>
    			</tr>
    			<tr>
    				<td>Total Payable : </td><td colspan="3">${param.totalpayable }</td>
    			</tr>
    			<tr>
    				<td>Amount paid: </td><td>${param.paid }</td>
    				<td>Balance</td><td>${param.balance }</td>
    			</tr>
    		</table>
    	</div>
    	<div class="advanceSearch" style="width:100%;margin:0;border-radius:0;height:auto;float:left;">
    		 <table class="billTable">
   				<tr>
    				<td style="height:8.2em;"></td><td style="height:25px; "></td>
    			</tr>
    			<tr>	
    				<td>Signature and / or Thumb Impression of Patient</td>  
					<td>Authorised Signature</td>
  				</tr>
  				<tr>
  				<% 
  					String ipdId=request.getParameter("ipdId");
  					String patientName=request.getParameter("patientName");
  					String patientAge=request.getParameter("patientAge");
  					String patientOccupation=request.getParameter("patientOccupation");
  					String patientAddress=request.getParameter("patientAddress");
  					String patientNextToKin=request.getParameter("patientNextToKin");
  					String patientContact=request.getParameter("patientContact");
  					String dateOfAdmission=request.getParameter("dateOfAdmission");
  					String PrimaryDiagnosis=request.getParameter("primaryDiagnosis");//8
  					String patientRefernce=request.getParameter("patientRefrence");
  					
  					String surgeon=request.getParameter("ipdsurgeon");//7
  					String patientDateOfSurgery=request.getParameter("surgeryDate");//6
  					String anaesthesiaDoctor=request.getParameter("anaesthethistdoctor");//5
  					String anaesthesiaType=request.getParameter("anaesthesiatype");//4
  					String finalDiagnosis=request.getParameter("finaldiagnosis");
  					String dateOfDischarge=request.getParameter("dischargedate");
  					String dateOfExpiry=request.getParameter("expirydate");//3
  					String causeOfDeath=request.getParameter("causeofdeath");//2
  					String deathCertificateNo=request.getParameter("deathcertificateno");
  					String deathCertificateIssueDate=request.getParameter("deathcertificateissuedate");
  					String billType=request.getParameter("billtype");
  					String roomType=request.getParameter("roomtype");
  					String roombedno=request.getParameter("roombedno");
  					String roomCharges=request.getParameter("roomcharges");
  					String perUnitRoomCharges=request.getParameter("perunitroomcharges");
  					String nursingCharges=request.getParameter("nursingcharges");
  					String perUnitNursingCharges=request.getParameter("perunitnursingcharges");
  					String visitingDoctor1=request.getParameter("vistingdoctor1");
  					String visitingDoctor2=request.getParameter("vistingdoctor2");
  					String visitingDoctor3=request.getParameter("vistingdoctor3");
  					String operatingCharges=request.getParameter("operatingcharges");
  					String assistantsCharges=request.getParameter("assistantcharges");
  					String otCharges=request.getParameter("otcharges");  					
  					String oxygenCharges=request.getParameter("oxygencharges"); 
  					String drugsCharges=request.getParameter("drugscharges"); 
  					String anaesthesiaDoctorCharges=request.getParameter("doctorcharges");//1 
  					String instrumentCharges=request.getParameter("instrumentcharges"); 
  					String implantsCharges=request.getParameter("implants"); 
  					String deliveryCharges=request.getParameter("deliverycharges"); 
  					String labourRoomCharges=request.getParameter("labour"); 
  					String babyCareCharges=request.getParameter("babycare"); 
  					String ivOrBloodFusionCharges=request.getParameter("ivfusion"); 
  					String disposableMaterial=request.getParameter("disposable"); 
  					String administrationCharges=request.getParameter("admincharges"); 
  					String dressingOrPlasterCharges=request.getParameter("dressing"); 
  					String labCharges=request.getParameter("lab"); 
  					String investigationCharges=request.getParameter("special"); 
  					String xrayCharges=request.getParameter("xray"); 
  					String miscelleneousCharges=request.getParameter("misc"); 
  					String totalInWords=request.getParameter("totalinwords"); 
  					String totalInNumbers=request.getParameter("totalinrupees"); 
  					String advanceamount=request.getParameter("advanceamount");
  					String prevBal=request.getParameter("prevbal"); 
  					String totalpayable=request.getParameter("totalpayable"); 
  					String amountpaid=request.getParameter("paid"); 
  					String balance=request.getParameter("balance"); 
  					String visitingDoctor1charges=request.getParameter("visitingDoctor1charges"); 
  					String visitingDoctor2charges=request.getParameter("visitingDoctor2charges"); 
  					String visitingDoctor3charges=request.getParameter("visitingDoctor3charges"); 
  					String billingId=request.getParameter("billid"); 
  					String registrationCharges=request.getParameter("registrationcharges"); 
  					String xrayperprice=request.getParameter("xrayperprice"); 
  					String xrayqty=request.getParameter("xrayqty"); 
  					String concession=request.getParameter("concession");
					
				%>
				
  				<td colspan="2"><a href="IPDBillPrint1.jsp?ipdId=<%=ipdId%>&patientName=<%= patientName%>&patientAge=<%= patientAge%>&patientOccupation=<%= patientOccupation%>&patientAddress=<%= patientAddress%>&patientNextToKin=<%= patientNextToKin%>&patientContact=<%= patientContact%>&dateOfAdmission=<%= dateOfAdmission%>&primaryDiagnosis=<%=PrimaryDiagnosis %>&patientRefrence=<%= patientRefernce%>&ipdsurgeon=<%= surgeon%>&surgeryDate=<%= patientDateOfSurgery%>&anaesthethistdoctor=<%= anaesthesiaDoctor%>&anaesthesiatype=<%= anaesthesiaType%>&finaldiagnosis=<%=finalDiagnosis %>&dischargedate=<%= dateOfDischarge%>&expirydate=<%= dateOfExpiry%>&causeofdeath=<%= causeOfDeath%>&deathcertificateno=<%= deathCertificateNo%>&deathcertificateissuedate=<%= deathCertificateIssueDate%>&billtype=<%= billType%>&roomtype=<%= roomType%>&roombedno=<%= roombedno%>&roomcharges=<%= roomCharges%>&perunitroomcharges=<%= perUnitRoomCharges%>&nursingcharges=<%= nursingCharges%>&perunitnursingcharges=<%= perUnitNursingCharges%>&vistingdoctor1=<%= visitingDoctor1%>&vistingdoctor2=<%= visitingDoctor2%>&vistingdoctor3=<%= visitingDoctor3%>&operatingcharges=<%= operatingCharges%>&assistantcharges=<%= assistantsCharges%>&otcharges=<%= otCharges%>&oxygencharges=<%= oxygenCharges%>&drugscharges=<%= drugsCharges%>&totalinwords=&doctorcharges=<%= anaesthesiaDoctorCharges%>&instrumentcharges=<%= instrumentCharges%>&implants=<%= implantsCharges%>&deliverycharges=<%= deliveryCharges%>&labour=<%= labourRoomCharges%>&babycare=<%= babyCareCharges%>&ivfusion=<%= ivOrBloodFusionCharges%>&disposable=<%= disposableMaterial%>&admincharges=<%= administrationCharges%>&dressing=<%= dressingOrPlasterCharges%>&lab=<%= labCharges%>&special=<%= investigationCharges%>&xray=<%= xrayCharges%>&misc=<%= miscelleneousCharges%>&totalinwords=<%= totalInWords%>&advance=<%=advanceamount %>&totalinrupees=<%= totalInNumbers%>&prevbal=<%= prevBal%>&totalpayable=<%= totalpayable%>&paid=<%= amountpaid%>&concession=<%=concession %>&balance=<%= balance%>&dischargedate=<%= dateOfDischarge%>&admissiondate=<%= dateOfAdmission%>&visitingDoctor1charges=<%= visitingDoctor1charges%>&visitingDoctor2charges=<%= visitingDoctor2charges%>&visitingDoctor3charges=<%= visitingDoctor3charges%>&billid=<%= billingId%>&registrationcharges=<%= registrationCharges%>&xrayperprice=<%= xrayperprice%>&xrayqty=<%= xrayqty%>"><input type="submit" value="PRINT BILL" style="font-family: Candara;margin: 0 1em 0 40em;color: #FFFFFF;background-color: #337ab7;padding: 0.2em 1.4em 0.3em;border-radius: 3px;border: 1px solid #337ab7;"/></a></td> 
  				
  				
  				</tr>
			</table>
  		</div>  

</body>
</html>