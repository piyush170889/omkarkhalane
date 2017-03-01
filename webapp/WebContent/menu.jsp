<%@page import="utilities.CommonUtilities"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <div class="logout"><a href="logout.jsp"><i class="fa fa-power-off"></i></a></div>
    <% 
    	String activeTab = request.getParameter("current");
    	String userType = null;
    	if(session != null){
    		userType = session.getAttribute("userType").toString();
    	}else{
    		response.sendRedirect("login.html");
    	}
    	if(userType.equals("SuperUser")){
    %>    
<div class="navigation">
 	<ul class="menu">
     	<li <% if(activeTab.equals("dashboard"))out.println("class=\"omk_active\""); %>><a href="dashboard.jsp?current=dashboard">Appointment Management</a></li>
     	<li <% if(activeTab.equals("PatientManagement"))out.println("class=\"omk_active\""); %>><a href="PatientManagement.jsp?current=PatientManagement">Patient management</a></li>            
     	<li <% if(activeTab.equals("Master"))out.println("class=\"omk_active\""); %>><a href="Master.jsp?current=Master">Master</a></li>
     	<li <% if(activeTab.equals("Reports"))out.println("class=\"omk_active\""); %>><a href="Reports.jsp?current=Reports">Reports</a></li>                      
     </ul>
 </div>
 <%
    	}else{
 %>
 <div class="navigation">
 	<ul class="menu">
     	<li <% if(activeTab.equals("dashboard"))out.println("class=\"omk_active\""); %>><a href="dashboard.jsp?current=dashboard">Appointment Management</a></li>
     	<li <% if(activeTab.equals("PatientManagement.jsp"))out.println("class=\"omk_active\""); %>><a href="PatientManagement.jsp?current=PatientManagement">Patient management</a></li>            
     </ul>
 </div>
 <%
 }
 %>