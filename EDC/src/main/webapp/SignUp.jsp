<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
</head>
<body>

	<h2 align="center">Provide the details below to sign up.</h2>
	
	<form action="SignUpServleet" method="post">
   	 <table align="center">
   	 
	<tr><a href="login.jsp">Back</a></tr>
	
    <tr><td>Email</td><td><input type="email" name="email" placeholder="Email"></td></tr>
    <tr><td>Name</td><td><input type="text" name="name" placeholder="Name"></td></tr>
    <tr><td>Role</td><td><input type="text" name="role" placeholder="Secretary or Dentist"></td></tr>
    <%-- <td><input type="radio" name="secretary">Secretary</td>
    <td><input type="radio" name="dentist">Dentist</td></tr>--%>
    <tr><td>Username</td><td><input type="text" name="uname" placeholder="Username"></td></tr>
    <tr><td>Password</td><td><input type="password" name="upwd" placeholder="Password"></td></tr>
    <tr><td><input type="submit" value="Sign Up"></td></tr>
    
    
	
</table>
</form>
</body>
</html>