<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Pet Query - Add Pet</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">
</head>

<body>
	<h3>Add A New Pet to Database<h3>
<!-- container -->
	<div class="container">
	<div class="input-group">
			<form action="AddPet" method="post">
				<div class="input-group mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default" for="petID">Pet ID</span>
					<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="petID" name="petID" placeholder="Enter New Pet ID" required>
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default" for="petName">Pet Name</span>
					<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="petName" name="petName" placeholder="Enter Pet Name" required>
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default" for="age">Age</span>
					<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="age" name="age" placeholder="Enter Pet Age" required>
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default" for="category">Category</span>
					<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="category" name="category" placeholder="Enter Category: Dog & Puppies, Cat & Kittens, Rabbits, etc." required>
				</div>
	                    
				<div class="d-flex justify-content-end">
					<button type="submit" class="btn btn-primary">Add Pet</button>
				</div>
			</form>
	</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
		crossorigin="anonymous">
	</script>
</body>
</html>
