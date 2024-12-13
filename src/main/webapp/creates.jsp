<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet Query - Create Appointment Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- fontswesome cdn link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="style.css">
</head>
<script type="text/javascript">

	window.onload = function (){
		<% 
		if (session.getAttribute("userName") == null){
            response.sendRedirect("landingPage.jsp");  // Redirect to the landing page
        } else {
        	if ((Integer) session.getAttribute("isAdmin") == 1){
        		response.sendRedirect("petQueryHome.jsp");
        	}
        }
        %>	

	}
	
</script>
<body>
   <!-- header section starts -->
	<jsp:include page="header.jsp"/>
	<!-- header section ends -->

<!-- container -->

<div class="container">
<div class="home home-form">
	<h1>Create an appointment!</h1>

<!-- 	<div class="header-title">Create an appointment!</div>
 --><div class="login-container">
<!-- 	<div class="header-subtitle">Please provide your Username as well as the desired Date and Time of your appointment.</div>
 -->		<form action="Creates" method="post">
		
			<div class="input-group mb-3">
				<span class="input-group-text apt-input-group-text" id="inputGroup-sizing-default" for="username">Username</span>
				<input type="text" class="form-control" id="username" name="username"
						value="<%= (session.getAttribute("userID") != null) ? session.getAttribute("userID") : "guest" %>" readonly>
<!-- 				<input type="text" class="form-control" id="username" name="username" placeholder="Enter Username" required>
 -->			</div>
			<div class="input-group mb-3">
				<span class="input-group-text apt-input-group-text" id="inputGroup-sizing-default" for="date">Date</span>
			
				<input type="date" class="form-control" id="date" name="date" required>
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text apt-input-group-text" id="inputGroup-sizing-default" for="time">Time</span>
						
				<select class="form-control" id="time" name="time" required>
					<option value="" disabled selected>Select Desired Time</option>
					<%
						for (int i = 0; i < 24; i++) {
							String timeOption = i + ":00";
					%>
					<option value="<%= timeOption %>"><%= timeOption %></option>
					<%
						}
					%>
					
					
				</select>
				
				<!--<input type="text" class="form-control" id="time" name="time" placeholder="Enter Desired Time" required>-->
			</div>
                    
			<div class="info-row apt-button-container">
				<button type="submit" class="btn btn-primary">Create Appointment</button>
			</div>
		</form>
</div>
</div>
</div>

</body>
</html>
