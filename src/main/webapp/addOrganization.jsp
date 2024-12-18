<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<script type="text/javascript">

	window.onload = function (){
		<% 
		if (session.getAttribute("userName") == null){
            response.sendRedirect("landingPage.jsp");  // Redirect to the landing page
        } else {%>	
		<% 
		if ((Integer) session.getAttribute("isAdmin") == 0){
            response.sendRedirect("petQueryHome.jsp");  // Redirect to the landing page
        } }%>	
	}
	
</script>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Pet Query - Add Organization</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">
		
	<link rel="stylesheet" href="style.css">
</head>
<% request.setAttribute("adminAddOrganizationsActive", "active"); %>

<body>
	<!-- header section starts -->
	<jsp:include page="header.jsp"/>
	<!-- header section ends -->
	<jsp:include page="sidebar.jsp"/>
	
	<div class="main-content">
		<h2>Add A New Organization to Database</h2>
		
		<div class=content-box>
			<div class="content-form">
				<form action="AddOrganization" method="post">
					<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default" for="orgName">Organization Name</span>
						<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="orgName" name="orgName" placeholder="Enter Organization Name" required>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default" for="orgID">Organization Phone Number</span>
						<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="orgID" name="orgID" placeholder="Enter New Organization Phone Number" required>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default" for="orgEmail">Organization Email</span>
						<input type="email" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="orgEmail" name="orgEmail" placeholder="Enter Organization Email" required>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default" for="address">Address</span>
						<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="address" name="address" placeholder="Enter Organization Address" required>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default" for="url">URL</span>
						<input type="url" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="url" name="url" placeholder="Enter Organization URL" required>
					</div>
		                    
					<div class="info-row">
						<button type="submit">Add Organization</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
		crossorigin="anonymous">
	</script>
</body>
</html>
