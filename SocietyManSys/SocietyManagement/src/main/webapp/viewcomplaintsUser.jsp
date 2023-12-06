<%@page import="society.mgmt.entities.Complaints"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="error.jsp"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>viewcomplaintsUser</title>
<style type="text/css">
body {
	background-image: url("./img/3.jpeg");
	background-repeat: no-repeat;
	background-size: cover;
}

</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
</head>
<body>
 <%
	response.setHeader("Cache-Control", "no-cache, no-store, must-validate");
	response.setHeader("Pragma", "no-cache");

	String email = (String) session.getAttribute("email");
	String role = (String)session.getAttribute("role");
	if(email ==null || !(role.equals("user"))){
		response.sendRedirect("login.jsp");
	}
	%>
<div style="position:absolute; top:0px; width: 100%"><%@ include file="userheader.jsp" %></div>
<div class="container mt-5 pt-5">
<h3>Complaint details</h3>
<table class="table rounded">
<thead class="bg-primary mt-5 text-light">
<tr>
<th>Type</th>
<th>Description</th>
<th>Status</th>
<th>Remark</th>
<th>IssuedOn</th>
<th>LastUpdatedOn</th>
<th colspan="2">Action</th>
</tr>
</thead>
            
<tbody class="bg-light text-dark">
<% 
List<Complaints> aList = (List<Complaints>)session.getAttribute("complaintlist");
for(Complaints cl: aList){ %>
<tr>
<td><%= cl.getType() %></td>
<td><%= cl.getDescription() %></td>
<td><%= cl.getStatus()  %></td>
<td><%= cl.getRemark()  %></td>
<td><%= cl.getIssuedate()  %></td>
<td><%= cl.getResolvedate()  %></td>
<td><a href="/makeUpdate?id=<%= cl.getId() %>" class="btn btn-primary">Update</a></td>
<td><a href="/deleteComplaint?id=<%= cl.getId() %>" class="btn btn-danger">Delete</a></td>
</tr>
<% }%>
</tbody>
</table>
</div>
</body>
</html>