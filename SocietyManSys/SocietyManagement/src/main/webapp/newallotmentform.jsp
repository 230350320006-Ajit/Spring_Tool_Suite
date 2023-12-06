<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NewAllotmentForm</title>
<style>
	
body {
	background-image: url("./img/4.jpg");
	background-repeat: no-repeat;
	background-size:100%;
}
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
<jsp:include page="navbar.jsp"></jsp:include>
 <main  class="form-signin text-center container h-100 d-flex justify-content-center align-items-center text-light">
 
 <form class="col-md-4" action="/saveAllotment"  method="post" style="margin-top: 10%">
 <h2>Allotment Details</h2>
 <div class="container">
 <label >Name</label>
 <input class="form-control " type="text" name="name">
 </div>
 
 <div>
 <label>Mob</label>
 <input class="form-control" type="number" name="mobNo">
 </div>
 
 <div>
 <label>Email</label>
 <input class="form-control" type="email" name="email">
 </div>
 
  <div>
 <label>Password</label>
 <input class="form-control" type="text" name="password">
 </div>
 
  <div>
  <label>FlatNo</label>
  <select class="form-select" aria-label="Default select example" name="flatNo">
  <option selected>FlatNo</option>
  <option value="501" name="flatNo">501</option>
  <option value="502" name="flatNo">502</option>
  <option value="503" name="flatNo">503</option>
</select>
  </div>
  
  <div>
 <label>Members</label>
 <input class="form-control" type="number" name="members">
 </div>
 
   <div>
 <label>Date</label>
 <input class="form-control" type="date" name="date">
 </div>
 
   <div>
 <label>RoleId</label>
 <input class="form-control" type="number" name="roleId">
 </div>
 <br>
 <button type="submit" class="btn btn-primary btn-sm mb-3">Allot</button>
 <a href="/allotmentlist" class="btn btn-warning btn-sm mb-3">Go back to Allotment List</a>
 </form> 
 </main>
</body>
</html>