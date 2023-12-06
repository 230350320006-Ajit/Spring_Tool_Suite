<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Members</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">

<link href="css/style.css" type="text/css" rel="stylesheet" />

<style>
::placeholder {
	color: black;
	opacity: 1;
}

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

input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}

.ermsg {
	color: red;
	font-size: 15px;
	font-weight: bold;
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

	<%@ include file="navbar.jsp"%>

	<div class="col-12 pt-5 ">

		<form action="/addmembers" onsubmit="return validate()"
			class="col-4 row mx-auto rounded px-5 py-3 mb-5 mt-5 text-dark"
			method="post" modelattribute="member" id="myform">
			<h2 class="text-center">Add Member</h2>
			<label for="iflat" class="h6">Flatno:</label>
			<!-- <input type="number" class="p-2 mx-auto rounded h6 input" autocomplete="off"  placeholder="Flat Number" name="flatno" id="iflat"> -->
			<select name="flatNo" class="p-2 rounded" id="iflat">
				<c:forEach var="flatValue" items="${flatlist}">
					<option>${flatValue.getFlatNo()}</option>
				</c:forEach>

			</select> <label id="errmsgflat" class="ermsg"></label> <label for="iname"
				class="h6 mt-2">Name of the Owner:</label> <input type="text"
				class="p-2 mx-auto rounded h6 input" autoComplete="off"
				placeholder="Ownername" name="name" id="iname"> <label
				id="errmsgname1" class="ermsg"></label> <label for="iemail"
				class="h6">Email:</label> <input type="text"
				class="p-2 mx-auto rounded h6 input" autoComplete="off"
				placeholder="Enter Email" name="email" id="iemail"> <label
				id="errmsgemail" class="ermsg"></label> <label for="imob" class="h6">Mobile:</label>
			<input type="number" class="p-2 mx-auto rounded h6 input"
				autocomplete="off" placeholder="Enter Mobile Number" name="mobNo"
				id="imob"> <label id="errmsgmob" class="ermsg"></label> <label
				for="imem" class="h6">Family Members:</label> <input type="number"
				class="p-2 mx-auto rounded h6 input" autocomplete="off"
				placeholder="Enter Number of Members" name="members" id="imem">

			<label id="errmsgmem" class="ermsg"></label>
			


			<label class="ermsg"> ${error} </label> <input type="submit"
				class="mt-4 btn btn-primary" value="Add Member">

		</form>
	</div>
	<script type="text/javascript" src="./js/smartsociety.js"></script>
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