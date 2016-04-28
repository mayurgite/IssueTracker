<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 5px;
}
</style>
</head>
<body>
	<center><h1 style="">Welcome to Issue Tracker </h1></center>
	<form action="login.jsp" method="post">
		<center>
			<table width="50%" cellpadding="3">
				<thead>
					<tr>
						<th colspan="2">Login Here</th>
					</tr>
				</thead>
				<tr>
					<td>Enter Username:</td>
					<td><input type="text" name="userName" id="userName"></input></td>
				</tr>
				<tr>
					<td>Enter Password:</td>
					<td><input type="password" name="password" id="password"></input></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="Login">     <input type="reset" value="Reset"></td>
				</tr>
				<tr>
					<td>Not yet registered?</td>
					<td><a href="Register.jsp">Register</a></td>
				</tr>
			</table>
		</center>
	</form>
</body>
</html>