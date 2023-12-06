<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="error.jsp"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Flat</title>



<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
	
	<style>
::placeholder{
color:black;
opacity:1;
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
    
    input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

.ermsg {
	color: red;
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

<div class="p-4"><%@ include file = "navbar.jsp" %></div>

 <div class="col-12">

	<form action="addflats" class="col-4 row mx-auto rounded p-3 mt-5 text-dark " method="post" modelattribute="flat" onsubmit="return flatValidate()">
	<div class="mx-auto"> <h2 class="text-center" >Add New Flat</h2></div>
	<label for="iflatno"class="h6 mt-2">FlatNo:</label>
	<input type="number" class="p-2 mx-auto rounded h6 input" placeholder="Flat Number" name="flatNo" id="iflatno">
	<label id="errmsgflat" class="ermsg"></label>
	
	<label for="ifloor"class="h6 mt-2">Floor:</label>
<select name="floor" class="p-2 mx-auto rounded h6 input" id="ifloor">
  <option value="first" class="text-dark">First</option>
  <option value="second" class="text-dark">Second</option>
  <option value="third" class="text-dark">Third</option>
  <option value="fourth" class="text-dark">Fourth</option>
  <option value="fifth" class="text-dark">Fifth</option>
</select>
	
	
	<!-- <input type="text" class="p-2 mx-auto rounded h6 input" placeholder="Flat Type" name="flattype" > -->
	
	<label for="iflat"class="h6 mt-2">Flat Type:</label>
	<select name=flatType class="p-2 mx-auto rounded h6 input" id="iflat">
  <option  class="text-dark">1BHK</option>
  <option class="text-dark">2BHK</option>
  <option class="text-dark">3BHK</option>
  
</select>
	<input type="submit" class="mt-4 btn btn-primary"  value="Add Flat">
	<label class="ermsg"> ${error} </label>
	
	</form>
	</div>
	
	
	<script type="text/javascript" src="./js/smartsociety.js"></script>
	
	
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