<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet Query - Login</title>
    <!-- fontswesome cdn link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="test.css">
    
</head>
<body>
	<!-- header section starts -->
  		<jsp:include page="header.jsp"/>
	<!-- header section ends -->
	<div class="container">
	    <div class="wrapper">
	        <!-- Form begins -->
	        <form action="Login" method="post">
	            <h1>Login</h1>
	            <!-- Username input -->
	            <div class="input-box">
	                <input type="text" name="userID" placeholder="Username" required>
	                <i class='bx bxs-user'></i>
	            </div>
	            <!-- Password input -->
	            <div class="input-box">
	                <input type="password" name="password" placeholder="Password" required>
	                <i class='bx bxs-lock-alt'></i>
	            </div>
	            <!-- Remember Me and Forgot Password -->
	            <div class="remember-forgot">
	                <label><input type="checkbox"> Remember me</label>
	                <a href="#">Forgot password?</a>
	            </div>
	            <!-- Login button -->
	            <button type="submit" class="btn">Login</button>
	            <!-- Register link -->
	            <div class="register-link">
	                <p>Don't have an account? 
	                   <a href="http://localhost:8080/CS157A-team8/userRegister.jsp">Register</a>
	                </p>
	            </div>
	        </form>
	    </div>
	</div>
</body>
</html>
