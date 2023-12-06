<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Members</title>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">



<style>
body {
	background-image: url("./img/4.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}
::placeholder {
	color: black;
	opacity: 1;
}

input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
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

.ermsg {
	/*display:block;*/
	color: red;
	font-size: 15px;
	font-weight: bold;
}
</style>
<script>
 function Validate(){
   var name=document.getElementById("iname");
   var mobile=document.getElementById("imob");
   var email=document.getElementById("iemail");
   var flatno=document.getElementById("iflat");
   var fmem=document.getElementById("imem");
   var reg = /^[1-9]{1}[0-9]{9}$/;
   var regv=/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
   var wb=/^\s*[a-zA-Z,\s]+\s*$/;

   if(name.value.trim()==""|| mobile.value.trim()==""||email.value.trim()==""||flatno.value.trim()==""||fmem.value.trim()==""){
	   alert("fill out fields");
	   return false;
   }else if(name.value.length <2||name.value.length >50 ){
	   alert("Please fill with more than 2 and less than 50 characters");
	   return false;
   }else if(wb.test(name.value)==false){
	   alert("invalid name");
	   return false;

   } else if(flatno.value.length <3 || flatno.value.length >3){
	   alert("Invalid flatno");
	   return false;
   }else if(fmem.value.length>30){
	   alert("Invalid fmaily member");
	   return false;
   }else if(reg.test(mobile.value)==false){
	   alert("invail mobile number");
	   mobile.focus();
	   return false;
   
   }else if(regv.test(email.value)==false){
	   alert("invail email");
	  email.focus();
	   return false;
 }else{
	 true;
 }
}
</script>

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

		<form action="/updatemember"
			class="col-4 row mx-auto rounded px-5 py-3 mb-5 mt-5 text-dark"
			method="post" id="myform" onsubmit="return Validate()">
			<h2 class="text-center ">Update Member</h2>

			<input class="form-control" type="hidden"
				value="${member.getId()}" name="id"> <label
				for="iname" class="h6">Name of the Owner:</label> <input type="text"
				class="p-2 mx-auto rounded h6 input"
				value="${member.getName() }" name="name" id="iname"> <label
				id="errmsgname1" class="ermsg"></label> <label for="imob" class="h6">Mobile:</label>
			<input class="p-2 mx-auto rounded h6 input" type="number"
				value="${member.getMobNo() }" name="mobNo" id="imob">
				 <label for="iemail" class="h6">Email:</label> 
				<input type="text"
				class="p-2 mx-auto rounded h6 input" autoComplete="off" name="email"
				id="iemail" value="${member.getEmail()}" readonly="true">
				
				 <label
				id="errmsgemail" class="ermsg"></label> <label for="iflat"
				class="h6">FlatNo:</label> <input
				class="p-2 mx-auto rounded h6 input" readonly="true" type="number"
				value="${member.getFlatNo() }" name="flatNo" id="iflat"> <label
				id="errmsgmob" class="ermsg"></label> <label for="imem" class="h6">Family
				Members:</label> <input type="number" class="p-2 mx-auto rounded h6 input"
				autocomplete="off" name="members" id="imem"
				value="${member.getMembers() }"> <label id="errmsgmem"
				class="ermsg"></label> <input type="submit"
				class="mt-4 btn btn-primary" 
				value="Update Member">

		</form>
	</div>
	<!-- 
	<script>
		function validateUpdate() {
			const spcregex = /[`!@#$%^&*()_+\-=\[\]{};\\|,.<>\/?~]/;

			if (checkInputs("iname", "errmsgname1", "Name should not be Null")) {
				if (document.getElementById("iname").value.length >= 2
						&& document.getElementById("iname").value.length <= 30) {
					if (!document.getElementById("iname").value.match(spcregex)) {
						document.getElementById("iname").style.border = "2px solid green";
						document.getElementById("errmsgname1").style.display = "none";
					} else {
						document.getElementById("iname").style.border = "2px solid red";
						document.getElementById("errmsgname1").innerText = "Name should not contain special characters";
						document.getElementById("errmsgname1").style.display = "block";
					}

				} else {
					document.getElementById("iname").style.border = "2px solid red";
					document.getElementById("errmsgname1").innerText = "Name range must be in between 2 to 30 characters";
					document.getElementById("errmsgname1").style.display = "block";
				}
			}
			return false;
		}

		function checkInputs(fieldId, errorId, msg) {
			const val = document.getElementById(fieldId).value.trim();
			if (val === "") {
				document.getElementById(fieldId).style.border = "2px solid red";
				document.getElementById(errorId).innerText = msg;
				document.getElementById(errorId).style.display = "block";
				return true;
			} else {
				document.getElementById(fieldId).style.border = "2px solid green";
				document.getElementById(errorId).style.display = "none";
				return false;
			}
			return false;

		}
	</script>
 -->
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