F<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="error.jsp"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>loginPage</title>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
	
<script>
	function validate() {
		var email = document.getElementById("floatingInput");
		var password = document.getElementById("floatingPassword");
		var reg = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

		if (email.value.trim() == "") {
			alert("No blank values allowed");
			floatingInput.style.border = "solid 3px red";
			return false;
		} else if (password.value.trim() == "") {
			alert("No blank values allowed");
			floatingPassword.style.border = "solid 3px red";
			return false;
		} else if (reg.test(email.value) == false) {
			alert("Invalid Email");
			email.focus();
			return false
		} else if (password.value.trim().length < 4) {
			alert("Password is too short");
			return false;
		} else {
			true;
		}
	}
</script>
<style>
body {
	background-image: url("/img/4.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<%
String email=(String)session.getAttribute("email");
String role=(String)session.getAttribute("role");
if(email !=null){
	if(role=="admin")
	response.sendRedirect("dashboard.jsp");
	else if(role=="user")
	response.sendRedirect("userprofile.jsp");
	}
%>
	<div style="position: absolute; top: 0px; width: 100%"><%@ include
			file="indexheader.jsp"%></div>

	<main
		class="form-signin text-center container h-100 d-flex justify-content-center align-items-center">
		<form class="col-md-4" onsubmit="return validate()" action="/validate"
			method="post">
			<img class="mb-4" src="SMSlogo.png" alt="logo" width="100"
				height="75" style="margin-top: 60px">

			<h1 class="h3 mb-3 fw-normal text-light">Please sign in</h1>

			<div class="form-floating">
				<input type="email" class="form-control" id="floatingInput"
					placeholder="name@example.com" name="email"> <label
					or="floatingInput">Email address</label>
			</div>
			<br>
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingPassword"
					placeholder="name@example.com" name="pwd"> <label
					for="floatingPassword">Password</label>
			</div>
			<br>
			<button class="w-100 btn btn-lg btn-primary" type="submit">Sign
				in</button>
			<p class="mt-5 mb-3 text-muted">@ 2020-2021</p>
		</form>
		<h3>${msg}</h3>
	</main>

        <div style="position: absolute; bottom: 0px; width: 100%" class="text-light"><%@ include
			file="footer.jsp"%></div>

</body>
</html>