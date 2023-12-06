<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	errorPage="error.jsp" pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add new visitor</title>
<script>
	function Validate() {
		var Name = document.getElementById("name");
		var MobileNo = document.getElementById("mob");
		var Relation = document.getElementById("rel");
		var PhotoId = document.getElementById("id");
		var reg = /^[1-9]{1}[0-9]{9}$/;

		if (Name.value.trim() == "" || MobileNo.value.trim() == ""
				|| Relation.value.trim() == "" || PhotoId.value == "") {
			alert("Cannot leave any field Empty");
			return false;
		} else if (Name.value.length<2 || Name.value.length>50) {
			alert("Name must be between 5 to 50 characters");
			return false;
		} else if (Relation.value.length < 2 || Relation.value.length > 50) {
			alert("Cannot exceed more then 15 characters");
			return false;
		} else if (reg.test(MobileNo.value) == false) {
			alert("Enter a valid mobile number");
			MobileNo.focus();
			return false;
		} else {

			 true;
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
		class="form-signin text-dark rounded text-center container h-100 d-flex justify-content-center align-items-center">

		<form class="col-md-4 p-3 rounded" onsubmit="return Validate()" action="savevisitor" method="post"
			enctype="multipart/form-data" style="margin-top: 10%">
			<h2>Add visitor</h2>
			<div class="container">
				<label class="h6 mt-2" for="name">Name</label>
				 <input class="form-control" type="text" id="name"
					name="name">
			</div>

			<div>
				<label class="h6 mt-2">MobNo</label> <input class="form-control" type="text" id="mob"
					name="contactNo">
			</div>

			<div>
				<label class="h6 mt-2">Relation</label> <input class="form-control" type="text" id="rel"
					name="relation">
			</div>

			<div>
				<label class="h6 mt-2">Photoid</label> <input class="form-control" type="file" id="id"
					name="photoid">
			</div>
<br>
			<div>
				<input class="form-control" type="hidden" name="flatNo"
					value="${flatNo}">
			</div>


			<button type="submit" class="btn btn-primary  mb-3 w-75">Add
				visitor</button>
			<!-- &nbsp;&nbsp; <a href="/visitorlist" class="btn btn-warning  mb-3 w-75">Go
				back</a> -->
		</form>
	</main>
</body>
</html>