<!-- http://localhost:8080/Registration_Luu/memberRegister.jsp -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>


<html>

  <head>
    <meta charset="ISO-8859-1">
    <title>Admin Dashboard</title>
    <style>
    header {
    	background-color: gray;
    }
    .searchBar {
    	margin: auto;
    	width: 25%;
    }
    </style>
  </head>
  
  <body>
  
	<header>
	
		<div class="logo">
			Pet Query
		</div>
		
		<div class="searchBar">
		  <input type="text" placeholder="Search...">
		</div>

		<div class="dropdown">
		  <button class="dropbtn">Username</button>
		  <div class="dropdown-content">
		    <a href="#">User Profile</a>
		    <a href="#">Sign Out</a>
		  </div>
		</div>
		
	</header>
	
	<div class="main-container">
		<div class="tables">
			<a href="#">Organizations</a>
			<a href="#">Pets</a>
			<a href="#">Adoptions</a>
			<a href="#">Users</a>
			<a href="#">Employees</a>
		</div>
	</div>
	
	<div class="table">

	</div>
  </body>
</html>