<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="WEB-INF/bookAppointment.tld" prefix="ba"%>  
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Omkar Khalane Hospital <%=new SimpleDateFormat("dd-MM-yyyy").format(new Date()) %></title>
	<!-- Required JS -->
    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <!-- /Required JS -->
    
    <!-- Tabs -->
    <link rel="stylesheet" type="text/css" href="css/demo.css" />
	<link rel="stylesheet" type="text/css" href="css/component.css" />		
    <!--[if IE]>
  		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
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
	
	<link rel="stylesheet" type="text/css" href="css/buttons.dataTables.css">
	<link rel="stylesheet" type="text/css" href="css/shCore.css">
	<style type="text/css" class="init"></style>
	
	<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
	
	<script type="text/javascript" language="javascript" src="js/dataTables.buttons.js"></script>
	<script type="text/javascript" language="javascript" src="js/jszip.js"></script>
	<script type="text/javascript" language="javascript" src="js/pdfmake.js"></script>
	<script type="text/javascript" language="javascript" src="js/vfs_fonts.js"></script>
	<script type="text/javascript" language="javascript" src="js/buttons.html5.js"></script>
	<script type="text/javascript" language="javascript" src="js/shCore.js"></script>
	<script type="text/javascript" language="javascript" class="init"></script>
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
		$('#ServicesTable').dataTable();
	 	$('#ConsultingDoctorTable').dataTable();
	 	$('#RefernceDoctorTable').dataTable();
		$('#IPDdetailsTable').dataTable({
			dom: 'Bfrtip',
			/* columns: [
		                { "data": "Name" },
		                { "data": "Surgeon" },
		                { "data": "Subtotal" },
		                { "data": "Advance Paid" },
		                { "data": "Payable Bill" },
		                { "data": "Paid Bill" },
		                { "data": "Bill Balance" }
	 					], */
			buttons: [
				'copyHtml5',
				'excelHtml5',
				'csvHtml5',
				'pdfHtml5'
			]
		});	 
	 	$('#OPDdetailsTable').DataTable({
			dom: 'Bfrtip',
			/* columns: [
		                { "data": "Name" },
		                { "data": "Consulting Doctor" },
		                { "data": "Reference Doctor" },
		                { "data": "Services" },
		                { "data": "Total bill" },
		                { "data": "Paid bill" },
		                { "data": "Bill Balance" }
	 					], */
			buttons: [
				'copyHtml5',
				'excelHtml5',
				'csvHtml5',
				'pdfHtml5'
			]
		} );
	 	
	 	
	 				
	});
	</script>
    <!-- /Intialize Scripts on page load -->
    
    
    <script type="text/javascript">
    function displayForm(){
		var selectedOption = document.getElementById("masterSelect").options[document.getElementById("masterSelect").selectedIndex].text;
		if(selectedOption == "Services Wise Report"){
			document.getElementById("masterSpace").innerHTML = document.getElementById("servicereport").innerHTML;	
		}else if(selectedOption == "Consulting Doctor Wise Reports"){
			document.getElementById("masterSpace").innerHTML = document.getElementById("consultingdoctor").innerHTML ;
		}else if(selectedOption == "Reference Doctor Wise Reports"){
			document.getElementById("masterSpace").innerHTML = document.getElementById("referencedoctor").innerHTML ;
		}else if(selectedOption == "Billing Reports"){
			document.getElementById("masterSpace").innerHTML = document.getElementById("billingreport").innerHTML ;
		}else if(selectedOption == "--Select--"){
			document.getElementById("masterSpace").innerHTML = "";
		}	
		initializeCombinedPicker();
	}
    
    function displayViewForm(){
    	var selectedOption = document.getElementById("viewMasterSelect").options[document.getElementById("viewMasterSelect").selectedIndex].text;
    	if(selectedOption == "View Doctors"){
			document.getElementById("viewmasterSpace").innerHTML = document.getElementById("viewDoctorsdiv").innerHTML;	
		}else if(selectedOption == "View Receptions"){
			document.getElementById("viewmasterSpace").innerHTML = document.getElementById("viewReceptiondiv").innerHTML ;
		}else if(selectedOption == "View Services"){
			document.getElementById("viewmasterSpace").innerHTML = document.getElementById("viewServicesdiv").innerHTML ;
		}else if(selectedOption == "--Select--"){
			document.getElementById("viewmasterSpace").innerHTML = "";
		}	
		initializeCombinedPicker();
    }
    
    function sendServiceVal(serviceId, serviceName, servicePrice){
    	document.getElementById("serviceId").value = serviceId;
    	document.getElementById("serviceName").value = serviceName;
    	document.getElementById("servicePrice").value = servicePrice;
    }
    
    function APSearch() {
 		var date1=document.getElementById("combined-picker9").value;
 		var date2=document.getElementById("combined-picker10").value;
 		var select=document.getElementById("selectreport").options[document.getElementById("selectreport").selectedIndex].text;
 		if((date1=="") && (date2=="")){
 			alert('please Fill Fileds');
 			return false;
 		}
 		else if(date1==""){
 			alert('please Fill Both Fileds');
 			return false;
 		}else if(date2==""){
 			alert('please Fill Both Fileds');
 			return false;
 		}else if(select == "--Select--"){
 			alert('please Select Report Type');
 			return false;
		}else if(date1>=date2){
 			alert('Wrong Date Range Selected');
 			return false;
		}else{
 			return true;
 		}
	} 
	</script>
	
