<%@page import="com.DBClasses.packg.DBConTest"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	String userName = request.getParameter("userName");
	String sampleValue = request.getParameter("password");
	System.out.println("Username::"+userName+", Password:: "+sampleValue);
	DBConTest conTest = new DBConTest();
	boolean result = conTest.executeMyQuery(userName, sampleValue,"SELECT");

	if(result){
		session.setAttribute("userName",userName);
		session.setAttribute("password",sampleValue);
		response.sendRedirect("issueTrackerList.jsp");
	}else {
%>
		<script>
			alert("Invalid Username/Password");
		</script>
<%	}
 %>