<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Complaint</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<style>
body {
	background-image: url("./img/3.jpeg");
	background-repeat: no-repeat;
	background-size: cover;
}


</style>
</head>
<body>
	<%
 response.setHeader("Cache-Control", "no-cache, no-store, must-validate");
 response.setHeader("Pragma", "no-cache");

String email=(String)session.getAttribute("email");
String role = (String)session.getAttribute("role");
if(email ==null || !(role.equals("admin"))){
	response.sendRedirect("login.jsp");}
%>

	<div><%@ include file="navbar.jsp"%></div>
	<div class="container-fluid mt-5">
	<br>
		<h3>Complaints details</h3>
	
		<table class="table rounded">
			<thead class="bg-primary text-light">
				<tr >
					<th>FlatNo</th>
					<th>Complaint Type</th>
					<th>Description</th>
					<th>Status</th>
					<th>Admin Remark</th>
					<th>Issued Date</th>
					<th>Resolved Date</th>
					<th colspan="2">Action</th>
				</tr>
			</thead>
			<tbody class="bg-light">
				<c:forEach var="clistValue" items="${clist}">
					<tr>
						<td>${clistValue.getFlatNo()}</td>
						<td>${clistValue.getType()}</td>
						<td>${clistValue.getDescription()}</td>
						<td>${clistValue.getStatus()}</td>
						<td>${clistValue.getRemark()}</td>
						<td>${clistValue.getIssuedate()}</td>
						<td>${clistValue.getResolvedate()}</td>
						<td><form action="compdetails" method="post">
								<input type="hidden" name="compid" value="${clistValue.getId()}">
								<input type="submit" class="btn btn-success" value="Resolve">
							</form></td>

						<td><form action="removecomplaint" method="post">
								<input type="hidden" name="compid" value="${clistValue.getId()}">
								<input type="submit" class="btn btn-danger"
									value="Remove Complaint">
							</form></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>