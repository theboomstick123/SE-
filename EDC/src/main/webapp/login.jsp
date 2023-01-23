<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="loginStyle.css">
<style>
    a { text-decoration: none; }
  </style>
<meta charset="UTF-8">
<title>Login</title>			
</head>
<body>
<% String msg = request.getParameter("msg");
if("wrong".equals(msg)){
%>
<p class="alert">Wrong Username or Password!</p>
<%} %>

<div class="form">

	<div class="icon">
	   	<img src="dental.png" style=" width:75px; height:70px;">
	</div>
	
	<div class="header2">
    	<p>Executive Dental Clinic</p>
    </div>
    
    <div class="header1">	
    	<p>PATIENT MANAGEMENT LOGIN</p>
	</div>
	
   <form action="LoginServlet" method="post">
   	 	
   	 	<div class="user">
   	 		<label>Username</label>
   	 	</div>
     	 	<input type="text" name="uname" id="uname" class="user1">	
    	
    	
    	<div class="password">
   	 		<label>Password</label>
   	 	</div>
     	 	<input type="password" name="upwd" id="upwd" class="password1">	
    	
    		
    	<div class="submit">
    		<input type="submit" value="Login" onclick="val()">
    	</div>
    
    	<div class=	"signUp">
    		<p>Create Admin Account? <a href="SignUpVerEmail.jsp">Sign Up</a></p>
    	</div>
    
    	<div class="forgotPass">
			<a href="ForgotPassVer.jsp">Forgot Password?</a>
		</div>

</form>
</div>
</body>
</html>
