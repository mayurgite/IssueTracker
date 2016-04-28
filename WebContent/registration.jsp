<%@page import="java.util.Map"%>
<%@page import="com.DBClasses.packg.DBConTest"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	Map<String, String> result = null;
	String userName = request.getParameter("userName");
	String sampleValue = request.getParameter("password");
	String confirmPass = request.getParameter("confirmPass");
	System.out.println("Username::"+userName+", Password:: "+sampleValue);
	
	if(sampleValue.equals(confirmPass)){
		DBConTest conTest = new DBConTest();
		result = conTest.executeMyQuery(userName, sampleValue,"insert");
		if(result.get("result").equalsIgnoreCase("true")){%>
			<script>
				alert("Successfully registered!!");
			</script>
			<%response.sendRedirect("Loging.jsp");%>
	<%	}else {%>
			<script>
				alert("Invalid Username/Password");
			</script>
			<%response.sendRedirect("Register.jsp");%>
	<%	} %>

	<% }else {%>
				<script>
					alert("Please enter same password twice to confirm");
				</script>
	<% }
	
 %>