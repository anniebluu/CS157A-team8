<!-- http://localhost:8080/Registration_Luu/memberRegister.jsp -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Registration</title>
		<link rel="stylesheet" href="css/style.css">
	</head>
	<body>
	  	<h1>Pet Query</h1>
	  	<h2>Register</h2>
	    <form action="Register" method="post">
			<table>
			  <tr>
			    <td>User ID</td>
			    <td><input type="text" name="userID" required></td>
			  </tr>
			  <tr>
			    <td>Email</td>
			    <td><input type="email" name="userEmail" required></td>
			  </tr>
			  <tr>
			    <td>Name</td>
			    <td><input type="text" name="userName" required></td>
			  </tr>
			  <tr>
			    <td>Password</td>
			    <td><input type="password" id="password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required></td>
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
    </body>
    <script src="js/main.js"></script>
</html>