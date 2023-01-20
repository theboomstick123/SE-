<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>
</head>
<body>

	<h2 align="center">the OTP that has been send to your email</h2>
	<form action="ForgotPassVerOTP" method="post">
   	 <table align="center">
	
    <tr><td>OTP</td><td><input type="text" name="OTP" placeholder="123456"></td></tr>
    <tr><td><input type="submit" value="Verify"></td></tr>
</body>
</html>