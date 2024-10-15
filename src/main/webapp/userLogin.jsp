<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Login</title>
		<link rel="stylesheet" href="css/style.css">
	</head>
	<body>
	  	<h1>Pet Query</h1>
	  	<h2>Login</h2>
	    <form action="Login" method="post">
			<table>
			  <tr>
			    <td>User ID</td>
			    <td><input type="text" name="userID" required></td>
			  </tr>
			  <tr>
			    <td>Password</td>
			    <td><input type="password" id="password" name="password" required></td>
			  </tr>
			  <tr>
			    <td><input type="submit" value="Login"></td>
			  </tr>
			</table>

	    </form>
    </body>
</html>