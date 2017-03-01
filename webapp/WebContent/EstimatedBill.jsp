<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.Connection_Provider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="WEB-INF/bookAppointment.tld" prefix="ba"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Estimated Bill</title>
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
    		var selectedOption = document.getElementById("dischargeType").options[document.getElementById("dischargeType").selectedIndex].text;
    		if(selectedOption == "Discharge"){
    			document.getElementById("dischargeType").innerHTML = "";	
    		}else if(selectedOption == "Expiry"){
    			document.getElementById("dischargeType").innerHTML = "";
    		}else if(selectedOption == "--Select--"){
    			document.getElementById("registrationForm").innerHTML = "";
    		}	
    		initializeCombinedPicker();
    	}
    	
    	function calculateTotal(){
    		//Values To Add
    		var val1 = document.getElementById("roomCharges").value;
    		var val2 = document.getElementById("nursingCharges").value;
    		var val3 = document.getElementById("operatingCharges").value;
    		var val4 = document.getElementById("assistantsCharges").value;
    		var val5 = document.getElementById("otCharges").value;
    		var val6 = document.getElementById("oxygenCharges").value;
    		var val7 = document.getElementById("otherCharges").value;
    		var val8 = document.getElementById("anaesthesiaDoctorCharges").value;
    		var val9 = document.getElementById("specialInstrumentCharges").value;
    		var val10 = document.getElementById("implantsOtherMaterialCharges").value;
    		var val11 = document.getElementById("deliveryCharges").value;
    		var val12 = document.getElementById("labourRoomChrges").value;
    		var val13 = document.getElementById("babyCareCharges").value;
    		var val14 = document.getElementById("ivOrBloodTransfusionsCharges").value;
    		var val15 = document.getElementById("disposableMaterial").value;
    		var val16 = document.getElementById("hospitalAdministrationCharges").value;
    		var val17 = document.getElementById("dressingOrPlasterCharges").value;
    		var val18 = document.getElementById("labCharges").value;
    		var val19 = document.getElementById("investigationCharges").value;
    		var val20 = document.getElementById("xrayCharges").value;
    		var val21 = document.getElementById("miscellaneousCharges").value;
    		/* var val22 = document.getElementById("prevBal").value; */
    		var val23 = document.getElementById("amountPaid").value;
    		var val24 = document.getElementById("ipdregistrationcharges").value;
    		var val25 = document.getElementById("v1charges").value;
    		var val26 = document.getElementById("v2charges").value;
    		var val27 = document.getElementById("v3charges").value;
    		var val28 = document.getElementById("advancePaid").value;
    		var val29 = document.getElementById("concession").value;
    			
    		var totalInNumbers = parseInt(val1, 10)+parseInt(val2,10)+parseInt(val3,10)+parseInt(val4,10)+parseInt(val5,10)+parseInt(val6,10)+parseInt(val7,10)+parseInt(val8,10)+parseInt(val9,10)+parseInt(val10,10)+parseInt(val11,10)+parseInt(val12,10)+parseInt(val13,10)+parseInt(val14,10)+parseInt(val15,10)+parseInt(val16,10)+parseInt(val17,10)+parseInt(val18,10)+parseInt(val19,10)+parseInt(val20,10)+parseInt(val21,10)+parseInt(val24,10)+parseInt(val25,10)+parseInt(val26,10)+parseInt(val27,10);
    		/* var payable = (totalInNumbers - parseInt(val28, 10)) + parseInt(val22, 10); */
    		var payable = ((totalInNumbers - parseInt(val28, 10))- parseInt(val29,10));
    		
    		//Values To Update
    		document.getElementById("totalIPDAmountInNumbers").value = totalInNumbers;
    		document.getElementById("totalPayable").value = payable;
	   		document.getElementById("balance").value = payable - parseInt(val23, 10);
    	} 
    	
    	function getRoomCharges(){
    		var roomCharges = document.getElementById('roomType').options[document.getElementById('roomType').selectedIndex].value;
    		var roomtypetext = document.getElementById('roomType').options[document.getElementById('roomType').selectedIndex].text;
    		document.getElementById('roomtypetext').value = roomtypetext;
    		document.getElementById("perRoomCharge").value = parseInt(roomCharges);
    		var day;
    		day=daydiff(parseDate($('#DOA').val()), parseDate($('#combined-picker4').val()));
    		document.getElementById("roomCharges").value = parseInt(roomCharges)*parseInt(day);
    		calculateTotal();
    	}
    	
    	function parseDate(str) {
    	    var mdy = str.split('-');
    	    var dt = mdy[1]+",,"+mdy[2].substring(0,2)+",,"+mdy[0];
    	    return new Date(dt);
    	}

    	function daydiff(first, second) {
    	    return Math.round((second-first)/(1000*60*60*24));
    	}

    	
    	function calculatexraycharges(){
    		var xrayperprice = parseInt(document.getElementById("perPricexray").value);
    		var xrayqty = parseInt(document.getElementById("xraqty").value);
    		document.getElementById("xrayCharges").value = xrayperprice * xrayqty;
    		calculateTotal();
    	}
