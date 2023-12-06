<%@page import="society.mgmt.entities.Visitors"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="error.jsp"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>visitor list</title>
<style type="text/css">
body {
	background-image: url("./img/3.jpeg");
	background-repeat: no-repeat;
	background-size: cover;
}

</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
</head>
<body class="bg-dark" >
 <%
	response.setHeader("Cache-Control", "no-cache, no-store, must-validate");
	response.setHeader("Pragma", "no-cache");

	String email = (String) session.getAttribute("email");
	String role = (String)session.getAttribute("role");
	if(email ==null || !(role.equals("user"))){
		response.sendRedirect("login.jsp");
	}
	%>
<div style="position:absolute; top:0px; width: 100%"><%@ include file="userheader.jsp" %></div>

<div class="row justify-content-center col-12 mx-auto">
<h3>Visitor details</h3>    

    
<% 
List<Visitors> vList = (List<Visitors>)session.getAttribute("visitorlist");
for(Visitors v: vList){ %>

			<div class="col-2 mt-5 mx-2 row rounded  p-2 bg-dark">
				<div class="col-12 " >
					<img src="<%= v.getPhotoid() %>" class="w-100 mx-auto rounded" height="200px" >
					<% System.out.print("photoId: "+ v.getPhotoid()); %>
				</div>
				<div class="col-12 text-light row">
					<h6 class="col-12">Name: <%= v.getVisitorName() %></h6>
					<div class="row col-12" >

						<p class="col-12 " >Contact: <%= v.getContactNo() %></p>
						<p class="col-12">Relation: <%= v.getRelation() %></p>
					</div>
					

				</div>
				
					<a href="/deleteVisitor?id=<%= v.getId() %>" class="w-100  btn mx-auto  btn-danger" >Remove</a>
			</div>
<% } %>

</table>
</div>
</body>
</html>