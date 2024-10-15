<!-- http://localhost:8080/Registration_Luu/memberRegister.jsp -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Registration</title>
		<style>
			/* Add a green text color and a checkmark when the requirements are right */
			.valid {
			  color: green;
			}
			
			.valid:before {
			  position: relative;
			  left: -35px;
			}
			
			/* Add a red text color and an "x" icon when the requirements are wrong */
			.invalid {
			  color: red;
			}
			
			.invalid:before {
			  position: relative;
			  left: -35px;
			}
		</style>
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