</head>
<body>
   <!-- Menu -->
    <jsp:include page="menu.jsp"></jsp:include>
    <!-- Menu --> 
    
    <!-- Select Add Master Type Details -->
		<div class="advanceSearch" style="margin:2em 0 0 7em;border-radius:0;">
    	<h4><i class="fa fa-file"></i>Reports Details</h4>
    		<form action="Reports.jsp" method="get">
    		<table cellspacing="5" cellpadding="10" class="book_appointment_table">
               <tr>
               		<td>Select Report: </td>
               		<td>
               			<select  name="selectreport" id="selectreport">
               				<option>--Select--</option>
               				<option>Services Wise Report</option>
               				<option>Consulting Doctor Wise Reports</option>
               				<option>Refernce Doctor Wise Reports</option>
               			</select>
               			<input type="hidden" name="current" value="Reports">
               		</td>
               		
               </tr>
               <tr>
	    			<td>Date Range: </td>
	    			<td><input type="text" name="startDate" id="combined-picker9" style="width:70%;"/><label style="margin-left:1.4em;">TO</label></td><td><input type="text" name="endDate" id="combined-picker10" style="width:70%;"/><input type="hidden" name="advanceSearch" value="advanceSearch"/></td>
	    	   </tr>
	    	   <tr>
               		<td colspan="4"><input type="hidden" name="advanceSearch" value="advanceSearch"/><input type="submit" onclick="return APSearch()" value="Report" style="font-family: Candara;margin: 0 1em 0 40em;color: #FFFFFF;background-color: #337ab7;padding: 0.2em 1.4em 0.3em;border-radius: 3px;border: 1px solid #337ab7;"/></td>
               </tr>
           </table> 
           </form>
        </div>  	
    <!-- /Select Add Master Type Details -->
    <!-- chack select -->
   <%
   
   		String startdt = request.getParameter("startDate");
		String enddt = request.getParameter("endDate");
    	if(request.getParameter("selectreport") != null && request.getParameter("selectreport").equals("Services Wise Report")){
 		
    %>   	
    <div class="appointment_info">
    	<h5> Services Wise Report: <%= request.getParameter("startDate") %> To <%= request.getParameter("endDate") %></h5>
    </div>
    
    <div class="book_appointment_table">
      	<table class="responstable" border="2" id="ServicesTable">
              		<ba:servicereport startDate="<%= startdt %>" endDate="<%= enddt %>"  />
              
        </table>
    </div>
                            
    <%
    	}else if(request.getParameter("selectreport") != null && request.getParameter("selectreport").equals("Consulting Doctor Wise Reports")){
    %>
    <div class="appointment_info">
    	<h5> Consulting Doctor Wise Report: <%= request.getParameter("startDate") %> To <%= request.getParameter("endDate") %></h5>
    </div>
    
    <div class="book_appointment_table">
      	<table class="responstable" border="2" id="ConsultingDoctorTable">
              		<ba:consultingdoctorreport startDate="<%= startdt %>" endDate="<%= enddt %>" />
              
        </table>
    </div>
    
      <%
    	}else if(request.getParameter("selectreport") != null && request.getParameter("selectreport").equals("Refernce Doctor Wise Reports")){
     %>
    	    <div class="appointment_info">
    	    	<h5> Refernce Doctor Wise Reports: <%= request.getParameter("startDate") %> To <%= request.getParameter("endDate") %></h5>
    	    </div>
    	    
    	    <div class="book_appointment_table">
    	      	<table class="responstable" border="2" id="RefernceDoctorTable">
    	              		<ba:referencedoctorreport startDate="<%= startdt %>" endDate="<%= enddt %>" />
    	              
    	        </table>
    	    </div>
    	    
     <%
    	}else{
       %>
            <!-- Appointment Information -->
            <div class="appointment_info">
            	<h5>Todays Collection Information</h5>
            </div>
            <!-- /Appointment Information -->
            <!-- Tabs -->
            <div id="tabs" class="tabs" style="float:left;">
        				<nav>
        					<ul>
        						<li style="width:50%"><a href="#section-1"><span>OPD</span></a></li>
        						<li style="width:50%"><a href="#section-2"><span>IPD</span></a></li>
        					</ul>
        				</nav>
        				<div class="content">
        					<section id="section-1">
        						<div class="mediabox">
        							<!-- OPD Info -->
                                    <div class="book_appointment_table">
                                    	<table class="responstable" border="2" id="OPDdetailsTable">                                    	
                                        	<thead>                                    	
                                            	<tr>
                                                    <th>Name</th>
                                                    <th>Consulting Doctor</th>
                                                    <th>Reference Doctor</th>
                                                    <th>Services</th>
                                                    <th>Total bill</th>
                                                    <th>Paid bill</th>
                                                    <th>Bill Balance</th>
                                                </tr>    
                                            </thead>
                                            <tbody>
                                            	 <ba:getOPDPatientReport/> 
                                            </tbody></table>
                                    </div>
                                    <!-- IPD Info -->
                                    
        						</div>
        					</section>
        					<section id="section-2">
        						 <!-- IPD Info -->
                                    <div class="book_appointment_table">
                                    	<table class="responstable" border="2" id="IPDdetailsTable">
                                        	<thead>                                    	
                                            	<tr>
        											<th>Name</th>
                                                    <th>Surgeon</th>
                                                    <th>Subtotal</th>
                                                    <th>Advance Paid</th>
                                                    <th>Payable Bill</th>
                                                    <th>Paid Bill</th>
                                                    <th>Bill Balance</th>
                                                </tr>    
                                            </thead>
                                            <tbody>
                                            	 <ba:getIPDPatientReport/> 
                                            </tbody>
       									
                                        </table>
                                    </div>
                                    <!-- Todays OPD Info -->
        					</section>
        					</div>
        					</div>
        	 <!-- /tabs -->   
            <!-- Required JS for tabs -->
            <script src="js/cbpFWTabs.js"></script>
        		<script>
        			new CBPFWTabs( document.getElementById( 'tabs' ) );
        		</script>
            <!-- /Required JS for tabs -->  
        				<%} %>	
         
    <!-- /chack select -->
    
   
    	           
    	
</body>
</html>
</body>
</html>