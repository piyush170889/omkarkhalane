<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Medical Certificate</title>
<style type="text/css">
body{
font-family: Courier 9;
}
.billTable{
width: 100%;text-align: left;margin:1% 0;border-collapse: collapse;float:left;padding: 0 0 1em 0;font-size:18px;
}
.billTable td, th {
    border: none;
}
</style>
</head>
<body>
		<div style="width:100%;float:left;heigh:auto;">
       		<img src="okmarhosplogo.jpg" style="width:100%;height:auto;" onload="javascript:window.print();self.location.href='dashboard.jsp?current=dashboard';" />
       	</div>
       	<div style="width:100%;float:left;height:auto;margin:1em 0;padding:0.5em 0;border-top:2px solid #CCC;border-bottom:2px solid #CCC;">
       	
                   	<h2 style="text-align:center; border-bottom:2px solid #ccc;">Medical Certificate</h2>
               
       	<table style="width:100%;font-weight:bold;border-bottom:2px solid #ccc;padding-bottom:0.7em;">
         	<tbody>
               	<tr>
                   	<td><label>Name</label></td>
                    <td>: ${param.Pname }</td>
                    <td><label>Age</label></td><td>: ${param.age }</td>
                    <td><label>Sex</label></td><td>${param.patient_gender }</td>
               	</tr>
               	<tr> 
                    <td><label>Contact </label></td>
                	<td>: ${param.contact }</td>                           
                    <td><label>Address</label></td>
                    <td colspan="3">: ${param.patient_address }</td>  
                </tr>
               	<tr>	
               		<td><label>Date of Issue</label></td>
                   	<td><%= new SimpleDateFormat("dd-MM-yyyy").format(new Date()) %></td>
                   	<td><label>Name Of Doctor</label></td>
                   	<td>: ${param.doctor }</td>
                </tr>
                <tr>
                	<td>Doctor Qualification</td>
                	<td>: ${param.Qualification }</td>
                	<td> Registration No.</td>
                	<td>: ${param.regno }</td>
                </tr>
    		</tbody>
       </table>
       
       <table class="billTable">
			<tbody>
       			<tr>
       				<td>
       					This is to certify that I have examined above mentioned patient today. He is suffering from ${param.suffering }
       				</td>
       			</tr>
       				<%
       					String[] illness = request.getParameterValues("illness");
       					for(int i=0;i<illness.length; i++){
       						if(illness[i].equals("1")){
       							%>
       							<tr>
	       							<td>
	       								He is advised rest from ${param.D1 } to ${param.D2 }  
	       							</td>
	       						</tr>	       							
       						<% }else if(illness[i].equals("2")){%>
	       						<tr>	
	       							<td>
	       								He is Unfit to join Duty in this period.
	       							</td>
	       						</tr>	
       						<% }else if(illness[i].equals("3")){%>
       							<tr>	
	       							<td>
	       								He is Fit to join duty from  ${param.D3 }
	       							</td>
	       						</tr>
       						<%} %>
       					<%} %>
       		</tbody>	
     	</table>
     	
     	<table class="billTable">
     		<tbody>
     			<tr>
     				<td><br/><br/><br/><br/>Hospital Seal</td>
     				<td><br/><br/><br/><br/>Signature</td>
     			</tr>
     		</tbody>
     	</table>
     </div>	
</body>
</html>