/*     	var date1 = new Date("7/11/2010");
    	var date2 = new Date("12/12/2010");
    	var timeDiff = Math.abs(date2.getTime() - date1.getTime());
    	var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24)); 
    	alert(diffDays); */
    	
    	/* function showBillDetails(){
    		var opt = document.getElementById('billType').options[document.getElementById('billType').selectedIndex].text;
    		
    		if(opt != "--Select--"){
    			document.getElementById('billingTable').style.display = "block";
    		}else{
    			document.getElementById('billingTable').style.display = "none";
    		}
    	} */
    </script>
</head>
<body>
 <!-- Menu -->
    <jsp:include page="menu.jsp"></jsp:include>
    <!-- Menu -->

<%
Connection_Provider connectionProvider = new Connection_Provider();
Connection con = connectionProvider.getConnection();
String prevBalQuery = "select max(ipd_bill_generation_datetime) from omk_ipd_billing_details where ipd_bill_ipd_id=? and ipd_bill_datetime_of_admission=?";
String prevBal,mlcno,advanceAmountPaid;

//Get Previous Balance
PreparedStatement ps = con.prepareStatement(prevBalQuery);
ps.setString(1, request.getParameter("ipdId"));
ps.setString(2, request.getParameter("dateOfAdmission"));

ResultSet rs = ps.executeQuery();

if(rs.next()){
	String balanceQuery = "select ipd_bill_balance,mlcno from omk_ipd_billing_details where ipd_bill_ipd_id=? and ipd_bill_generation_datetime=?";
	
	PreparedStatement ps1 = con.prepareStatement(balanceQuery);
	ps1.setString(1, request.getParameter("ipdId"));
	ps1.setString(2, rs.getString(1));
	
	ResultSet rs1 = ps1.executeQuery();
	
	if(rs1.next()){
		prevBal = rs1.getString(1);
		mlcno = rs1.getString(2);
		ps1.close();
		rs1.close();
	}else{
		prevBal = "0";
		mlcno = "";
		ps1.close();
		rs1.close();
	}
}else{
	prevBal = "0";
	mlcno = "";
	ps.close();
}
 
//Get Advance Amount Paid
String advancePaidAmountSQL = "select SUM(amount) from advance_amount where advance_ipd_id=? and admission_datetime=?";
PreparedStatement pst1 = con.prepareStatement(advancePaidAmountSQL);
pst1.setString(1, request.getParameter("ipdId"));
pst1.setString(2, request.getParameter("dateOfAdmission"));

