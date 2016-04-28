<%@page import="java.sql.ResultSet"%>
<%@page import="com.DBClasses.packg.IssueListOperations"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<table id="myTableData" border="1" cellpadding="2">
	<tr>
		<td><b>Issue ID</b></td>
		<td><b>Issue Name</b></td>
		<td><b>Issue Description</b></td>
	</tr>
</table>

<%! 
	String id = ""; 
	String issueName = "";
	String issueDesc = "";
	String status = "";
	ResultSet result = null;
%>

<%

if((session.getAttribute("operation").toString() != "" || session.getAttribute("operation").toString() != null) && 
		session.getAttribute("operation").toString().equalsIgnoreCase("select")){
	try {
		id = (String)session.getAttribute("id");
		
	}catch(NumberFormatException nfe){
		nfe.printStackTrace();
	}
}else if((session.getAttribute("operation").toString() != "" || session.getAttribute("operation").toString() != null) && 
		session.getAttribute("operation").toString().equalsIgnoreCase("insert")){
	try {
		session.setAttribute("issueName",request.getParameter("issueName"));
		session.setAttribute("issueDesc",request.getParameter("issueDesc"));
		session.setAttribute("status",request.getParameter("status"));

		response.sendRedirect("issueMaipulation.jsp");
	}catch(NumberFormatException nfe){
		nfe.printStackTrace();
	}
}

if( id != ""){
	IssueListOperations conTest = new IssueListOperations();
	result = conTest.executeMyQuery(id, "select",issueName,issueDesc,status);
	if(result != null){
	
		while(result.next()){
			id = result.getString("id");
			issueName = result.getString("issueName");
			issueDesc = result.getString("issueDesc");
		
		%>
		<script type="text/javascript">
			var id = "<%=id%>";
			var issueName = "<%=issueName%>";
			var issueDesc = "<%=issueDesc%>";
			var table = document.getElementById("myTableData");
			
			var rowCount = table.rows.length;
			var row = table.insertRow(rowCount);

			row.insertCell(0).innerHTML= id.value;
			row.insertCell(1).innerHTML= issueName.value;
			row.insertCell(2).innerHTML= issueDesc.value;
		</script>

<%}%>

<%	}else {%>
<script>
			alert("Invalid Username/Password");
		</script>
<%	} %>

<% }else {%>
<script>
				alert("Invalid Details");
			</script>
<% }

%>

