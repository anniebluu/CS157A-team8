<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet Query</title>
    <!-- fontswesome cdn link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="test.css">

</head>
<body>
   <!-- header section starts -->

   <header class="header">

    <a href="#" class="logo"><i class="fas fa-paw"></i> Pet Query</a>

    <div class="icons" onclick="location.href='http://localhost:8080/CS157A-team8/userLogin.jsp'">
        <div class="fas fa-user"></div>
    </div>
</header>

<!-- header section ends -->

<!-- container -->

<div class="container">

    <div class="content">
        <h1>Find your perfect pet today</h1>
        <p>Our user-friendly platform allows you to effortlessly browse through a diverse selection of pets from multiple adoption centers all in one place.</p>
        <div class="button">
            <a href="#"><button class="btn1" onclick="location.href='http://localhost:8080/CS157A-team8/userLogin.jsp'">Login</button></a>
            <a href="#"><button class="btn2" onclick="location.href='http://localhost:8080/CS157A-team8/userRegister.jsp'">Register</button></a>
        </div>
    </div>
</div>

</body>
</html>