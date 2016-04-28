<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String userName = (String)session.getAttribute("userName");
String sampleValue = (String)session.getAttribute("password");
	System.out.println("username="+userName+"  password="+sampleValue);
%>

