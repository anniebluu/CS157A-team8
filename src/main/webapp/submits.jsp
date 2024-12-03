<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet Query</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="test.css">
</head>
<body>
   <!-- header section starts -->
	<jsp:include page="header.jsp"/>
	<!-- header section ends -->

<!-- container -->

<div class="container">

<div class="content">
            <h2>Apply to Adopt!</h2>
            <p>Please provide your Username as well as the unique Pet ID (XXX-XXXX-XXX) of the pet you'd like to adopt.</p>

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
		
			<div class="mb-3">
				<label for="username" class="form-label"> UserName</label>
				<input type="text" class="form-control" id="username" name="username" placeholder="Enter Username" required>
			</div>
			<div class="mb-3">
				<label for="petID" class="form-label">Pet ID</label>
				<input type="text" class="form-control" id="petID" name="petID" placeholder="Enter Desired Pet's ID" required>
			</div>   
			<div class="button">
				<a href="#"><button type="submit" class="btn1">Submit Application</button></a>
				<a href="#"><button class="btn2" onclick="location.href='http://localhost:8080/CS157A-team8/displayPetsDashboard.jsp'">Return to Pets</button></a>
			</div>
			
		</form>
</div>
</div>
</div>

</body>
</html>
