<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Navbar</title>
<style>

</style>
</head>
<body>

	<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark col-12 "
		style="position: fixed; top: 0px;">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp">Smart Society</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarScroll"
				aria-controls="navbarScroll" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarScroll">
				<ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll"
					style="-bs-scroll-height: 100px;">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/dashboard">Home</a></li>
						
						<li class="nav-item"><a class="nav-link " href="member">Add
							Member</a></li>

					<li class="nav-item"><a class="nav-link " href="view">View
							Member</a></li>
					<li class="nav-item"><a class="nav-link " href="flats">Add
							flat</a></li>
					<li class="nav-item"><a class="nav-link " href="getflat">View
							flat</a></li>
					<li class="nav-item"><a class="nav-link " href="viewcomplaint">View
							Complaints</a></li>
					<li class="nav-item"><a class="nav-link " href="viewvisitors">View
							Visitors</a></li>
				</ul>
				<div class="ml-auto">
					<a href="/logout" class="btn btn-danger">Logout</a>
				</div>
			</div>
		</div>
	</nav>
</body>
</html>