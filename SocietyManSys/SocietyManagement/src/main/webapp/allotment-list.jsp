<%@page import="java.util.List"%>
<%@page import="society.mgmt.entities.AllotmentDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>list allotment</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
</head>
<body>
<div style="position:absolute; top:0px; width: 100%"><%@ include file="header.jsp" %></div>
<div class="container">
<h3>Allotment details</h3>
<a href="/showNewAllotmentForm" class="btn btn-primary btn-sm mb-3">Allot a Flat</a>

<table class="table">
<thead>
<tr>
<th>Id</th>
<th>Name</th>
<th>MobNo</th>
<th>Email</th>
<th>Password</th>
<th>FlatNo</th>
<th>Members</th>
<th>Date</th>
<th>RoleId</th>
<th colspan="2">Action</th>
</tr>
</thead>
            
<tbody>
<% 
List<AllotmentDetails> aList = (List<AllotmentDetails>)session.getAttribute("listAllotment");
for(AllotmentDetails al: aList){ %>
<tr>
<th><%= al.getId() %></th>
<th><%= al.getName() %></th>
<th><%= al.getMobNo() %></th>
<th><%= al.getEmail()  %></th>
<th><%= al.getPassword()  %></th>
<th><%= al.getFlatNo()  %></th>
<th><%= al.getMembers() %></th>
<th><%= al.getDate()  %></th>
<th><%= al.getRoleId()  %></th>
<th><a href="/showFormForUpdate?id=<%= al.getId() %>" class="btn btn-primary">Update</a></th>
<th><a href="/deleteAllotment?id=<%= al.getId() %>" class="btn btn-danger">Delete</a></th>
</tr>
<% } %>
</tbody>
</table>
</div>
 <div style="position:absolute; bottom:0px; width: 100%"><%@ include file="footer.jsp" %></div>
</body>
</html>