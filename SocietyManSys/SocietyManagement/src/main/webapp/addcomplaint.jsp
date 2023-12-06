<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
	errorPage="error.jsp" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add complaint</title>
<script>
	function Validate() {
		var Type = document.getElementById("type");
		var Description = document.getElementById("desc");

		if (Description.value.trim() == "") {
			alert("Cannot leave the field empty");
			return false;
		}

		else if (Description.value.length<5 || Description.value.length>50) {
			alert("Input cannot be <5 or >50 alphabets");
			return false;
		} else {
			return true;
		}

	}
</script>
<style>
body {
	background-image: url("./img/4.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}
form {
	background: rgba(255, 255, 255, 0.8)
}

.input {
	background-color: transparent;
	border: 1px solid black;
	outline: none;
	color: black;
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
	<div style="position: absolute; top: 0px; width: 100%"><%@ include
			file="userheader.jsp"%></div>
	<main
		class="form-signin text-center container h-100 d-flex justify-content-center align-items-center text-light">

		<form class="col-md-4 p-3 rounded text-dark" onsubmit="return Validate()" action="/addcomplaint" method="post"
			style="margin-top: 10%">
			<h2>Complaint Form</h2>
			<div>
				<label class="h6 mt-2">Type</label> <select name="type" id="type" class="w-100">
					<option>Electricity</option>
					<option>Plumbing</option>
					<option>Drainage</option>
					<option>Others</option>
				</select>
			</div>

			<div>
				<label class="h6 mt-2">Description</label> <input id="desc" class="form-control" type="text"
					name="desc">
			</div>

			<div>
				<input class="form-control"  type="hidden" name="flatNo"
					value="${flatNo}">
			</div>
<br>
			<button type="submit" class="btn btn-primary  mb-3 w-75">Raise
				Complaint</button>
		</form>
	</main>

</body>
</html>