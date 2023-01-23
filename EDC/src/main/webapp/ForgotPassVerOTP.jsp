<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="ForgotPassVerOTPStyles.css">
<meta charset="UTF-8">
<title>Forgot Password</title>
</head>
<body>
    
<div class="page">
	    
    <div class="header1">
		<p>The OTP that has been sent to your email.</p>
	</div>
	
	<div class="header2">
		<p>You only have 3 minutes until the OTP expires.</p>
	</div>
	
	<form action="ForgotPassVerOTP" method="post">
   	 
   	 <div class="otp1">
   	 		<label>Enter OTP here</label>
   	 	</div>
     	 	<input type="text" name="OTP" placeholder="123456" class="otp2">	
    	
    	
    <div class="submit">
    		<input type="submit" value="Verify">
    	</div>

</form> 
</div>
</body>
</html>