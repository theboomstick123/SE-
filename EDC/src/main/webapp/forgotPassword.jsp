<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="forgotPasswordStyle.css">
<meta charset="UTF-8">
<title>Forgot Password</title>
<script>
	function val(){
		var pass = document.getElementById("pass").value;
		var confpass = document.getElementById("confpass").value;
		
		if (pass != confpass){
			alert("Password not matching");
		}	
	}
</script>
</head>
<body>
	
<div class="page">
	
	<div class="header">
		<p>OTP verified, please type new password</p>
	</div>
	
	<form action="forgotPassword" method="post">
   	 
   	 <div class="newPass">
   	 		<label>New Password</label>
     	 	<input type="password" name="password" id="pass" class="p1">	
    	</div>
    	
    <div class="confPass">
   	 		<label>Confirm Password</label>
     	 	<input type="password" name="confPassword" id="confpass" class="p2">	
    	</div>
    	
    <div class="submit">
    		<input type="submit" value="Verify" onclick="val()">
    	</div>

</form> 
</div>

</body>
</html>