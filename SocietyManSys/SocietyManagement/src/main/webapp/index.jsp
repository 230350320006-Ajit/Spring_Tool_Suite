<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="error.jsp"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
  <style>
    body{
      font-family: poppins;
    }

    header.carousel-inner.item{
      height: 100%;
    }

    .narbar-inverse{
      background-color: transparent;
      border-color: transparent;
    }

    .navbar-inverse.navbar-brand{
      color: #262626;
      font-size: 40px;
      padding: 40px 15px;
      font-weight: 900;

    }

  

    .nav-inverse.navbar-nav>li>a{
      color: #262626;
      text-transform: uppercase;
      font-size: 16px;
      font-weight: bold;
    }

    .banner{
      background-size:cover;
      background-position: center center;
      background-repeat: no-repeat;
      height: 100vh;
    } 

    .carousel-caption{
      padding-bottom: 250px;
      font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;

    }
    .carousel-caption h2{
      font-size: 70px;
      text-transform: uppercase;
      font-weight: bold;
    }

    .carousel-caption h2 span {
      color: greenyellow;
    }

    .carousel-caption a{
      background: darkturquoise;
      padding: 15px 35px;
      display: inline-block;
      margin-top: 15px;
      color: #fff;
      text-transform: uppercase;
      border-radius: 25px;
    }

    .carousel-control.right{
      background-image: none;
    }

    .carousel-control.left{
      background-image: none;
    }

    .carousel-indicators.active{
      background-color: darkturquoise;
      border-color: darkturquoise;
    }


  </style>
    <title>Home</title>
  </head>
  <body>
    <header>
      <nav class="navbar navbar-default navbar-inverse navbar-fixed-top navbar-dark bg-transparent">
        <div class="container">

          <div class="navbar-header">
            <a class="navbar-brand" href="#">Smart Society</a>
          </div>
          

          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

            <ul class="nav navbar-nav navbar-right">
              <li><a href="login.jsp">Login</a></li>
              <li><a href="#">About Us</a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </nav>



      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

        <ol class="carousel-indicators">
          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>
      
 
        <div class="carousel-inner" role="listbox">
          <div class="item active">
            <img src="/img/building.jpg" class="banner" alt="" style="width: 100%;height: 72rem;">
            <div class="carousel-caption">
              <h2 class="animated bounceInRight" style="animation-delay: 1s; animation-duration: 2s;">This is a <span>Smart Society</span></h2>
              <h3 class="animated bounceInLeft" style="animation-delay: 2s; animation-duration: 2s;">Creative & Digitalised</h3>
              <p class="animated bounceInRight" style="animation-delay: 3s; animation-duration: 2s;"><a href="login.jsp">Login</a></p>
            </div>
          </div>
          <div class="item">
            <img src="/img/room.jpg" class="banner" alt=""  style="width: 100%;height: 100%;height: 72rem;">
            <div class="carousel-caption">
              <h2 class="animated slideInDown" style="animation-delay: 1s; animation-duration: 2s;">Best in the <span>City</span></h2>
              <h3 class="animated fadeInUp" style="animation-delay: 2s; animation-duration: 2s;">Book Your Flat Today What are you waiting for?</h3>
              <p class="animated zoomIn" style="animation-delay: 3s; animation-duration: 2s;"><a href="login.jsp">Login</a></p>
            </div>
          </div>
          <div class="item">
            <img src="/img/garden.jpg" class="banner" alt="" style="width: 100%; height: 100%;height: 72rem;">
            <div class="carousel-caption">
              <h2 class="animated zoomIn" style="animation-delay: 1s; animation-duration: 2s;">Best in <span>Planning</span></h2>
              <h3 class="animated fadeInLeft" style="animation-delay: 2s; animation-duration: 2s;">Strategy and Planning</h3>
              <p class="animated zoomIn" style="animation-delay: 3s; animation-duration: 2s;"><a href="">About Us</a></p>
            </div>
          </div>
         
        </div>
      

        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>

    </header>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.4.1/js/bootstrap.min.js"></script>
  </body>
</html>