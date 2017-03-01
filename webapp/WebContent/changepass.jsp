<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Omkar Khalane Hospital</title>
<link rel="stylesheet" type="text/css" href="loginPage/css/style.css" />

<script type="text/javascript">

function validation(){
	
	var newpass1=document.getElementById("newpass1").value;
	var newpass2=document.getElementById("newpass2").value;
	
	if( newpass1=="" && newpass2==""){
		alert('Please Enter All Fields');
		return false;
	}else if(newpass1==""){
		alert('Please Enter New Password ');
		return false;		
	}else if(newpass2==""){
		alert('Please Re-Enter Password ');
		return false;		
	}else if(!(newpass1==newpass2)){
		alert('New password and Re-Enter password not match ');
		return false;		
	}else{
		
		return true;
	}
}
</script>


</head>
<body>
<%
String id = request.getParameter("id1").trim();
HttpSession ss=request.getSession();


if(ss.getAttribute("key")==null){
	utilities.CommonUtilities.returnToLogin(response);
}else{
	if(ss.getAttribute("key").equals(id)){
		%>
		<div class="loginpage">
		<div class="loginlogo"></div>
		<div class="logininfo">
			<form action="ChangePass" method="post">
				
				<input  name="Username" id="username" value="<%=request.getParameter("username") %>" type="hidden" />
				<label class="username">New Password</label><br/>
				<input class="text" name="NewPassword1" id="newpass1" type="password" /><br /><br />
				<label class="username">Reenter New Password</label><br/>
				<input class="text" name="NewPassword2" id="newpass2" type="password" /><br /><br />
				<input class="login" name="Login" onclick="return validation()" type="submit" value="SUBMIT"/><br /><br />
			</form>
		</div>
	</div>
	
	<%
	}else{
		
		utilities.CommonUtilities.returnToLogin(response);
		
	}

}
ss.removeAttribute("key");
%>


</body>
</html>