<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Pet Query - Registration</title>
    
    <!-- fontswesome cdn link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">
		
    <link rel="stylesheet" href="style.css">   
</head>
<body>
	<!-- header section starts -->
   <header class="header">

   	<jsp:include page="header.jsp"/>

	</header>
	<!-- header section ends -->
	
	<div class="container">
	    <div class="wrapper">
			<form action="Register" method="post">
					<h1>Register</h1>
					
					<div role="alert">
						${alert}
					</div>
	            
	            
					<div class="input-box">
						<!-- <label for="userID" class="form-label">Username</label> -->
						<input type="text" class="form-control" id="userID" name="userID" placeholder="Enter your username" required>
					</div>
					<div class="input-box">
						<!-- <label for="userEmail" class="form-label">Email</label> -->
						<input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="Enter your email" required>
					</div>
					<div class="input-box">
						<!-- <label for="userName" class="form-label">Name</label> -->
						<input type="text" class="form-control" id="userName" name="userName" placeholder="Enter your name" required>
					</div>
					<div class="input-box">
						<!-- <label for="password" class="form-label">Password</label> -->
						<input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
					</div>
					<div class="input-box">
						<!-- <label for="repeatPassword" class="form-label">Repeat Password</label> -->
						<input type="password" class="form-control" id="repeatPassword" name="repeatPassword" placeholder="Enter your password again" required>
					</div>
					
					<div class="password-validation" id="message">
					  <h5>Password must contain the following:</h4>
					  <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
					  <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
					  <p id="number" class="invalid">A <b>number</b></p>
					  <p id="length" class="invalid">Minimum <b>8 characters</b></p>
					</div>
					
						<button type="submit" class="btn btn-primary">Register</button>
							            <div class="register-link">
	                <p>Already have an account? 
	                   <a href="userLogin.jsp">Login</a>
	                </p>
	            </div>
					</div>
				</form>
		</div>
	</div>
	
    <script>
        var myInput = document.getElementById("password");
        var letter = document.getElementById("letter");
        var capital = document.getElementById("capital");
        var number = document.getElementById("number");
        var length = document.getElementById("length");
        var message = document.getElementById("message");

        // When the user clicks on the password field, show the message box
        myInput.onfocus = function() {
            message.style.display = "block"; // Show the validation message
        }

        // When the user clicks outside of the password field, hide the message box if all requirements are met
        myInput.onblur = function() {
            if (isPasswordValid()) {
                message.style.display = "none"; // Hide the message if password is valid
            }
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

            // Keep the message visible if any validation is not passed
            if (!isPasswordValid()) {
                message.style.display = "block"; // Keep the bubble visible if validation fails
            }
        }

        // Function to check if password is valid
        function isPasswordValid() {
            return letter.classList.contains("valid") &&
                   capital.classList.contains("valid") &&
                   number.classList.contains("valid") &&
                   length.classList.contains("valid");
        }
    </script>
    
</body>
</html>