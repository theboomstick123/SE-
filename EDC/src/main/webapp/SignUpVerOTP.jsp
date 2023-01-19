<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
</head>
<body>
	<h2 align="center">Pre-exisiting admin credentials verified, please type </h2>
	<h2 align="center">the OTP that has been send to pre-existing email to start signing up a new user.</h2>
	<form action="SignUpVerOTP" method="post">
   	 <table align="center">
	
    <tr><td>OTP</td><td><input type="text" name="OTP" placeholder="123456"></td></tr>
    <tr><td><input type="submit" value="Verify"></td></tr>
</body>
</html>