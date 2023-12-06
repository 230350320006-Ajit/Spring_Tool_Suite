<%@page import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Members</title>
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
	response.sendRedirect("login.jsp");
	}
%>
	<div class="p-2"><%@ include file="navbar.jsp"%></div>



	
	<div class="container-fluid mt-5">
		<h3 classs="mt-5">Allotment details</h3>


		<table class="table rounded">
			<thead class="bg-primary text-light">
				<tr>
					<th >Name</th>
					<th>MobNo</th>
					<th>Email</th>
					<th>FlatNo</th>
					<th>Family Members</th>
					<th>Date</th>
					<th colspan="3" class="mx-auto">Action</th>
					
				</tr>
			</thead>
			<tbody class="bg-light">

				<c:forEach var="listValue" items="${lists}">
					<tr>
						<td>${listValue.getName()}</td>
						<td>${listValue.getMobNo()}</td>
						<td>${listValue.getEmail()}</td>
						<td>${listValue.getFlatNo()}</td>
						<td>${listValue.getMembers()}</td>
						<td>${listValue.getDate()}</td>
						<td><form action="editmemberform" method="post">
								<input type="hidden" name="mememail"
									value="${listValue.getEmail()}"> <input type="submit"
									class="btn btn-success" value="Edit Member">
							</form></td>

						<td><form action="inactivemember" method="post">
								<input type="hidden" name="mememail"
									value="${listValue.getEmail()}"> <input type="submit"
									class="btn btn-danger" value="Remove Member">
							</form></td>

						<th><a href="/sendmail?email=${listValue.getEmail()}"
							class="btn btn-primary">Notify member</a></th>

					</tr>

				</c:forEach>

			</tbody>
		</table>

		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
			integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
			crossorigin="anonymous"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
			integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
			integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
			crossorigin="anonymous"></script>
</body>
</html>