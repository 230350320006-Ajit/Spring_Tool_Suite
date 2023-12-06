<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="error.jsp"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard Page</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
 /* body {
	background-image: url("./img/3.jpeg");
	background-repeat: no-repeat;
	background-size: cover; 
}  */

</style>


</head>

<body>
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-validate");
	response.setHeader("Pragma", "no-cache");

	String email = (String) session.getAttribute("email");
	String role = (String)session.getAttribute("role");
	if(email ==null || !(role.equals("admin"))){
		response.sendRedirect("login.jsp");
	}
	%>
	
	<div class="p-3">
		<div><%@ include file="navbar.jsp"%></div>

		<div class="col-12 mt-5">
			<h1 class="text-center">Welcome Admin</h1>
		</div>
		
		<div class="col-sm-12 row mt-3 justify-content-around">
			<div class="col-sm-4" >
				<div class="card" style="background: rgba(0,0,0,0.2)">
					<div class="card-body">
						<h5 class="card-title">Total Numbers of Members: ${member}</h5>
						<p class="card-text">This is the total number of flat owners you've in your society right now.</p>
						<a href="/view" class="btn btn-primary w-100">Show Members</a>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="card" style="background: rgba(0,0,0,0.2)">
					<div class="card-body">
						<h5 class="card-title">Total Numbers of Flats: ${flats}</h5>
						<p class="card-text">This is the total number of flat you've in your society right now.</p>
						<a href="/getflat" class="btn btn-primary w-100">Show Flats</a>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="card" style="background: rgba(0,0,0,0.2)">
					<div class="card-body">
						<h5 class="card-title">Total Number of Complaints: ${comlist.size()} </h5>
						<p class="card-text">This is the total number of complaints you've in your society right now.</p>
						<a href="/viewcomplaint" class="btn btn-primary w-100">Show Complaints</a>
					</div>
				</div>
			</div>
		</div>

			<div class="input-group mt-5 col-12 row">
				<form action="dashboardsearch" class="col-8 mx-auto row" method="post">
					<input type="search" class="form-control ml-auto col-6 rounded"
						placeholder="Search Here" aria-label="Search"
						aria-describedby="search-addon" name="keyword"  />
					<button type="submit" class="btn mr-auto btn-primary col-2">search</button>
				</form>
			</div>



			<div class="mt-5">
				<table class="table rounded" style="background: rgba(0,0,0,0.2)">
					<thead>
						<tr class="bg-primary text-light">
							<th  scope="col">FlatNo</th>
							<th scope="col">Type</th>
							<th  scope="col">Description</th>
							<th  scope="col">Remark</th>
							<th  scope="col">Issued Date</th>
							<th  scope="col">Resolved Date</th>
							<th  scope="col">Status</th>
						</tr>
					</thead>
					<tbody >
						<tr>
							<c:forEach var="compValue" items="${comlist}">
								<td  scope="col">${compValue.getFlatNo()}</td>
								<td  scope="col">${compValue.getType()}</td>
								<td  scope="col">${compValue.getDescription()}</td>
								<td  scope="col">${compValue.getRemark()}</td>
								<td  scope="col">${compValue.getIssuedate()}</td>
								<td  scope="col">${compValue.getResolvedate()}</td>
								<td  scope="col">${compValue.getStatus()}</td>
						</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>





			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
				crossorigin="anonymous"></script>
			<script
				src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
				integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
				crossorigin="anonymous"></script>
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
				integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
				crossorigin="anonymous"></script>
</body>
</html>