<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="error.jsp"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

    <title>User Profile</title>
    <style>
        *{
            margin:0;
            padding: 0;
        }

        body{
            background-image: url(/img/room.jpg);
            background-repeat: no-repeat;
            background-size: cover;
        }

        h1{
            font-size: 36px;
            color: #555;
            font-weight: bold;
        }

        h3{
            font-size: 24px;
            color: #333;
            font-weight: bold;
        }

         #team p{
             font-weight: 500;
         }

         #team .card{
             border-radius:0 ;
             box-shadow: 5px 5px 15px #e74c3c;
             transition: all 0.3s ease-in;
             -webkit-transition: all 0.3s ease-in;
             -moz-transition: all 0.3s ease-in;  
         }

         #team .card:hover{
             background: lightgray;
             color: #fff;
             border-radius: 5px;
             border: none;
             box-shadow: 5px 5px 10px #9E9E9E;
         }

         #team .card:hover h3, #team .card:hover img{
             color: #fff;
         }



    </style>
</head>
<body>
 <%
 response.setHeader("Cache-Control", "no-cache, no-store, must-validate");
 response.setHeader("Pragma", "no-cache");

String email=(String)session.getAttribute("email");
String role = (String)session.getAttribute("role");
if(email ==null || !(role.equals("user"))){
	response.sendRedirect("login.jsp");
	}
%>
<div style="position:absolute; top:0px; width: 100%"><%@ include file="userheader.jsp" %></div>
<main class="form-signin text-center container h-100 d-flex justify-content-center align-items-center">
 <form>
 <div>
 </div>
 <div>
 <% String n=(String)session.getAttribute("name");
 n= n.toUpperCase();%>
 <h3>Welcome <%= n %>  </h3>
 
 </div>
 </form>
 </main>
 
 <section id="team">
    <div class="container my-3 py-5 text-center">
        <div class="row mb-5">
            <div class="col"><div>
 <%  n=(String)session.getAttribute("name");
 n= n.toUpperCase();%>
 <marquee direction="left"> <h2 style="color: black;">Welcome <%= n %> to the members page </h2> </marquee>
 
 </div>
                <p class="mt-3">
                    <h3>Manage Your account At One Place.</h3>
                </p>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="card">
                    <div class="card-body">
                        <img src="/img/member.jpg" alt="" class="img-fluid mb-3">
                        <h3>Manage Complaints</h3>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Minus, voluptatum?</p>
                        <div class="d-flex flex-row justify-content-center">
                            <div class="p-4">
                                <a href="/instantiatecomplaint"><button type="button" class="btn btn-primary">Add Complaint</button>
                                </a>
                            </div>
                            <div class="p-4">
                                <a href="/complaintlist"><button type="button" class="btn btn-primary">View Complaints</button></a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="card">
                    <div class="card-body">
                        <img src="/img/flat.jpg" alt="" class="img-fluid mb-3">
                        <h3>Manage Visitors</h3>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Minus, voluptatum?</p>
                        <div class="d-flex flex-row justify-content-center">
                            <div class="p-4">
                                <a href="/addvisitor"><button type="button" class="btn btn-primary">Add Visitors</button>
                                </a>
                            </div>
                            <div class="p-4">
                                <a href="/visitorlist"><button type="button" class="btn btn-primary">View Visitors</button></a>
                            </div>

                        </div>
                         
                    </div>
                </div>
            </div>



        </div>
    </div>  
    </section>  

        
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
  </body>
</html>
</body>
</html>