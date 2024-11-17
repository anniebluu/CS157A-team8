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

<!-- text context -->
<div class="content">
	<div class="header-title">The place to find your new best friend!</div>
	<div class="header-subtitle">Browse, learn more about our available pets, and Apply to adopt. </div>
</div>
<!-- end text context -->

<!-- container -->

<div class="container">

<div class="row justify-content-center">

<!-- pet 1 -->
	<div class="col-md-3 mb-3">
		<div class="card text-center">
		
		<div class="row justify-content-center">
			<img src="images/Huck.png" class="img-fluid">
		</div>
		
		<div class="card-body">
			<h5 class="card-title">Pet</h5>
			<p class="card-text">brief description of pet</p>
			
			<div class="button">
                <button type="adopt" class="btn btn-primary"
                onclick="location.href='http://localhost:8080/CS157A-team8/submits.jsp'">Apply to Adopt!</button>
                <button type="petInfo" class="btn btn-secondary"
                onclick="location.href='http://localhost:8080/CS157A-team8/userRegister.jsp'">Learn More about Me!</button>
            </div>
            
		</div>
		</div>
	</div>
	
	
<!-- pet 2 -->
	<div class="col-md-3 mb-3">
		<div class="card text-center">
		
		<div class="row justify-content-center">
			<img src="images/Dewey.png" class="img-fluid">
		</div>
		
		<div class="card-body">
			<h5 class="card-title">Pet</h5>
			<p class="card-text">brief description of pet</p>
			
			<div class="button">
                <button type="adopt" class="btn btn-primary"
                onclick="location.href='http://localhost:8080/CS157A-team8/submits.jsp'">Apply to Adopt!</button>
                <button type="petInfo" class="btn btn-secondary"
                onclick="location.href='http://localhost:8080/CS157A-team8/userRegister.jsp'">Learn More about Me!</button>
            </div>
            
		</div>
		</div>
	</div>
	
<!-- pet 3 -->
	<div class="col-md-3 mb-3">
		<div class="card text-center">
		
		<div class="row justify-content-center">
			<img src="images/Delta.png" class="img-fluid">
		</div>
		
		<div class="card-body">
			<h5 class="card-title">Pet</h5>
			<p class="card-text">brief description of pet</p>
			
			<div class="button">
                <button type="adopt" class="btn btn-primary"
                onclick="location.href='http://localhost:8080/CS157A-team8/submits.jsp'">Apply to Adopt!</button>
                <button type="petInfo" class="btn btn-secondary"
                onclick="location.href='http://localhost:8080/CS157A-team8/userRegister.jsp'">Learn More about Me!</button>
            </div>
            
		</div>
		</div>
	</div>
	
<!-- pet 4 -->
	<div class="col-md-3 mb-3">
		<div class="card text-center">
		
		<div class="row justify-content-center">
			<img src="images/Kite.png" class="img-fluid">
		</div>
		
		<div class="card-body">
			<h5 class="card-title">Pet</h5>
			<p class="card-text">brief description of pet</p>
			
			<div class="button">
                <button type="adopt" class="btn btn-primary"
                onclick="location.href='http://localhost:8080/CS157A-team8/submits.jsp'">Apply to Adopt!</button>
                <button type="petInfo" class="btn btn-secondary"
                onclick="location.href='http://localhost:8080/CS157A-team8/userRegister.jsp'">Learn More about Me!</button>
            </div>
            
		</div>
		</div>
	</div>
	
<!-- pet 5 -->
	<div class="col-md-3 mb-3">
		<div class="card text-center">
		
		<div class="row justify-content-center">
			<img src="images/Hopsalot.png" class="img-fluid">
		</div>
		
		<div class="card-body">
			<h5 class="card-title">Pet</h5>
			<p class="card-text">brief description of pet</p>
			
			<div class="button">
                <button type="adopt" class="btn btn-primary"
                onclick="location.href='http://localhost:8080/CS157A-team8/submits.jsp'">Apply to Adopt!</button>
                <button type="petInfo" class="btn btn-secondary"
                onclick="location.href='http://localhost:8080/CS157A-team8/userRegister.jsp'">Learn More about Me!</button>
            </div>
            
		</div>
		</div>
	</div>
	
<!-- pet 6 -->
	<div class="col-md-3 mb-3">
		<div class="card text-center">
		
		<div class="row justify-content-center">
			<img src="images/Tawny.png" class="img-fluid">
		</div>
		
		<div class="card-body">
			<h5 class="card-title">Pet</h5>
			<p class="card-text">brief description of pet</p>
			
			<div class="button">
                <button type="adopt" class="btn btn-primary"
                onclick="location.href='http://localhost:8080/CS157A-team8/submits.jsp'">Apply to Adopt!</button>
                <button type="petInfo" class="btn btn-secondary"
                onclick="location.href='http://localhost:8080/CS157A-team8/userRegister.jsp'">Learn More about Me!</button>
            </div>
            
		</div>
		</div>
	</div>
	
<!-- pet 7 -->
	<div class="col-md-3 mb-3">
		<div class="card text-center">
		
		<div class="row justify-content-center">
			<img src="images/Hamilton.png" class="img-fluid">
		</div>
		
		<div class="card-body">
			<h5 class="card-title">Pet</h5>
			<p class="card-text">brief description of pet</p>
			
			<div class="button">
                <button type="adopt" class="btn btn-primary"
                onclick="location.href='http://localhost:8080/CS157A-team8/submits.jsp'">Apply to Adopt!</button>
                <button type="petInfo" class="btn btn-secondary"
                onclick="location.href='http://localhost:8080/CS157A-team8/userRegister.jsp'">Learn More about Me!</button>
            </div>
            
		</div>
		</div>
	</div>
	
<!-- pet 8 -->
	<div class="col-md-3 mb-3">
		<div class="card text-center">
		
		<div class="row justify-content-center">
			<img src="images/Lewis.png" class="img-fluid">
		</div>
		
		<div class="card-body">
			<h5 class="card-title">Pet</h5>
			<p class="card-text">brief description of pet</p>
			
			<div class="button">
                <button type="adopt" class="btn btn-primary"
                onclick="location.href='http://localhost:8080/CS157A-team8/submits.jsp'">Apply to Adopt!</button>
                <button type="petInfo" class="btn btn-secondary"
                onclick="location.href='http://localhost:8080/CS157A-team8/userRegister.jsp'">Learn More about Me!</button>
            </div>
            
		</div>
		</div>
	</div>
 
</div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
