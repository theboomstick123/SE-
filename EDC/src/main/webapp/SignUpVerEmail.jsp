<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
</head>
<body>
	<h2 align="center">To sign up, verify the credentials of the pre-existing admin.</h2>
	
	<form action="SignUpVerEmail" method="post">
   	 <table align="center">
   	 
	<tr><a href="login.jsp">Back</a></tr>
	
    <tr><td>Email</td><td><input type="email" name="email" placeholder="Sample@mail.com"></td></tr>
    <tr><td><input type="submit" value="Verify"></td></tr>
   
	
</table>
</form>
</body>
</html>