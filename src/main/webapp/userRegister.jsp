<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> --%>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<!-- <meta charset="ISO-8859-1"> -->
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<title>Pet Query - Registration</title>
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
	    <!-- fontswesome cdn link -->
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	    <link rel="stylesheet" href="style.css">
	</head>
	<body>
		<!-- header section starts -->
   		<jsp:include page="header.jsp"/>
		<!-- header section ends -->
	  	
	  	
	  	
	  	<div class="container">
	  		<div class="content">
		  		<div class="login-container">
			  		<div class="header-title">Pet Query</div>
		        	<div class="header-subtitle">Register</div>
		        		${alert}
<!-- 					    <form action="Register" method="post">
							<table>
							  <tr>
							    <td><input type="text" name="userID" placeholder="Username" required></td>
							  </tr>
							  <tr>
							    <td><input type="email" name="userEmail" placeholder="Email" required></td>
							  </tr>
							  <tr>
							    <td><input type="text" name="userName" placeholder="Name" required></td>
							  </tr>
							  <tr>
							    <td><input type="password" id="password" name="password" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required></td>
							  </tr>
							  <tr>
							    <td><input type="password" name="repeatPassword" id="repeatPassword" placeholder="Repeat Your Password" required></td>
							  </tr>
							  <tr>
							    <td><input type="submit" value="Register"></td>
							  </tr>
							</table>
							
					    </form> -->
						<form action="Register" method="post">
							<div class="mb-3">
								<label for="userID" class="form-label">Username</label>
								<input type="text" class="form-control" id="userID" name="userID" placeholder="Enter your username" required>
							</div>
							<div class="mb-3">
								<label for="userEmail" class="form-label">Email</label>
								<input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="Enter your email" required>
							</div>
							<div class="mb-3">
								<label for="userName" class="form-label">Email</label>
								<input type="text" class="form-control" id="userName" name="userName" placeholder="Enter your name" required>
							</div>
							<div class="mb-3">
								<label for="password" class="form-label">Password</label>
								<input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
							</div>
							<div class="mb-3">
								<label for="repeatPassword" class="form-label">Repeat Password</label>
								<input type="password" class="form-control" id="repeatPassword" name="repeatPassword" placeholder="Enter your password again" required>
							</div>
							<div id="message">
							  <h4>Password must contain the following:</h4>
							  <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
							  <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
							  <p id="number" class="invalid">A <b>number</b></p>
							  <p id="length" class="invalid">Minimum <b>8 characters</b></p>
							</div>
							<div class="d-flex justify-content-between">
								<button type="submit" class="btn btn-primary">Register</button>
								<button type="button" class="btn btn-secondary" onclick="location.href='http://localhost:8080/CS157A-team8/userLogin.jsp'">Login</button>
							</div>
						</form>
		    	</div>
	    	
	    		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	    	
	    	</div>

			<div class="image">
    			<img src="images/golden retriever.png" alt="">
			</div>
	    	
	    </div>
    </body>
    <script>
    
	    var myInput = document.getElementById("password");
	    var letter = document.getElementById("letter");
	    var capital = document.getElementById("capital");
	    var number = document.getElementById("number");
	    var length = document.getElementById("length");
	
	    // When the user clicks on the password field, show the message box
	    myInput.onfocus = function() {
	      document.getElementById("message").style.display = "block";
	    }
	
	    // When the user clicks outside of the password field, hide the message box
	    myInput.onblur = function() {
	      document.getElementById("message").style.display = "none";
	    }
	
	    // When the user starts to type something inside the password field
	    myInput.onkeyup = function() {
	      // Validate lowercase letters
	      var lowerCaseLetters = /[a-z]/g;
	      if(myInput.value.match(lowerCaseLetters)) {
	        letter.classList.remove("invalid");
	        letter.classList.add("valid");
	      } else {
	        letter.classList.remove("valid");
	        letter.classList.add("invalid");
	    }
	
	      // Validate capital letters
	      var upperCaseLetters = /[A-Z]/g;
	      if(myInput.value.match(upperCaseLetters)) {
	        capital.classList.remove("invalid");
	        capital.classList.add("valid");
	      } else {
	        capital.classList.remove("valid");
	        capital.classList.add("invalid");
	      }
	
	      // Validate numbers
	      var numbers = /[0-9]/g;
	      if(myInput.value.match(numbers)) {
	        number.classList.remove("invalid");
	        number.classList.add("valid");
	      } else {
	        number.classList.remove("valid");
	        number.classList.add("invalid");
	      }
	
	      // Validate length
	      if(myInput.value.length >= 8) {
	        length.classList.remove("invalid");
	        length.classList.add("valid");
	      } else {
	        length.classList.remove("valid");
	        length.classList.add("invalid");
	      }
	    }
    
    </script>
</html>