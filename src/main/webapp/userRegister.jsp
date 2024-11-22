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
        <style>
        /* Style the password validation message */
        .password-validation {
            display: none;
            position: absolute;
            top: 130px; /* Adjust to move the bubble closer to the password field */
            left: 100%;
            margin-left: 20px;
            padding: 15px;
            background: rgba(255, 255, 255, 0.9); /* Less transparent background */
            color: #333;
            border: 2px solid rgba(255, 255, 255, 0.7); /* Lighter border to match the form */
            border-radius: 10px;
            width: 250px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
            font-size: 14px;
            z-index: 10;
            backdrop-filter: blur(20px); /* Blurs the background behind the bubble */
        }

        .password-validation::before {
            content: "";
            position: absolute;
            top: 50%;
            left: -10px;
            margin-top: -5px;
            border-width: 5px;
            border-style: solid;
            border-color: transparent rgba(255, 255, 255, 0.9) transparent transparent; /* Arrow with the same background color */
        }

        .invalid {
            color: #e74c3c; /* Red for invalid items */
        }

        .valid {
            color: #2ecc71; /* Green for valid items */
        }

        .input-box {
            position: relative;
        }
    </style>
</head>
<body>
	<!-- header section starts -->
		<jsp:include page="header.jsp"/>
	<!-- header section ends -->
	
	${alert}
	<div class="container">
	    <div class="wrapper">
			<form class="registration" action="Register" method="post">
					<h1>Register</h1>
					<div class="input-box">
						<label for="userID" class="form-label">Username</label>
						<input type="text" class="form-control" id="userID" name="userID" placeholder="Enter your username" required>
					</div>
					<div class="input-box">
						<label for="userEmail" class="form-label">Email</label>
						<input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="Enter your email" required>
					</div>
					<div class="input-box">
						<label for="userName" class="form-label">Name</label>
						<input type="text" class="form-control" id="userName" name="userName" placeholder="Enter your name" required>
					</div>
					<div class="input-box">
						<label for="password" class="form-label">Password</label>
						<input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
					</div>
					<div class="input-box">
						<label for="repeatPassword" class="form-label">Repeat Password</label>
						<input type="password" class="form-control" id="repeatPassword" name="repeatPassword" placeholder="Enter your password again" required>
					</div>
					<div class="password-validation" id="message">
					  <h5>Password must contain the following:</h4>
					  <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
					  <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
					  <p id="number" class="invalid">A <b>number</b></p>
					  <p id="length" class="invalid">Minimum <b>8 characters</b></p>
					</div>
					<div class="d-flex justify-content-between">
						<button type="submit" class="btn btn-primary">Register</button>
							            <div class="register-link">
	                <p>Already have an account? 
	                   <a href="http://localhost:8080/CS157A-team8/userLogin.jsp">Login</a>
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
