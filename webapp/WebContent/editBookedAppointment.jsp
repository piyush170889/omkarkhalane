<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Required JS -->
    <script src="js/jquery.min.js"></script>
    <!-- /Required JS -->
    
    <!-- Tabs -->
    <link rel="stylesheet" type="text/css" href="css/demo.css" />
	<link rel="stylesheet" type="text/css" href="css/component.css" />		
    <!-- /Tabs -->
    
    <!-- Bootstrap Files -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/bootstrap.min.js"></script>
    <!-- /Bootstrap Files -->
        
    <!-- Custom Stylesheet -->
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <!-- /Custom Stylesheet -->
    
    <!-- Font Awesome -->
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
    <!-- /Font Awesome -->    
    
    <!-- datepicker -->
    <link rel="stylesheet" type="text/css" href="css/jquery-ui.css" />
    <link  rel="stylesheet" type="text/css" href="css/jquery-ui_themes_smoothness.css" />
    
    <script type="text/javascript" src="js/jquery-ui.js"></script>
    <script type="text/javascript" src="js/datepicker.js"></script>

    <script type="text/javascript">
        initializeDatePicker();
    </script>
    <!-- /datepicker -->
    
</head>
<body>
	<!-- header -->
    <div class="omk_header">
    	<div class="userinfo">
            <div class="userpic">
                <i class="fa fa-user"></i>
            </div>            
            <p>administrator</p>
        </div>    
    </div>    
    <!-- /header -->
    
    <!-- Menu -->
    <jsp:include page="menu.jsp"></jsp:include>
    <!-- Menu --> 
    
    <!-- Tabs -->
    <div id="tabs" class="tabs">
				<nav>
					<ul>
						<li><a href="#section-1"><span>Book Appointment</span></a></li>
						<li><a href="#section-2"><span>Register Patients</span></a></li>
						<li><a href="#section-3"><span>Follow-Up Patients</span></a></li>
					</ul>
				</nav>
				<div class="content">
					<section id="section-1">
						<div class="mediabox">
							<div class="info">
                            	<p>
                                	<i class="fa fa-thumbs-up"></i>
                                    <span><ba:getTotalTodaysBookingCount /> Appointments Booked</span>
                                    <i class="fa fa-check"></i>
                                    <span><ba:getTodaysRegisteredAppointmentCount /> Appointments Registered</span>
                                    <i class="fa fa-warning"></i>
                                    <span><ba:getTodaysNotRegisteredAppointmentCount /> Appointments Not Registered</span>                                    
                                    <i class="fa fa-stop"></i>
                                    <span><ba:getTodaysCancelledCount /> Appointment Cancelled</span>                                    
                                </p>
                            </div>
							
							<!-- Book New Appointment -->
							<div id="small-dialog" class="mfp-hide">
							<div class="bookappointment">
                            <form name="bookappointmentform" action="BookAppointment" method="post">
                            	<fieldset>
                                <legend><label>Book An Appointment</label></legend>
                                <p>                                	
                                    <table cellspacing="20" cellpadding="10" class="book_appointment_table">
                                    	<tr>
                                        	<td><label>Booking Id:</label></td>
                                            <td><input type="text" name="bookingid" value="<ba:getBookingId/>" readonly="true"/></td>
                                        </tr>
                                    	<tr>
                                        	<td><label>Name:</label></td>
                                            <td><input type="text" name="patient_name" required placeholder="Enter Name Here" autocomplete="off"/></td>
                                        </tr>
                                    	<tr>
                                        	<td><label>Contact No:</label></td>
                                            <td><input type="text" name="patient_contact_no" required placeholder="Enter Contact No.  Here" autocomplete="off"/></td>
                                        </tr>
                                    	<tr>
                                        	<td><label>Appointment for:</label></td>
                                            <td>
                                            	
                                                <select name="appointment_type" id="edit_opd_appointment_for">
          											<ba:getDepartmentList/>
          										</select>
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td><label>Date of Appointment:</label></td>
                                            <td><input type="text" name="date_of_appointment" id="datepicker1" style="width:60%;float:left;margin:1em 0 0.5em 2em;" readonly/></td>
                                        </tr>
										<tr>
                                        	<td colspan="2"><input type="submit" value="BOOK" /></td>
                                        </tr>	
                                    </table>
                                </p>
                                </fieldset>
                            </form>                                                            
                            </div>
                            </div>
                            <!-- /Book New Appointment -->
                            
                            <!-- Todays Booking Info -->
                            <div class="book_appointment_table">
                            	<table class="bookinginfotable" border="2" id="bookAppointmentTable">
                                	<thead>
                                    	<tr>
                                    		<th colspan="3">
                                    			<a href="#small-dialog" class="popup-with-zoom-anim"><i class="fa fa-plus"></i>Book Appointment</a>
                                    		</th>
                                        	<th colspan="4">
                                            	<a href="#" class="btn_look"> Advance Search </a>
                                            </th>
                                        </tr>
                                    	<tr>
                                            <th>Booking ID</th>
                                            <th>Name</th>
                                            <th>Contact No.</th>
                                            <th>Appointment Type</th>
                                            <th>Date Of Appointment</th>
                                            <th>Status</th>
                                            <th>Actions</th>
                                        </tr>    
                                    </thead>
                                    <tbody>
                                    		<ba:getTodaysBookedAppointmentDetails />
                                    </tbody>
                                    <tfoot>
                                    	<tr>
	                                    	<td colspan="5">
	                                        	<a href="#">Email This List</a>
	                                        </td>
	                                        <td colspan="2">
	                                        	<label>EXPORT</label>
	                                                <select name="export_to" style="float:none;width:30%">
														<option value="pdf">PDF</option>		                                                    <option value="doc">DOC</option>
	                                                    <option value="xls">XLS</option>
	                                                </select>
	                                        </td>
	                                    </tr>    
                                    </tfoot>
                                </table>
                            </div>
                            <!-- Todays Booking Info -->
                            
						</div>
					</section>
					<section id="section-2">
						<div class="mediabox">
                        	<div class="info">
                            	<p>
                                	<i class="fa fa-thumbs-up"></i>
                                    <span>23 New Appointments</span>
                                    <i class="fa fa-check"></i>
                                    <span>11 Appointments Attended</span>
                                    <i class="fa fa-warning"></i>
                                    <span>11 Appointments Not Attended</span>                                    
                                    <i class="fa fa-stop"></i>
                                    <span>1 Appointment Cancelled</span>                                    
                                </p>
                            </div> 
						</div>
					</section>
					<section id="section-3">
						<div class="mediabox">
                        	 <div class="info">
                            	<p>
                                	<i class="fa fa-thumbs-up"></i>
                                    <span>23 Follow-Up Appointments</span>
                                    <i class="fa fa-check"></i>
                                    <span>11 Appointments Attended</span>
                                    <i class="fa fa-warning"></i>
                                    <span>11 Appointments Not Attended</span>                                    
                                    <i class="fa fa-stop"></i>
                                    <span>1 Appointment Cancelled</span>                                    
                                </p>
                            </div>
						</div>
					</section>
					<!--<section id="section-4">
						<div class="mediabox">
                        
						</div>
					</section>
					<section id="section-5">
						<div class="mediabox">
						
						</div>
					</section>-->
				</div><!-- /content -->
			</div><!-- /tabs -->    
    <!-- /tabs -->   
    <!-- Required JS for tabs -->
    <script src="js/cbpFWTabs.js"></script>
		<script>
			new CBPFWTabs( document.getElementById( 'tabs' ) );
		</script>
    <!-- /Required JS for tabs -->        

</body>
</html>