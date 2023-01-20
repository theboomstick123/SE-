<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>
</head>
<body>
	<h2 align="center">Enter email to receive OTP.</h2>
	
	<form action="ForgotPassVerEmail" method="post">
   	 <table align="center">
   	 
	<tr><a href="login.jsp">Back</a></tr>
	
    <tr><td>Email</td><td><input type="email" name="email" placeholder="Sample@mail.com"></td></tr>
    <tr><td><input type="submit" value="Verify"></td></tr>
</body>
</html>