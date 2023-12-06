<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	errorPage="error.jsp" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>reset</title>
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

input {
	margin-bottom: 1em;
}
</style>
</head>
<body>

	<%
 response.setHeader("Cache-Control", "no-cache, no-store, must-validate");
 response.setHeader("Pragma", "no-cache");

String email=(String)session.getAttribute("email");
if(email ==null){
	response.sendRedirect("login.jsp");}
%>
	<div style="position: absolute; top: 0px; width: 100%"><%@ include
			file="indexheader.jsp"%></div>

	<main
		class="form-signin text-center container h-100 d-flex justify-content-center align-items-center text-light">
		<form class="col-md-4" onsubmit="return validate()"
			action="/resetpassword" method="post">
			<img class="mb-4" src="SMSlogo.png" alt="logo" width="100"
				height="75" style="margin-top: 60px">
			<h1 class="h3 mb-3 fw-normal">Reset Password</h1>

			<div class="form-floating text-dark">
				<input type="email" class="form-control" id="floatingInput"
					placeholder="name@example.com" name="email"> <label
					for="floatingInput" style="color: red;visibility:">email address</label>
			</div>
			<br>
			<div class="form-floating text-dark">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
  </body>
</html>				<input type="password" class="form-control" id="floatingPassword"
					placeholder="old Password" name="oldpwd"> <label
					for="floatingPassword">old password</label> <label id="lbltext"
					style="color: red; visibility: hidden;">Invalid</label>
			</div>
			<br>
			<div class="form-floating text-dark">
				<input type="password" class="form-control" id="floatingPassword"
					placeholder="new password" name="pwd"> <label 
					for="floatingPassword">new password</label>
			</div>
			<br>
			<button class="w-100 btn btn-lg btn-primary" type="submit">Reset
			</button>
			<p class="mt-5 mb-3 text-muted">@ 2020-2021</p>
		</form>
	</main>

	<div style="position: absolute; bottom: 0px; width: 100%"><%@ include
			file="footer.jsp"%></div>

</body>
</html>