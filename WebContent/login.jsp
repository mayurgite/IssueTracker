<%@page import="java.util.Map"%>
<%@page import="com.DBClasses.packg.DBConTest"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	String userName = request.getParameter("userName");
	String sampleValue = request.getParameter("password");
	System.out.println("Username::"+userName+", Password:: "+sampleValue);
	DBConTest conTest = new DBConTest();
	Map<String, String> result = conTest.executeMyQuery(userName, sampleValue,"SELECT");

	if(!result.isEmpty()){
		System.out.println("Result is not empty!!");	
		session.setAttribute("userName",userName);
		session.setAttribute("password",sampleValue);
		session.setAttribute("id",result.containsKey((Object)"id")? result.get("id") : "");
		session.setAttribute("operation","select");
		System.out.println("Just before redirecting to issue tracking page");
		response.sendRedirect("issueTrackerList.jsp");
		System.out.println("Just After redirecting to issue tracking page");
	}else {
%>
		<script>
			alert("Invalid Username/Password");
		</script>
<%	}
 %>