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
<title>OPD Billing</title>

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
    
      <script language="javascript">
        function addRow(tableID) {

            var table = document.getElementById(tableID);
			var serviceName = document.getElementById("serviceTaken").options[document.getElementById("serviceTaken").selectedIndex].text;
			var serviceValue = document.getElementById("serviceTaken").options[document.getElementById("serviceTaken").selectedIndex].value;
			
            var rowCount = table.rows.length;
                var row = table.insertRow(rowCount);

                var cell0 = row.insertCell(0);
                var element0 = document.createElement("input");
                element0.type = "checkbox";
                element0.name = "chkbox[]";
                cell0.appendChild(element0);

                var cell1 = row.insertCell(1);
                var element1 = document.createElement("input");
                element1.type = "text";
                element1.name ="serviceName";
                element1.value = serviceName;
                element1.readOnly = "true";
                cell1.appendChild(element1);

                var cell2 = row.insertCell(2);
                cell2.colSpan = "3";
                var element2 = document.createElement("input");
                element2.type = "text";
                element2.className = "price";
                element2.name = "serviceValue";
                element2.value = serviceValue;
				element2.readOnly = "true";
                /* cell1.appendChild(element2); */
                cell2.appendChild(element2); 

                /* var cell3 = row.insertCell(3); */
                var element3_1 = document.createElement("i");
                element3_1.className = "fa fa-minus";
                /* cell3.appendChild(element3_1); */
                cell2.appendChild(element3_1);
                var element3 = document.createElement("input");
                element3.type = "text";
                element3.className = "qty";
                element3.name = "quantity";
                element3.value =  "1";
				element3.readOnly = "true";
                /* cell3.appendChild(element3); */
                cell2.appendChild(element3);
                var element3_2 = document.createElement("i");
                element3_2.className = "fa fa-plus";
                /* cell3.appendChild(element3_2); */
                cell2.appendChild(element3_2);

                /* var cell4 = row.insertCell(4); */
                var element4 = document.createElement("input");
                element4.type = "text";
                element4.className = "total";
                element4.name = "serviceTotal";
                element4.value = serviceValue;
                element4.readOnly = "readonly";
                /* cell4.appendChild(element4); */
                cell2.appendChild(element4);
                
                var totalAmount = parseInt(document.getElementById('servicesTotalPrice').value) + parseInt(serviceValue);
                document.getElementById('servicesTotalPrice').value = totalAmount;
                calculatePayable(document.getElementById('totalDiscount').value);
                flushdata();
        }

        function deleteRow(tableID) {
            try {
                var table = document.getElementById(tableID);
                var rowCount = table.rows.length;
                for(var i=0; i < rowCount; i++) {
                    var row = table.rows[i];
                    var chkbox = row.cells[0].childNodes[0];
                    if(null != chkbox && true && chkbox.checked) {
                    	var total = row.cells[2].childNodes[4].value;
                    	var totalAmount = parseInt(document.getElementById('servicesTotalPrice').value) - parseInt(total);
                    	document.getElementById('servicesTotalPrice').value = totalAmount;
                    	 calculatePayable(document.getElementById('totalDiscount').value);
                        table.deleteRow(i);
                        rowCount--;
                        i--;
                    }
                }
					flushdata();                
                	document.getElementsByName('selectAll').item(0).checked = false;
            }catch(e) {
                alert(e);
            }
        }

        function checkAll(ele) {
            var checkboxes = document.getElementsByTagName('input');
            if (ele.checked) {
                for (var i = 0; i < checkboxes.length; i++) {
                    if (checkboxes[i].type == 'checkbox' && checkboxes[i].name == "chkbox[]") {
                        checkboxes[i].checked = true;
                    }
                }
            } else {
                for (var i = 0; i < checkboxes.length; i++) {
                    console.log(i)
                    if (checkboxes[i].type == 'checkbox' && checkboxes[i].name == "chkbox[]") {
                        checkboxes[i].checked = false;
                    }
                }
            }
        }
        
        function calculatePayable(discountPercent){
        	try{
        		var servicesTotalPrice = parseInt(document.getElementById('servicesTotalPrice').value);
        		var totalPayable = servicesTotalPrice-parseInt(discountPercent) + parseInt(document.getElementById('previousbalance').value);
        		document.getElementById('totalPayable').value = totalPayable;
        	}catch(e){
        		alert(e);
        	}
        }
        
        function flushdata(){
        	document.getElementById('totalDiscount').value = '0';
			/* document.getElementById('totalPayable').value = ''; */
			document.getElementById('amountPaid').value = '';
			document.getElementById('amountBalance').value = '';
        }
        
        function calculateAmountBalance(amountPaid){
        	try{
        		totalPayable = parseInt(document.getElementById('totalPayable').value);
        		document.getElementById('amountBalance').value = totalPayable - parseInt(amountPaid);
        	}catch(e){
        		alert(e);
        	}
        }
        
       /*  function calculateConsultationCharges(){
        	var consultingDocValue = parseInt(document.getElementById('consulting_serviceValue').value);
        	var totalAmount = parseInt(document.getElementById('servicesTotalPrice').value);
        	var consultaionFeesOrg =  parseInt(document.getElementById('consultationfees').value);
        	document.getElementById('ConsultingserviceTotal').value = consultingDocValue;
        	if(consultingDocValue > consultaionFeesOrg){
        		var finaltotalAmount =0;
        		var valueToadd = consultingDocValue-consultaionFeesOrg;
        		finaltotalAmount = totalAmount+valueToadd;
        		document.getElementById('servicesTotalPrice').value = finaltotalAmount;
        	}else if(consultingDocValue < consultaionFeesOrg){
        		var finaltotalAmount =0;
        		var valueTosub = consultaionFeesOrg-consultingDocValue;
        		finaltotalAmount = totalAmount-valueTosub;
        		document.getElementById('servicesTotalPrice').value = finaltotalAmount;
        	}
        	calculatePayable(parseInt(document.getElementById('totalDiscount').value));
        	flushdata();
        } */
    </script>
    <script>
    $(function () {
    	$( document ).on( "click", ".fa-minus, .fa-plus", function() {
            var $qty = $(this).siblings('.qty');
            var qtyCounter = parseInt($qty.val());
            if($(this).hasClass('fa-plus'))
                qtyCounter++;
            else            	
            	qtyCounter--;
            if(qtyCounter == 0){
            	alert("Quantity must be positive number");
            }else{
	            $qty.val(qtyCounter);
	            var pricePerUnit = $(this).siblings('.price').val();
	            var quantity = $(this).siblings('.qty').val();
	            var total = quantity * pricePerUnit;
	            $(this).siblings('.total').val(total);
	            var serviceTotal = $('#servicesTotalPrice').val();
	            /* $('#servicesTotalPrice').val('0'); */
	            var totalAmount;
	            if($(this).hasClass('fa-plus')){
	            	totalAmount = parseInt(serviceTotal)+parseInt(pricePerUnit);
	            	$('#servicesTotalPrice').val(totalAmount);
	            	totalPayable = parseInt($('#totalPayable').val())+parseInt(pricePerUnit);
	            	$('#totalPayable').val(totalPayable);
	            	$('#amountPaid').val('');
	            	$('#amountBalance').val('');
	            }
	            else{
	            	totalAmount = parseInt(serviceTotal)-parseInt(pricePerUnit);
	            	$('#servicesTotalPrice').val(totalAmount);
	            	tottalPayable = parseInt($('#totalPayable').val())-parseInt(pricePerUnit);
	            	$('#totalPayable').val(tottalPayable);
	            	$('#amountPaid').val('');
	            	$('#amountBalance').val('');
	            }
	            }
            	
        });
    });
