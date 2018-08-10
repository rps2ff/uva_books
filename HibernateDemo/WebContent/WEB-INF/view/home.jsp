<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>

<style>
.caption {
    position: absolute;
    top: 45%;
    left: 0;
    width: 30%;
    background-color: white; 
    padding-left: 30px; 
    padding-top: 10px; 
    padding-bottom: 10px; 
    margin-left: 30px; 
    border-radius: 15px; 
    box-shadow: 10px 10px 5px;
    opacity: 0.8;
}
.dropdown-menu > a:hover, .dropdown-menu > a:focus {
    background-color:#616872;
}
</style>
<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<body>
<nav class="navbar navbar-expand-md navbar-light bg-white fixed-top opaque-navbar " style="background-color: #f2f0bc;">
      <ion-icon size="large" name="bookmarks"></ion-icon>
      <a class="navbar-brand pl-3" href="#">uva books</a>
      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="/HibernateDemo/home">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">About</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Books</a>
            <div class="dropdown-menu bg-secondary" aria-labelledby="dropdown01">
              <a class="dropdown-item text-white" href="#">Search books</a>
              <a class="dropdown-item text-white" href="/HibernateDemo/post/showAllPosts">All Posts</a>
              <a class="dropdown-item text-white" href="/HibernateDemo/post/showAddPostForm">Add a new post</a>
              <a class="dropdown-item text-white" href="/HibernateDemo/post/viewFavorites">View Favorites</a>
            </div>
          </li>
         <li>
         	<a class="nav-link" href="/HibernateDemo/customer/showRegisterForm">Sign up!</a>
         </li>
         
         <c:if test="${sessionScope.currentuser != null}">
   		   <li class="nav-item"><a class="nav-link" href="/HibernateDemo/post/showUserPosts">My Posts</a></li>
   		   <li class="nav-item"><a class="nav-link" href="/HibernateDemo/customer/showProfile">View Profile</a></li>
   		   <li class="nav-item"><a class="nav-link" href="/HibernateDemo/customer/logout">Logout</a></li>
		 </c:if>
         
        </ul>
      
     </div>
</nav>

<div>
<img class="w-100 mw-100" src="https://news.virginia.edu/sites/default/files/article_image/rotunda_night_summer_17_ss_header_5-2.jpg" class="img-fluid" alt="Responsive image" />
<div class="caption">

<c:choose>
	<c:when test ="${sessionScope.currentuser != null}">
		<h4>Welcome ${currentuser.firstName}!</h4> 	
   	</c:when> 
   	<c:otherwise>
   		<p>Already have an account? Login to start buying books!</p> 
   		<a href="" class="btn btn-outline-success my-2 my-sm-0" data-toggle="modal" data-target="#loginModal">Login</a>
<!--    		<a href="/HibernateDemo/customer/showLoginForm" class="btn btn-outline-info my-2 my-sm-0" >Login</a> -->
   	</c:otherwise>
</c:choose>
    
</div>
</div>



<div class="container">

        <!-- Example row of columns -->
        <div class="row">
          <div class="col-md-4 pt-5">
            <h2>Heading</h2>
            <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
            <p><a class="btn btn-warning" href="#" role="button">View details »</a></p>
          </div>
          <div class="col-md-4 pt-5">
            <h2>Heading</h2>
            <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
            <p><a class="btn btn-warning" href="#" role="button">View details »</a></p>
          </div>
          <div class="col-md-4 pt-5">
            <h2>Heading</h2>
            <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
            <p><a class="btn btn-warning" href="#" role="button">View details »</a></p>
          </div>
        </div>

        <hr>

</div>

<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
            <ion-icon size="large" name="checkmark-circle-outline"></ion-icon>
                <h4 class="modal-title w-100 font-weight-bold">Login</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body mx-3">
                <div class="md-form mb-5">
                	<form action="customer/validateUser" method="POST" data-toggle="validator" role="form">
				      
				      <div class="text-danger font-italic text-center pb-2">
				      ${error}
				      </div>
				      
				      <label for="inputEmail" class="sr-only">Email address</label>
				      <div class="mx-auto pb-3">
				      	<input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email address" required="required"/>
				      </div>
				      <label for="inputPassword" class="sr-only">Password</label>
				      <div class="mx-auto pb-3">
				      	<input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required="required"/>
				      </div>
				      
				      <div class="text-center">
				      <button class="btn btn-default flex-center" type="submit">Log in</button>
				      </div>
				      <p class="mt-5 mb-3 text-muted text-center">© 2017-2018</p>
					</form>
                	
                </div>

            </div>
            
        </div>
    </div>
</div>
<footer class="container">
  <p>© Company 2017-2018</p>
</footer>
    
    
<script src="https://unpkg.com/ionicons@4.2.5/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="semantic/dist/semantic.min.js"></script>
</body>
</html>