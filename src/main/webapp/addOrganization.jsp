<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Pet Query - Add Organization</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">
</head>

<body>
	<h3>Add A New Organization to Database<h3>
<!-- container -->
	<div class="container">
	<div class="input-group">
			<form action="AddOrganization" method="post">
				<div class="input-group mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default" for="orgID">Org ID</span>
					<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="orgID" name="orgID" placeholder="Enter New Organization ID" required>
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default" for="orgName">Organization Name</span>
					<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="orgName" name="orgName" placeholder="Enter Organization Name" required>
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default" for="orgEmail">Organization Email</span>
					<input type="email" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="orgEmail" name="orgEmail" placeholder="Enter Organization Email" required>
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default" for="address">Address</span>
					<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="address" name="address" placeholder="Enter Organization Address" required>
				</div>
	                    
				<div class="d-flex justify-content-end">
					<button type="submit" class="btn btn-primary">Add Organization</button>
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
