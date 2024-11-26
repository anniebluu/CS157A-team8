<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet Query Home</title>
    <!-- fontswesome cdn link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="test.css">

</head>
<body>
   <!-- header section starts -->

   <header class="header">

    <a href="#" class="logo"><i class="fas fa-paw"></i> Pet Query</a>
		<nav>
			<ul>
				<li><a href="organizations.jsp">Organizations</a></li>
				<li><a href="pets.jsp">Pets</a></li>
			</ul>
		</nav>


		<div class="icons"
			onclick="location.href='http://localhost:8080/CS157A-team8/userProfile.jsp'">
			<div class="fas fa-user"></div>
		</div>

	</header>

<!-- header section ends -->

<!-- container -->

<div class="container">

    <div class="home">
        <h1>Welcome, <%= (session.getAttribute("userName") != null) ? session.getAttribute("userName") : "Guest" %>!</h1>
    </div>
</div>

</body>
</html>