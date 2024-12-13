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
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">
		
    <link rel="stylesheet" href="style.css">
</head>
<script type="text/javascript">

	window.onload = function (){
		<% 
		if (session.getAttribute("userName") != null){
            response.sendRedirect("petQueryHome.jsp");  // Redirect to the landing page
        } 
        %>	

	}
	
</script>
<body>
	<!-- header section starts -->
   
    	<jsp:include page="header.jsp"/>

	<!-- header section ends -->

	
	<div class="container">
	    <div class="wrapper">

	        <!-- Form begins -->
	        <form action="Login" method="post">
	            <h1>Login</h1>
	            
	            <div role="alert">
					${alert}
				</div>
	            
				
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
<!-- 	            <div class="remember-forgot">
	                <label><input type="checkbox"> Remember me</label>
	                <a href="#">Forgot password?</a>
	            </div> -->
	            <!-- Login button -->
	            <button type="submit" class="btn">Login</button>
	            <!-- Register link -->
	            <div class="register-link">
	                <p>Don't have an account? 
	                   <a href="userRegister.jsp">Register</a>
	                </p>
	            </div>
	        </form>
	    </div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
		crossorigin="anonymous">
	</script>
	
</body>
</html>
