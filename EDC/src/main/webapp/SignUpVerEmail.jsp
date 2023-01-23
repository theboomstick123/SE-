<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="SignUpVerEmailStyle.css">
<meta charset="UTF-8">
<title>Sign Up</title>
</head>
<body>

<div class="page">
	<div class="back">
		<a href="login.jsp">Back to Login</a>
	</div>
	
	<div class="header">
	<p>To sign up, verify the credentials of the pre-existing admin.</p>
	</div>
	
	<form action="SignUpVerEmail" method="post">
   	 
   	 <div class="email1">
   	 		<label>Email</label>
   	 	</div>
     	 	<input type="email" name="email" placeholder="Sample@gmail.com" class="email2">	
    	
    	
    <div class="submit">
    		<input type="submit" value="Verify">
    	</div>

</form> 
</div>
</body>
</html>