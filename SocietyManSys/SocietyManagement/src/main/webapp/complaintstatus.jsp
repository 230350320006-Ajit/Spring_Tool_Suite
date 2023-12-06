<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="error.jsp"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Complaint Status</title>
<style type="text/css">
body {
	background-image: url("./img/4.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}
::placeholder {
	color: black;
	opacity: 1;
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
	color: red;
	font-size: 15px;
	font-weight: bold;
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
 response.setHeader("Cache-Control", "no-cache, no-store, must-validate");
 response.setHeader("Pragma", "no-cache");

String email=(String)session.getAttribute("email");
String role = (String)session.getAttribute("role");
if(email ==null || !(role.equals("admin"))){
	response.sendRedirect("login.jsp");}
%>

<%@ include file = "navbar.jsp" %>
<div class="col-12 pt-5 ">
 <%-- <p>${complaint.getIssuedate() }</p> --%>
	<form action="updatecomplaint" class="col-4 row mx-auto rounded px-5 py-3 mb-5 mt-5 text-dark" method="post" onsubmit="return textArea()">
        <div class="mx-auto"> <h1 >Complaint Status</h1></div>
       
        <input type="hidden"  name="compid" value="${complaint.getId() }" > 
       <label for="iflat" class="h6 mt-3">Flatno:</label>
			<input type="number" class="p-2 mx-auto rounded h6 input" autocomplete="off"  name="flatno" value="${complaint.getFlatNo() }" id="iflat" readonly="true"> 
			
			<label for="itype"
				class="h6 mt-2">Complaint Type:</label>
				 <input type="text"
				class="p-2 mx-auto rounded h6 input" 
				name="comptype" id="itype" value="${complaint.getType() }" readonly="true"> 
				
				 <label for="idesc"
				class="h6">Description:</label> 
				<input type="text"
				class="p-2 mx-auto rounded h6 input" autoComplete="off"
				value="${complaint.getDescription() }" name="compdescription" id="idesc" readonly="true"> 
				
				
				 <label for="istat" class="h6">Complaint Status:</label>
				<input type="text" class="p-2 mx-auto rounded h6 input"
				autocomplete="off"  name="compstatus1"
				id="istat" value="${complaint.getStatus() }" readonly="true"> 
				
			<label for="idate" class="h6">Complaint Issued Date:</label> <input type="text"
				class="p-2 mx-auto rounded h6 input" name="issuedate" id="idate" value="${complaint.getIssuedate() }" readonly="true"> 

				<label
				for="iadrem" class="h6 rounded">Admin Remark:</label> 
				<textarea id="iadrem" name="adminremark"
          rows="5" cols="33"></textarea>
          <label id="eradrem" class="ermsg"></label>
          
          <label for="cst" class="h6 mt-3">Complaint Status:</label>
          <select name="compstatus" id="status" class="p-2 rounded" >
			 <label id="erstatus" class="ermsg"></label>
			<option>In Progress</option>
			<option>Resolved</option>
			
			
			</select> 
          
				<input
				type="submit" class="mt-4 btn btn-primary" value="Update Complaint" >
				
				
				</form>
				</div>

<script>
	function textArea(){
		var maxLength = 50;
		
		if(checkInputs("iadrem", "eradrem", "Please Add Remark for complaint")){
			console.log(document.getElementById("iadrem").value.length)
			if(document.getElementById("iadrem").value.length <=150 ){
				
				return true;
			}else{
				document.getElementById("iadrem").style.border = "2px solid red";
				document.getElementById("eradrem").innerText = "length must be in between 1 to 150";
				document.getElementById("eradrem").style.display = "block";
				return false;
			}
				
			
		}
		return false;
	}
	
	function checkInputs(fieldId, errid, msg){
		const val = document.getElementById(fieldId).value.trim();
		if (val === "") {
			document.getElementById(fieldId).style.border = "2px solid red";
			document.getElementById(errid).innerText = msg;
			document.getElementById(errid).style.display = "block";
			return false;
		} else {
			document.getElementById(fieldId).style.border = "2px solid green";
			document.getElementById(errid).style.display = "none";
			return true;
		}
		
	}


</script>



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