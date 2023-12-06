<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>View Flat</title>

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

<div class="mb-5"><%@ include file = "navbar.jsp" %></div>


	<div class="container-fluid mt-5">
	<br>
		<h3 >Flat details</h3>


		<table class="table rounded ">
			<thead >
				<tr class="bg-primary text-light">
					<th >Flat No</th>
					<th >Floor</th>
					<th >Flat Type</th>

					<th colspan="2">Action</th>
				</tr>
			</thead>

			<tbody  class="bg-light">
				<c:forEach var="listValue" items="${flatlist}">
					<tr>
						<td>${listValue.getFlatNo()}</td>
						<td>${listValue.getFloor()}</td>
						<td>${listValue.getFlatType()}</td>
						
						<td ><form action="updateflatform" method="post">
						<input type="hidden" name="flatNo" value="${listValue.getFlatNo()}">
						<input type="submit" class="btn btn-success" value="Update Flat"></form></td>
						
						<td ><form action="deleteflat" method="post">
						<input type="hidden" name="flatNo" value="${listValue.getFlatNo()}">
						<input type="submit" class="btn btn-danger" value="Delete Flat"></form></td>
					</tr>

				</c:forEach>
			</tbody>
			
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