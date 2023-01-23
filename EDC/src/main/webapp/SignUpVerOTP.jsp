<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="SignUpVerOTPStyle.css">
<meta charset="UTF-8">
<title>Sign Up</title>
</head>
<body>
<div class="page">
	
	<div class="header1">
		<p>The OTP that has been sent to pre-existing Admin email.</p>
	</div>
	
	<div class="header2">
		<p>You only have 3 minutes until the OTP expires.</p>
	</div>
	
	<form action="SignUpVerOTP" method="post">
   	 
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