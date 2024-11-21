<!-- http://localhost:8080/Registration_Luu/memberRegister.jsp -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<!-- <meta charset="ISO-8859-1"> -->
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<title>Pet Query - Registration</title>
		<!-- fontswesome cdn link -->
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	    <link rel="stylesheet" href="style.css">
	</head>
	<body>
		<!-- header section starts -->
   		<jsp:include page="header.jsp"/>
		<!-- header section ends -->
	  	
	  	${alert}
	  	
	  	<div class="container">
	  		<div class="content">
		  		<div class="register-container">
			  		<div class="header-title">Pet Query</div>
		        	<div class="header-subtitle">Register</div>
					    <form action="Register" method="post">
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
							<div id="message">
							  <h4>Password must contain the following:</h4>
							  <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
							  <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
							  <p id="number" class="invalid">A <b>number</b></p>
							  <p id="length" class="invalid">Minimum <b>8 characters</b></p>
							</div>
					    </form>
		    	</div>
	    	
	    		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	    	
	    	</div>

			<div class="image">
    			<img src="golden retriever.png" alt="">
			</div>
	    	
	    </div>
    </body>
    <script src="js/main.js"></script>
</html>