<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="WEB-INF/bookAppointment.tld" prefix="ba"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>IPD Bill</title>
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
    
    <script type="text/javascript">
    	function displayDischargeType(){
    		var selectedIndex = document.getElementById("dischargeType").options[document.getElementById("dischargeType").selectedIndex].text;
    		if(selectedOption == "Discharge"){
    			document.getElementById("dischargeType").innerHTML = "";	
    		}else if(selectedOption == "Expiry"){
    			document.getElementById("dischargeType").innerHTML = "";
    		}else if(selectedOption == "--Select--"){
    			document.getElementById("registrationForm").innerHTML = "";
    		}	
    		initializeCombinedPicker();
    	}
    </script>
</head>
<body>
 <!-- Menu -->
    <jsp:include page="menu.jsp"></jsp:include>
    <!-- Menu -->

	 	
    
    <!-- IPD Billing Details -->
    <div style="width:100%;float:left;heigh:auto;">
<img src="okmarhosplogo.jpg" style="width:100%;height:auto;" onload="javascript:window.print();self.location.href='dashboard.jsp?current=dashboard'" />
</div>
<div style="width:100%;margin:0;float:left;">
                  <table class="billTable">
                       	<tr>
                       		<td><label>IPD ID</label></td><td colspan="2">${param.i1 }</td>
                       		<td><label>Bill Id</label></td><td colspan="3">${param.billid } <%= new SimpleDateFormat("dd-MM-yy").format(new Date()) %></td>
                       	</tr>
                       	<tr><td><label>Name</label></td><td>${param.i2 }+${param.i53 }+${param.i54 }</td>
                       		<td><label>Age </label></td><td>${param.i3 }</td>
                       		<td><label>Occupation</label></td><td>${param.i4 }</td>
                       	</tr>
                       	<tr>
                       		<td><label>Address</label></td><td colspan="3">${param.i5 }</td>
                       		<td><label>Next To Kin</label></td><td>${param.i6 }</td>
                       	</tr>
                       	<tr>
                            <td><label>Contact No</label></td>
                            <td>${param.i7 }</td>                            
                       		<td colspan="2"><label>Date of Admission</label></td>
                           	<td colspan="2">${param.i8 }</td>                             
                           </tr>
                       	<tr>
                           	<td>Final Diagnosis</td>
                           	<td  colspan="3"> ${param.i14 }</td>                         	
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
    				<td colspan="3">${param.i20 }</td>
    			</tr>
    			<tr>
    				<td>Room Type: </td>
    				<td>${param.i21 }</td>
    				<td>Room/Bed No</td><td>${param.i22 }</td>
    			</tr>
    			<tr>
    				<td colspan="4">Room Charges : Rs.${param.i23} @ Rs.: ${param.i24 } per day from ${param.i8 } To  ${param.i15 } </td>
    				
    			</tr>
    			<tr>
    				<td colspan="4">Nursing Charges : Rs.${param.i25 } @ Rs. :${param.i26 } per day from ${param.i8 } To  ${param.i15 } </td>
    			</tr>
    			<tr>
    				<td>Dr's Visits/Consulting Doctor: </td>
    				<td>${param.i27 }</td>
    				<td>${param.i28 }</td>
    				<td>${param.i29 }</td>
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
    				<td>X-Ray Charges: </td><td>${param.xray }</td>
    			</tr>
    			<tr>
    				<td>Miscellaneous Charges: </td><td>${param.misc }</td><td colspan="2"></td>
    			</tr>
    			<tr>
    				<td>Total (Rs. in Words) : </td><td colspan="3">${param.totalinwords }</td>
				</tr>
    			<tr>	
    				<td>Total (Rs.) : </td><td colspan="3">${param.totalinrupees }</td>
    			</tr>	
    			<tr>
    				<td>Previous Balance: </td><td>${param.prevbal }</td>
    				<td>Total Payable : </td><td>${param.totalpayable }</td>
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
</table>
    	</div>      
    <!-- /IPD Billing Details -->
</body>
</html>