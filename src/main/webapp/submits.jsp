<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Pet Query - Adopt A Pet</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">
		
	<link rel="stylesheet" href="style.css">
</head>

<body>
   <!-- header section starts -->
	<jsp:include page="header.jsp"/>
	<!-- header section ends -->
    
	<div class="container">
		
		
		<div class="home home-form">
		<h1>Apply to Adopt!</h1>
			<div class="content-form">
	
	            <!-- check alert msg -->
	            <%
	                String alert = (String) request.getAttribute("alert");
	                if (alert != null) {
	            %>
	                <div class="alert alert-danger" role="alert">
	                    <%= alert %>
	                </div>
	            <%
	                }
	            %>
	            
				<form action="Submits" method="post">
					<div class="input-group mb-3">
						<span class="input-group-text submits-input-group-text" id="inputGroup-sizing-default" for="userID">Username</span>
						<input type="text" class="form-control" id="userID" name="username"
						value="<%= (session.getAttribute("userID") != null) ? session.getAttribute("userID") : "guest" %>" readonly>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text submits-input-group-text" id="inputGroup-sizing-default" for="petID">Pet ID</span>
						<!-- <input type="text" class="form-control" id="petID" name="petID" placeholder="Enter Desired Pet's ID" required> -->
						<input type="text" class="form-control" id="petID" name="petID"
						value="<%
							    // Get the petID from the request parameters
							    String petID = request.getParameter("petID");
							
							    // Check if petID is null or empty (optional)
							    if (petID != null && !petID.isEmpty()) {
							        // You can now use petID in your JSP page
							        out.println(petID);
							    } else {
							        out.println("No pet selected");
							    }
							%>" readonly>
					</div>   
					<div class="info-row apply-button-container">
						<button type="submit" class="btn btn-primary">Submit Application</button>
<!-- 					<a href="#"><button class="btn btn-primary" onclick="userPets.jsp">Return to Pets</button></a> -->
					</div>
					
				</form>
			</div>
		</div>
	</div>

</body>
</html>
