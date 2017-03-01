<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="WEB-INF/bookAppointment.tld" prefix="ba"%>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OPD Bill</title>
<style type="text/css">
body{
font-family: Courier 9;
}
.billTable{
width: 80%;text-align: center;border: 1px solid #000;margin:5% 9%;border-collapse: collapse;float:left;padding: 0 0 1em 0;
}
.billTable td, th {
    border: 1px solid black;
}

</style>
</head>
<body>
		<div style="width:100%;float:left;heigh:auto;">
       		<img src="okmarhosplogo.jpg" style="width:100%;height:auto;" onload="javascript:window.print();self.location.href='dashboard.jsp?current=dashboard'" />
       	</div>
       	<div style="width:100%;float:left;height:auto;margin:1em 0;padding:0.5em 0;border-top:2px solid #CCC;border-bottom:2px solid #CCC;">
       	<table style="width:100%;font-weight:bold;border-bottom:2px solid #ccc;padding-bottom:0.7em;">
         	<tbody>
               	<tr>
                   	<td><label>OPD ID</label></td>
                    <td>: ${param.id }</td>
                    <td><label>Name</label></td><td>: ${param.name }</td>
               	</tr>
               	<tr> 
                    <td><label>Gender </label></td>
                	<td>: ${param.gender }</td>                           
                    <td><label>Contact No</label></td>
                    <td>: ${param.contact }</td>  
                   </tr>
               	<tr>	
               		<td><label>Date of Appointment</label></td>
                   	<td>: ${param.dateofappointment }</td>
                   	<td>Appointment For</td>
                	<td>: ${param.appointmentfor }</td>
                </tr>
                <tr> 
                    <td><label>Age</label></td>
                    <td>: ${param.age }</td>    
               		<td>Consulting Doctor</td>
                	<td> : ${param.consultingdoctor }</td> 
                </tr>
                <tr> 
                    <td><label>Billing Id</label></td>
                    <td>: ${param.billingId } &nbsp;&nbsp; <%= new SimpleDateFormat("dd-MM-yyyy").format(new Date()) %></td>    
               		<td>Reference Doctor</td>
                	<td> : ${param.referenceDoc }</td> 
                </tr>
    		</tbody>
       </table>
       
       <table class="billTable">
       		<thead>
       			<tr>
       				<th>Service Provided</th>
       				<th>Charge</th>
       				<th>Quantity</th>
       				<th>Total</th>
       			</tr>
       		</thead>
       		<tbody>
       			
       			<ba:getServiceDetailsById stid="<%= request.getParameter(\"stid\") %>"></ba:getServiceDetailsById>
       		</tbody>
       		<tfoot>
       			<tr>
       				<td>Total Payable</td><td colspan="3">${param.totalpayable }</td>
       			</tr>
       			<tr>	
       				<td>Discount</td><td colspan="3">${param.discount }</td>
       			<tr>	
       				<td>Previous Balance</td><td colspan="3">${param.prevbal }</td>
       			</tr>
       			<tr>	
       				<td>Total Amount(After Discount)</td><td colspan="3">${param.totalamount }</td>
       			</tr>
       			<tr>	
       				<td>Amount Paid</td><td colspan="3">${param.paid }</td>
       			</tr>
       			<tr>	
       				<td>Amount Balance</td><td colspan="3">${param.balance }</td>
       			<tr>	
       		</tfoot>
       </table>
       <h5 style="float:left;bottom:0;padding:0;margin:0;">Bill Prepared By: Omkar Khalane Hospital</h5>
       </div>
  <!-- <table style="width:100%;font-weight:bold;border-bottom:2px solid #ccc;padding-bottom:0.7em;">
  	<thead>
  		<tr>
  			<th>
  			Bill Prepared By:Omkar Khalane Hospital
 		 	</th>
 		 </tr>
 	</thead>
</table> -->
</body>
</html>