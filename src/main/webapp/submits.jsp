<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet Query - Adopt Pet Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- fontswesome cdn link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="style.css">
</head>
<body>
   <!-- header section starts -->
	<jsp:include page="header.jsp"/>
	<!-- header section ends -->

<!-- container -->

<div class="container">

<div class="content">
	<div class="header-title">Apply to Adopt!</div>
<div class="login-container">
	<div class="header-subtitle">Please provide your Username as well as the unique pet ID XXX-XXXX-XXX of the pet you'd like to adopt.</div>
		<form action="Submits" method="post">
		
			<div class="mb-3">
				<label for="username" class="form-label"> UserName</label>
				<input type="text" class="form-control" id="username" name="username" placeholder="Enter Username" required>
			</div>
			<div class="mb-3">
				<label for="petID" class="form-label">Pet ID</label>
				<input type="text" class="form-control" id="petID" name="petID" placeholder="Enter Desired Pet's ID" required>
			</div>
                    
			<div class="d-flex justify-content-end">
				<button type="submit" class="btn btn-primary">Submit Application</button>
			</div>
		</form>
</div>
</div>
</div>

</body>
</html>
