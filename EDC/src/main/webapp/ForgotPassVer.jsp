<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="ForgotPassVerStyle.css">
<style>
    a { text-decoration: none; }
 </style>
<meta charset="UTF-8">
<title>Forgot Password</title>
</head>
<body>

<% String msg = request.getParameter("msg");
if("wrong".equals(msg)){
%>
<p class="alert">Email not found!</p>
<%} %>

<div class="page">
	<div class="back">
		<a href="login.jsp">Back to Login</a>
	</div>
		
    <div class="header">
	<p>Enter email to receive OTP.</p>
	</div>
	
	<form action="ForgotPassVerEmail" method="post">
   	 
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