</script>
</head>
<body>
<%
	Connection_Provider connectionProvider = new Connection_Provider();
	Connection con = connectionProvider.getConnection();
	PreparedStatement ps = con.prepareStatement("select bill_balance from omk_opd_billing_details where bill_id=?");
	ps.setString(1, request.getParameter("billId"));
	String prevBal;
	ResultSet rs = ps.executeQuery();
	if(rs.next())
		if(rs.getString(1).equals("")){
			prevBal = "0";
		}else{
			prevBal = rs.getString(1);
		}
	else
		prevBal = "0";
	%>
    <!-- Menu -->
    <jsp:include page="menu.jsp"></jsp:include>
    <!-- Menu -->

		<form name="bookappointmentform" action="GenrateBill" method="post">
		<div class="advanceSearch" style="width:100%;margin:0.5em 0;border-radius:0;">
    	<h4><i class="fa fa-file"></i>OPD Patient Details</h4>
                  <table cellspacing="5" cellpadding="10" class="book_appointment_table">
                       	<tr>
                           	<td><label>OPD ID:</label></td>
                            <td><input type="text" name="bookingid" value="${param.opdId }" readonly="readonly"/></td><td><label>Name:</label></td>
                            <td><input type="text" name="patient_name" value="${param.patientName }" readonly="readonly"/></td>
                       	</tr>
                       	<tr>
                            <td><label>Gender: </label></td>
                        	<td><input type="text" name="patient_gender" value="${param.patientGender }" readonly="readonly"/></td>                            
                            <td><label>Contact No:</label></td>
                            <td><input type="text" name="patient_contact_no" value="${param.patientContact }" readonly="readonly"/></td>
                            <td><label>Age</label></td>
                            <td><input type="text" name="patient_age" value="${param.patientAge }" readonly="readonly"/></td>
                           </tr>
                       	<tr>
                        	<td>Address: </td>
                        	<td><textarea name="patient_address" cols="" rows="" readonly="readonly">${param.patientAddress }</textarea></td>                        	
                        	<td>Occupation: </td>
                        	<td><input type="text" name="patient_occupation" value="${param.patientOccupation }" readonly="readonly" /></td>
                       		<td><label>Date of Appointment:</label></td>
                           	<td><input type="text" name="date_of_appointment" style="width:80%;float:left;" readonly="readonly" value="${param.dateOfAppointment }"/></td>                        	
                        </tr>
                        <tr>
                           	<td>Appointment For: </td>
                        	<td><input type="text" name="appointment_for" value="${param.appointmentFor }" readonly="readonly" /></td>
                       		<td>Consulting Doctor: </td>
                        	<td><input type="text" name="consulting_doctor" value="${param.consultingDoctor }" readonly="readonly" /></td> 
                        	<td>Reference Doctor: </td>
                        	<td><input type="text" name="reference_doctor" value="${param.referenceDoctor }" readonly="readonly" /></td>                        	
                        </tr>
                     </table>   
                     
                     <div class="advanceSearch" style="width:100%;margin:0;">
	                    <div class="servicesTaken">
						<h4 style="border:1px solid #337ab7;">Services Taken</h4>	                    
	                     	<select name="services" id="serviceTaken" onclick="addRow('billTable')" multiple class="serviceDesc">
	                     		<ba:getServiceDetails></ba:getServiceDetails>
	                     	</select>
						</div>
						<div class="billTable">
							 <table id="billTable" class="responstable1" >
								 <thead>
                                    <tr>
                                        <th colspan="4"><INPUT type="button" value="Delete Service" onclick="deleteRow('billTable')" class="btn_look" style="float:none;background-color:#38546B;width:25%;padding:0.3em 0;"/></th>
                                        <th colspan="1"><input type="checkbox" name="selectAll" onchange="checkAll(this)"/>Select All</th>
                                    </tr>
                                    <tr>
                                        <th></th>
                                        <th>Service Name</th>
                                        <th>Per Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                              
                            </table>                                           
						</div>	     
                	</div>
                	
                	<div class="billFinals">
                		<div class="serviceCalculations">
                			<table class="responstable1">
                				<tr>
                					<td>Total</td>
                					<td><input type="text" name="servicesTotalPrice" readonly="readonly" id="servicesTotalPrice" value="${0 }"/>
                					
                					</td>
                				</tr>
                				<tr>
                					<td>Previous Balance </td>
                					<td><input type="text" name="previousbalance" id="previousbalance" readonly="readonly" value=<%=prevBal%> /> </td>
                				</tr>
                				<tr>
                					<td>Discount</td>
                					<td><input type="text" name="Discount" required id="totalDiscount" value="0" onclick="flushdata()" onkeyup="calculatePayable(this.value)" onfocus="this.value=''" onblur="if(this.value=='')this.value='0'"/>Rs.</td>
                				</tr>
                				<tr>
                					<td>Total Payable</td>
                					<td><input type="text" name="totalPayable" id="totalPayable" readonly="readonly"/></td>
                				</tr>
                				<tr>
                					<td>Amount Paid</td>
                					<td><input type="number" required name="amountPaid" id="amountPaid" onkeyup="calculateAmountBalance(this.value);"/></td>                				
                				</tr>
                				<tr>
                					<td>Amount Balance</td>
                					<td><input type="number" name="amountBalance" id="amountBalance" readonly="readonly"/></td>                				
                				</tr>
                				<tr>
                					<td>Next Follow-Up Date: </td>
                					<td><input type="text" id="combined-picker3" readonly="readonly" name="followupdate" />
                					<input type="hidden" name="billId" value="${param.billId }" /></td>
                				</tr>
                				<tr>
                					<td colspan="2"><input type="submit" value="GENERATE BILL" class="btn_look" style="float:none;background-color:#38546B;width:96%;padding:0.5em 0;"/></td>
                				</tr>
                			</table>                			
                		</div>                		
                	</div>
	    	</div>
	    </form>
	    <script type="text/javascript">
	    calculatePayable(document.getElementById('totalDiscount').value);
		</script>
</body>
</html>