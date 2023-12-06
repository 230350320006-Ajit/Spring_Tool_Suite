<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="error.jsp"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
	<style type="text/css">
	body {
	background-image: url("image/3.jpeg");
	background-repeat: no-repeat;
	background-size: cover;
}
	</style>
<body background="harish.jpg"
>

		<%@ include file = "navbar.jsp" %>
	

<div class="row justify-content-center col-12 mt-5 mx-auto">
	<h1 style="text-align: center;">Found records</h1>
<c:forEach var="visitor" items="${visilist}">
			<div class="card m-3 bg-dark " style="width: 18rem;">
				<img src="${visitor.getPhotoid()}" class="card_img-top"
					height="200px">

				<div class="card-body">
					<label style="font-weight: bold;color:white">Name :</label>&nbsp;<span style="color:white">${visitor.getVisitorName()}</span><br>
					<label style="font-weight: bold;color:white">Contact no :</label>&nbsp;<span style="color:white">${visitor.getContactNo()}</span>
					<label style="font-weight: bold;color:white">Relation :</label>&nbsp;<span style="color:white">${visitor.getRelation()}</span><br>
					<label style="font-weight: bold;color:white">Flat No :</label>&nbsp;<span style="color:white">${visitor.getFlatNo()}</span>
				</div>
			</div>
		</c:forEach>

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



<%--  --%>