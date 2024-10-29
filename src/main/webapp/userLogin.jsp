<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet Query - Login</title>
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
<div class="login-container">
        <div class="header-title">Pet Query</div>
        <div class="header-subtitle">Login</div>
        <form action="Login" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" 
                name="userID" placeholder="Enter your username" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" 
                name="password" placeholder="Enter your password" required>
            </div>
			<div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-primary">Login</button>
                <button type="button" class="btn btn-secondary" 
                onclick="location.href='http://localhost:8080/CS157A-team8/userRegister.jsp'">Register</button>
            </div>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </div>

    <div class="image">
        <img src="images/golden retriever.png" alt="">
    </div>

</div>

</body>
</html>