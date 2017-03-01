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
	var oldpassword=document.getElementById("oldpassword").value;
	var newpass1=document.getElementById("newpass1").value;
	var newpass2=document.getElementById("newpass2").value;
	
	if(username=="" && oldpassword=="" && newpass1=="" && newpass2==""){
		alert('Please Enter All Fields');
		return false;
	}else if(username==""){
		alert('Please Enter Username ');
		return false;		
	}else if(oldpassword==""){
		alert('Please Enter Old Password ');
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
<div class="loginpage">
	<div class="loginlogo"></div>
	<div class="logininfo">
		<form action="ChangePassword" method="post">
			<label class="username">Username</label><br />
			<input class="text" name="Username" id="username" type="text" /><br /><br />
			<label class="username">Old Password</label><br />
			<input class="text" name="OldPassword" id="oldpassword" type="password" /><br /><br/>
			<label class="username">New Password</label><br/>
			<input class="text" name="NewPassword1" id="newpass1" type="password" /><br /><br />
			<label class="username">Reenter New Password</label><br/>
			<input class="text" name="NewPassword2" id="newpass2" type="password" /><br /><br />
			<input class="login" name="Login" onclick="return validation()" type="submit" value="SUBMIT"/><br /><br />
		</form>
	</div>
</div>
</body>
</html>