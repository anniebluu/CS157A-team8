<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Account Registration</title>
</head>
<body>
	<form action="userRegistr" method="post">
		<table>
            <tr>
				<td>User Name</td>
				<td><input type="text" id="username" name="username"></td>
			</tr>
            <tr>
				<td>Name</td>
				<td><input type="text" id="name" name="name"></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" id="email" name="email"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>AccountType</td>
				<td><input type="accountType" name="accountType"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="register"></td>
			</tr>
		</table>
	</form>
</body>
</html>
