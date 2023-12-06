<%@page import="society.mgmt.entities.AllotmentDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UpdateAllotments</title>
<style>
	input {
		margin-bottom:1em;
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
AllotmentDetails ad = (AllotmentDetails) session.getAttribute("obj"); %>

<div style="position:absolute; top:0px; width: 100%"><%@ include file="header.jsp" %></div>

 <main  class="form-signin text-center container h-100 d-flex justify-content-center align-items-center">
 
 <form class="col-md-4" action="/saveAllotment" method="post" style="margin-top: 5%">
 <h2>Update Allotment Details</h2>
 <div class="container">
 

 <input class="form-control" type="hidden" value="<%= ad.getId() %>" name="id">
 </div>
 
 <label>Name</label>
 <input class="form-control" type="text" value="<%= ad.getName() %>" name="name">
 </div>
 
 <div>
 <label>Mob</label>
 <input class="form-control" type="number" value="<%= ad.getMobNo()%>" name="mobNo">
 </div>
 
 <div>
 <label>Email</label>
 <input class="form-control" type="email" value="<%= ad.getEmail() %>" name="email">
 </div>
 
  <div>

 <input class="form-control" type="hidden" value="<%= ad.getPassword() %>" name="password">
 </div>
 
  <div>
  <select class="form-select" aria-label="Default select example" value="<%= ad.getFlatNo() %>" name="flatNo">
  <option selected>FlatNo</option>
  <option value="501" name="flatNo">501</option>
  <option value="502" name="flatNo">502</option>
  <option value="503" name="flatNo">503</option>
</select>
  </div>
  
  <div>
 <label>Members</label>
 <input class="form-control" type="number" value="<%= ad.getMembers() %>" name="members">
 </div>
 
   <div>
 <label>Date</label>
 <input class="form-control" type="date" value="<%= ad.getDate() %>" name="date">
 </div>
 
   <div>
 <label>RoleId</label>
 <input class="form-control" type="number" value="<%= ad.getRoleId() %>" name="roleId">
 </div>
 
 <button type="submit" class="btn btn-primary mb-3">Update Allotment</button>&nbsp;
 <a href="/allotmentlist" class="btn btn-warning  mb-3">Go back to Allotment List</a>
 </form> 
  
</body>
</html>