ResultSet rs2 = pst1.executeQuery();
if(rs2.next()){
	advanceAmountPaid = rs2.getString(1);
	pst1.close();
	rs2.close();
}else{
	advanceAmountPaid = "0";
	pst1.close();
	rs2.close();
}
%>
		<form name="bookappointmentform" action="EstimatedBill" method="get">
		<div class="advanceSearch" style="width:100%;margin:2em 0 0;border-radius:0;">
    	<h4><i class="fa fa-file"></i>IPD Patient Details</h4>			 
                  <table cellspacing="5" cellpadding="10" class="book_appointment_table">
                       	<tr>
                           	<td><label>IPD ID:</label></td><td><input type="text" name="ipdid" value="${param.ipdId }" readonly="readonly"/></td>
                        </tr>
                        <tr>    
                            <td><label>First Name:</label></td>
                            <td><input type="text" name="f_name" value="${param.fName }" readonly="readonly"/></td>
                            <td><label>Middle Name:</label></td>
                            <td><input type="text" name="m_name" value="${param.m_name }" readonly="readonly"/></td>
                       		<td><label>Last Name:</label></td>
                            <td><input type="text" name="l_name" value="${param.l_name }" readonly="readonly"/></td>
                       	
                       	</tr>
                       	<tr>
                       		<td><label>Age: </label></td><td><input type="text" name="patient_age" value="${param.patientAge }" readonly="readonly"/></td>
                       		<td><label>Occupation: </label></td><td><input type="text" name="patientOccupation" value="${param.patientOccupation }" readonly="readonly"/></td>
                       		<td><label>Next To Kin: </label></td><td><input type="text" name="patient_next_to_kin" value="${param.patientNextToKin }" readonly="readonly"/></td>
                       	</tr>
                       	<tr>
                       	 	<td><label>Contact No:</label></td>
                            <td><input type="text" name="patient_contact_no" value="${param.patientContact }" readonly="readonly"/></td>
                            <td><label>Date of Admission:</label></td>
                           	<td><input type="text" name="date_of_admission" id="DOA" style="width:80%;float:left;" readonly="readonly" value="${param.dateOfAdmission }"/></td>
                           	<td>Referred By: </td>
                        	<td>
                        		<select name="patient_referred_by" readonly="readonly" >
                        			<option>${param.patientRefrence }</option>
                        			<ba:getRefernceDoctorList/>
                        		</select>
                        	</td>                       	                       		
                       	</tr>
                       	<tr>
                       		<td><label>Address: </label></td><td colspan="2"><textarea rows="3" cols="37" name="patient_address" readonly="readonly">${param.patientAddress }</textarea></td>
                           	<td>Primary Diagnosis: </td>
                           	<td colspan="2"><textarea cols="37" rows="3" readonly="readonly" name="primaryDiagnosis">${param.primaryDiagnosis }</textarea></td>                           	
                           	
                        </tr>                                              
                     </table>
        </div>
        
        <!-- Discharge Details -->
        <div class="advanceSearch" style="width:100%;margin:0;border-radius:0;">
    		<h4><i class="fa fa-file"></i>Discharge Details</h4>
    		<table cellspacing="5" cellpadding="10" class="book_appointment_table">
                <tr>
                   	<td>Surgeon: </td>
                 	<td>
                 		<select name="surgeon">
          					<option>${param.ipdsurgeon}</option>
          					<ba:getDoctorList/>    									
          				</select>
                 	</td>
                	<td>Date Of Surgery: </td>
                 	<td><input type="text" name="dateOfSurgery" id="combined-picker1"  readonly="readonly" value="${param.surgeryDate }"/></td>  
                 	<td>Estimated Bill Date : </td>
					<td><input type="text" name="dateOfDischarge" id="combined-picker4"  value=""/></td>                      	
                 </tr>
                 <tr>
                 	<td>Suregry Description:</td>
                 	<td colspan="2"><textarea cols="37" rows="3" name="suregryDescription">${param.surgeryDescription }</textarea></td>
                 	<td>Final Diagnosis</td>
                    <td colspan="2"><textarea cols="37" rows="3" name="finalDiagnosis"></textarea></td>    
                 </tr>
                 <tr>
                 	<td>Anaesthetist Doctor: </td>
                 	<td><input type="text" name="anaesthetistDoctor" autocomplete="off" value="${param.anaesthetistDoctor }"/></td>
                 	<td>Anaesthesia Type: </td>
                 	<td>
                 		<select name="anaesthesiaType">
                 			<option>--Select--</option>
                 			<option>GA</option>
                 			<option>SA</option>
                 			<option>EA</option>
                 			<option>LA</option>
                 			<option>BLOCK</option>
                 		</select>
                	</td>
                </tr>
                <tr>                        
					                        
                </tr>
                	<tr>
                    	<td>Date Of Expiry: </td>
                     	<td><input type="text" name="dateOfExpiry" id="combined-picker2" readonly="readonly" value="${param.expirydate }"/></td>
                        <td>Cause Of Death: </td>
                     	<td><input type="text" name="patient_cause_of_death" autocomplete="off" /></td>  
                     	<td>Death Certificate No.: </td>
                       	<td><input type="text" name="patient_death_certificateNo" autocomplete="off" /></td>                      	
                   </tr>
                    <tr>                        
                        <td>Death Certificate Issue Date: </td>
                        <td><input type="text" id="combined-picker3" name="patient_detah_certificate_issue_date" readonly="readonly"/></td>
                   </tr>                   
          </table>  
    	</div>
    	<!-- /Discharge Details -->
    	
    	<!-- Billing Details -->
    	<div class="advanceSearch" style="width:100%;margin:0;border-radius:0;">
    		<h4><i class="fa fa-file"></i>Billing Details</h4>
    		<table cellspacing="5" cellpadding="10" class="book_appointment_table" style="margin-bottom:1em;">
    			<tr>
    				<td colspan="2">Bill Type: <input type="text" name="billType" value="Final" readonly style="text-align:center;"/></td>
    				<!-- <td>
    					<select name="billType" onchange="showBillDetails();" id="billType">
    						<option>--Select--</option>
    						<option>Final</option>
    						<option>Weekly</option>
    					</select>
    				</td> -->
    				<td></td>
    				<!-- <td></td> -->
    			</tr>
    		</table>
    		<table cellspacing="5" cellpadding="10" class="book_appointment_table" id="billingTable">
    			<tr>
    				<td>Registration Charges: </td>
    				<td><input type="text" name="ipdregistrationcharges" autocomplete="off" id="ipdregistrationcharges" onkeyup="calculateTotal();" value="0" required/></td>    				
    			</tr>
    			<tr>
    				<td>Room Type: </td>
    				<td>
    					<select name="roomtype" id="roomType" onchange="getRoomCharges();">
    						<option value="0">--Select--</option>
    						<ba:getRoomList/>
    					</select>
    				</td>
    				<td>Room/Bed No</td><td><input type="text" autocomplete="off" name="roomOrBedNo"  /></td>
    			</tr>
    			<tr>
    				<td>Room Charges: </td><td><input type="text" name="roomCharges" autocomplete="off" id="roomCharges" onkeyup="calculateTotal();" value="0" autocomplete="off"/></td>
    				<td>@ Rs. :</td><td><input type="text" name="perRoomCharge" autocomplete="off" id="perRoomCharge" value="0" style="width:50%;margin-right:0.2em"autocomplete="off"/>per day</td>
    			</tr>
    			<tr>
    				<td>Nursing Charges :</td><td><input type="text" name="nursingCharges" autocomplete="off"  id="nursingCharges" onkeyup="calculateTotal();" value="0" autocomplete="off" /></td>
    				<td>@ Rs. :</td><td><input type="text" name="perNursingCharges" value="0" autocomplete="off" style="width:50%;margin-right:0.2em" autocomplete="off"/>per day<td>
    			</tr>
    			<tr>
    				<td>Dr's Visits/Consulting Doctor: </td>
    				<td>
    					<select name="visitingDoc1">
    						<option>--Select--</option>
    						<ba:getDoctorList/>
    					</select>
    					<input type="text" name="v1charges" id="v1charges" style="width:30%;" autocomplete="off" onkeyup="calculateTotal();" value="0"/>
    				</td>
    				<td>
    					<select name="visitingDoc2">
    						<option>--Select--</option>
    						<ba:getDoctorList/>
    					</select>
    					<input type="text" name="v2charges" id="v2charges" style="width:25%;" autocomplete="off" onkeyup="calculateTotal();" value="0" autocomplete="off"/>
    				</td>
    				<td>
    					<select name="visitingDoc3">
    						<option>--Select--</option>
    						<ba:getDoctorList/>
    					</select>
    					<input type="text" name="v3charges" id="v3charges"  style="width:30%;" autocomplete="off" onkeyup="calculateTotal();" value="0" autocomplete="off"/>
    				</td>
    			</tr>
    			<tr>
    				<td>Operating Charges: </td><td><input type="text" name="operatingCharges" autocomplete="off" id="operatingCharges" onkeyup="calculateTotal();" value="0" autocomplete="off"/></td>
    				<td>Assistant's Charges: </td><td><input type="text" name="assistantsCharges" autocomplete="off" id="assistantsCharges" onkeyup="calculateTotal();" value="0" autocomplete="off"/></td>
    			</tr>
    			<tr>
    				<td>Operation theater charges: </td><td><input type="text" name="otCharges" autocomplete="off" id="otCharges" onkeyup="calculateTotal();" value="0" autocomplete="off"/></td>
    				<td>Oxygen Charges: </td><td><input type="text" name="oxygenCharges" autocomplete="off" id="oxygenCharges" onkeyup="calculateTotal();" value="0" autocomplete="off"/></td>
    			</tr>
    			<tr>
    				<td>Anaesthesia Drugs,O.T. Drugs, Suture, Material etc. Charges: </td><td><input type="text" autocomplete="off" name="otherCharges" id="otherCharges" onkeyup="calculateTotal();" value="0" autocomplete="off"/></td>
    				<td>Anaesthesia Charges Doctor: </td><td><input type="text" name="anaesthesiaDoctorCharges" autocomplete="off" id="anaesthesiaDoctorCharges" onkeyup="calculateTotal();" value="0" autocomplete="off"/></td>
    			</tr>
    			<tr>
    				<td>Special Instruments/Equipments CHarges</td><td><input type="text" name="specialInstrumentCharges" autocomplete="off" id="specialInstrumentCharges" onkeyup="calculateTotal();" value="0" autocomplete="off"/></td>
    				<td>Implants and/Or Other Materials Chrages: </td><td><input type="text" name="implantsOtherMaterialCharges" autocomplete="off" id="implantsOtherMaterialCharges" onkeyup="calculateTotal();" value="0" autocomplete="off"/></td>
    			</tr>
    			<tr>
    				<td>Delivery Charges: </td><td><input type="text" name="deliveryCharges" autocomplete="off" id="deliveryCharges" onkeyup="calculateTotal();" value="0" autocomplete="off"/></td>
    				<td>Labour Room Charges: </td><td><input type="text" name="labourRoomChrges" autocomplete="off" id="labourRoomChrges" onkeyup="calculateTotal();" value="0" autocomplete="off"/></td>
    			</tr>
    			<tr>
    				<td>Baby Care Charges: </td><td><input type="text" name="babyCareCharges" autocomplete="off" id="babyCareCharges" onkeyup="calculateTotal();" value="0" autocomplete="off"/></td>
    				<td>I.V fusions and/or Blood Transfusions: </td><td><input type="text" autocomplete="off" name="ivOrBloodTransfusionsCharges" id="ivOrBloodTransfusionsCharges" onkeyup="calculateTotal();" value="0" autocomplete="off"/></td>
    			</tr>
    			<tr>
    				<td>Disposable Material:</td><td><input type="text" name="disposableMaterial" autocomplete="off" id="disposableMaterial" onkeyup="calculateTotal();" value="0" autocomplete="off"/></td>
    				<td>Hospital's Drugs, Medicines, etc. and/or Drug Administration charges: </td><td><input type="text" autocomplete="off" name="hospitalAdministrationCharges" id="hospitalAdministrationCharges" onkeyup="calculateTotal();" value="0" autocomplete="off"/></td>
    			</tr>
    			<tr>
    				<td>Dressing/or Plaster Charges: </td><td><input type="text" autocomplete="off" name="dressingOrPlasterCharges" id="dressingOrPlasterCharges" onkeyup="calculateTotal();" value="0" autocomplete="off"/></td>
    				<td>Laboratory Chrages: </td><td><input type="text" autocomplete="off" name="labCharges" id="labCharges" onkeyup="calculateTotal();" value="0" autocomplete="off"/></td>
    			</tr>
    			<tr>
    				<td>Special investigation Charges: </td><td><input type="text" name="investigationCharges" autocomplete="off" id="investigationCharges" onkeyup="calculateTotal();" value="0" autocomplete="off"/></td>
    			</tr>
    			<tr>
    				<td >X-Ray Charges: </td>
    				<td colspan="3">Per Price<input type="text" name="perPricexray" id="perPricexray" autocomplete="off" onkeyup="calculatexraycharges();"/>Qty.<input type="text" name="xrayqty" id="xraqty" onkeyup="calculatexraycharges();" value="0" autocomplete="off"/>
    				Total<input type="text" name="xrayCharges" id="xrayCharges" onkeyup="calculateTotal();" value="0" readonly="readonly" autocomplete="off"/></td>
    			</tr>
    			<tr>
    				<td>Miscellaneous Charges: </td><td><input type="text" name="miscellaneousCharges" id="miscellaneousCharges" onkeyup="calculateTotal();" value="0" autocomplete="off"/></td>
    				<td></td><td></td>
    			</tr>
    			<tr>
					<td>Total (Rs.) : </td><td><input type="text" name="totalIPDAmountInNumbers" style="width:100%;"  id="totalIPDAmountInNumbers" onkeyup="calculateTotal();" value="0" readonly="readonly"/></td>
    				<td>Total (Rs. in Words) : </td><td><input type="text" name="totalIPDAmountInWords"  id="totalIPDAmountInWords" style="width:100%;" onkeyup="calculateTotal();" autocomplete="off"/></td>
    			</tr>
    			<tr>
    				<td>Concession: </td><td><input type="text" name="concession" autocomplete="off" id="concession" onkeyup="calculateTotal();" value="0"  /></td>
    				<td>Advance Paid: </td><td><input type="text" name="advancePaid" id="advancePaid" value="<%= advanceAmountPaid %>" readonly="readonly"/></td>
    			</tr>
    			<tr>
					<td>Total Payable : </td><td><input type="text" name="totalPayable" id="totalPayable" onkeyup="calculatepayable();" value="0" readonly="readonly"/></td>    				
    				<td>Amount paid: </td><td><input type="text" name="amountPaid" autocomplete="off" id="amountPaid" onkeyup="calculateTotal();" value="0" /></td>
    			</tr>
    			<tr>
    				<td>Balance</td><td><input type="text" name="balance" id="balance" onkeyup="calculateTotal();" value="0" readonly="readonly"/></td>
    				<td>MLC No. :</td><td><input type="text" autocomplete="off" name="mlcno" value="<%= mlcno %>"/>
    					<input type="hidden" name="roomtypetext" id="roomtypetext" />
    				</td>
    			</tr>
    			<tr>
                        <td colspan="2"><input type="submit" value="ESTIMATE BILL" style="font-family: Candara;margin: 0 1em 0 40em;color: #FFFFFF;background-color: #337ab7;padding: 0.2em 1.4em 0.3em;border-radius: 3px;border: 1px solid #337ab7;"/></td>
                   </tr>
    		</table>
    	</div>
    	<!-- /Billing Details -->
    	
        </form>
        
</body>
</html>