<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="SignUpStyles.css">
<meta charset="UTF-8">
<title>Sign Up</title>
</head>
<body>

<div class="form">
		
    <h2 align="center" class="header">Provide the details below to sign up.</h2>
    	
   <form action="SignUpServleet" method="post">
   	 	
   	 	<div class="email">
   	 		<label>Email</label>
   	 	</div>
     	 	<input type="email" name="email" class="user1" placeholder="Email">	
    	
    	<div class="name">
   	 		<label>Name</label>
   	 	</div>
     	 	<input type="text" name="name" class="user2" placeholder="Name">	
     	
     	<div class="role">
   	 		<label>Role</label>
   	 	</div>
     	 	<input type="text" name="role" class="user3" placeholder="Dentist or Secretary">
     	 	
     	<div class="user">
   	 		<label>Username</label>
   	 	</div>
     	 	<input type="text" name="uname" class="user4" placeholder="Username">	
    	
    	<div class="password">
   	 		<label>Password</label>
   	 	</div>
     	 	<input type="password" name="upwd" class="user5" placeholder="Password">
     	 	
     	<div class="submit">
    		<input type="submit" value="Sign Up">
    	</div>		
    	
    

</form>
</div>

</body>
</html>