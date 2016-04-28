<%@page import="com.DBClasses.packg.DBConTest"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Page</title>
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
<center><h1 style="">Issue Tracker Sign up</h1></center>
<form action="registration.jsp" method="post">
		<center>
			<table width="30%" cellpadding="3">
				<thead>
					<tr>
						<th colspan="2">Registration Form</th>
					</tr>
				</thead>
				<tr>
					<td>Enter Firstname:</td>
					<td><input type="text" name="firstName" id="userName"></input></td>
				</tr>
				<tr>
					<td>Enter Lastname:</td>
					<td><input type="text" name="lastName" id="userName"></input></td>
				</tr>
				<tr>
					<td>Enter Email Id:</td>
					<td><input type="text" name="emailId" id="userName"></input></td>
				</tr>
				<tr>
					<td>Enter Username:</td>
					<td><input type="text" name="userName" id="userName"></input></td>
				</tr>
				<tr>
					<td>Enter Password:</td>
					<td><input type="password" name="password" id="password"></input></td>
				</tr>
				<tr>
					<td>Enter Re-Type Password:</td>
					<td><input type="password" name="confirmPass" id="password"></input></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="Submit" name="login" id="login">  <input type="reset" value="Reset"></td>
				</tr>
				<tr>
                        <td colspan="2">Already registered!! <a href="Loging.jsp">Login Here</a></td>
                    </tr>
			</table>
		</center>
	</form>
</body>
</html>