<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>
</head>
<body>

	<h2 align="center">OTP verified, please type new password.</h2>
	
	<form action="forgotPassword" method="post">
   	<table align="center">
  
    <tr><td>New Password</td><td><input type="password" name="password" ></td></tr>
    <tr><td>Confirm Password</td><td><input type="password" name="confPassword"></td></tr>
    <tr><td><input type="submit" value="Done"></td></tr>
	
</table>
</form>
</body>
</html>