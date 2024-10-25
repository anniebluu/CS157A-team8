<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Add Pet</title>
		<link rel="stylesheet" href="css/style.css">
	</head>
	<body>
	  	<h1>Pet Query</h1>
	  	<h2>Add Pet</h2>
	    <form action="AddPet" method="post">
	    <table>
			  <tr>
			    <td>Pet ID</td>
			    <td><input type="text" name="petID" required></td>
			  </tr>
			  <tr>
			    <td>Pet Name</td>
			    <td><input type="text" name="petName" required></td>
			  </tr>
			  <tr>
			    <td>Age</td>
			    <td><input type="text" name="age" required></td>
			  </tr>
			  <tr>
			    <td>Category</td>
			    <td><input type="text" name="category" required></td>
			  </tr>
			</table>
        <input type="submit" value="Add Pet">
    </form>
</body>
    <script src="js/main.js"></script>
</html>