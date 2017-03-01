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
	var username=document.getElementById("username").value;
	if(username==""){
		alert('Please Enter Username ');
		return false;		
	}else{
		return true;
	}
}
</script>


</head>
<body>
<div class="loginpage">
	<div class="loginlogo"></div>
	<div class="logininfo">
		<form action="EmailSendingServlet" method="post">
			<label class="username">Enter Username:</label><br />
			<input class="text" name="Username" id="username" type="text" /><br /><br />
			
			<input class="login" name="Login" onclick="return validation()" type="submit" value="SUBMIT"/><br /><br />
		</form>
	</div>
</div>

</body>
</html>