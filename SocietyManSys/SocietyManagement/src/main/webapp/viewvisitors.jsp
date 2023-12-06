<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Visitors</title>
</head>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">

<style type="text/css">
body {
	background-image: url("./img/3.jpeg");
	background-repeat: no-repeat;
	background-size: cover;
}

.errmsg {
	color: "red";
}

input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}
</style>

<body class="bg-dark">
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-validate");
	response.setHeader("Pragma", "no-cache");

	String email = (String) session.getAttribute("email");
	String role = (String) session.getAttribute("role");
	if (email == null || !(role.equals("admin"))) {
		response.sendRedirect("login.jsp");
	}
	%>

	<div class="p-1"><%@ include file="navbar.jsp"%></div>
	
	<div class="input-group col-12 d-flex mt-5 mx-0 bg-dark " style="height: 100px">
	
		<form class="col-8 mx-auto d-flex" action="searchvis" onsubmit="return validation()" method="post">
			<input class="form-control mx-auto col-2 rounded p-2" type="number"
				value="${flatNo}" name="keyword" id="flatNo" placeholder="Search"
				aria-label="Search">

			<button class="btn mr-auto btn-primary col-2 p-2" type="submit"
				onclick="">Search</button>
				

		</form>
		<p id="error" style="visibility :hidden" class="mt-2 col-8 text-center text-danger">Please Enter flat no</p>
		<form action="searchall" class="col-4" method="post"><input type="submit" class="btn btn-success w-50 ml-auto" value="Refresh"/></form>
	</div>
	



	<div class="row justify-content-center col-12 mt-5 mx-auto">
		<c:forEach var="visitor" items="${vlist}">
			<div class="card p-2 m-3 bg-dark" style="width: 18rem;">
				<img src="${visitor.getPhotoid()}" class="card_img-top"
					height="200px">

				<div class="card-body">
					<label style="font-weight: bold; color: white">Name: </label>&nbsp;<span
						style="color: white">${visitor.getVisitorName()}</span><br> <label
						style="font-weight: bold; color: white">Contact no: </label>&nbsp;<span
						style="color: white">${visitor.getContactNo()}</span> <label
						style="font-weight: bold; color: white">Relation: </label>&nbsp;<span
						style="color: white">${visitor.getRelation()}</span><br> <label
						style="font-weight: bold; color: white">Visitors of Flat No: </label>&nbsp;<span
						style="color: white">${visitor.getFlatNo()}</span>
				</div>
			</div>
		</c:forEach>
	</div>
	<script>
		function validation() {
			if (checkInputs("flatNo", "error", "Type Flatno")) {
return true;
			}
			return false;
		}
		function checkInputs(fieldId, errorId, msg) {
			const val = document.getElementById(fieldId).value.trim();
			if (val === "") {
				document.getElementById(fieldId).style.border = "2px solid red";

				document.getElementById(errorId).style.visibility = "visible";
				return false;
			} else {
				document.getElementById(fieldId).style.borderborder = "2px solid green";
				document.getElementById(errorId).style.visibility = "hidden";
				return true;
			}

		}
	</script>


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