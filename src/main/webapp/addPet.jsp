<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet Query - Add Pet</title>
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
	<div class="header-title">Add A New Pet to Database</div>
<div class="login-container">
	<div class="header-subtitle">Please provide a unique ten-digit petID XXX-XXXX-XXX, the pet name, the pet age XX years, XX months, and the animal category</div>
		<form action="AddPet" method="post">
			<div class="mb-3">
				<label for="petID" class="form-label">Pet ID</label>
				<input type="text" class="form-control" id="petID" name="petID" placeholder="Enter New Pet ID" required>
			</div>
                    
			<div class="mb-3">
				<label for="petName" class="form-label">Pet Name</label>
				<input type="text" class="form-control" id="petName" name="petName" placeholder="Enter Pet Name" required>
			</div>
			
			<div class="mb-3">
				<label for="age" class="form-label">Age</label>
				<input type="text" class="form-control" id="age" name="age" placeholder="Enter Pet Age" required>
			</div>
			
			<div class="mb-3">
				<label for="category" class="form-label">Category</label>
				<input type="text" class="form-control" id="category" name="category" placeholder="Enter Category: Dog & Puppies, Cat & Kittens, Rabbits, etc." required>
			</div>
                    
			<div class="d-flex justify-content-end">
				<button type="submit" class="btn btn-primary">Add Pet</button>
			</div>
		</form>
</div>
</div>
</div>

</body>
</html>
