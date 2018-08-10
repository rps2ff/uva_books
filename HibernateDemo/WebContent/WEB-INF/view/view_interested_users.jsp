<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>

<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<style>
.dropdown-menu > a:hover, .dropdown-menu > a:focus {
    background-color:#616872;
}
</style>

</head>
<body>
<nav class="navbar navbar-expand-md navbar-light bg-white fixed-top opaque-navbar pb-3 " style="background-color: #f2f0bc;">
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

<div class= "text-danger font-italic text-center pb-2">${accept_success}</div>

<table class="table mt-5">
  <thead class="thead text-success">
    <tr class="mt-3 bg-light">
      <th><h3 class="pt-3 ml-5">Users</h3></th>
      <th><h3 class="pt-3 ml-5"></h3></th>
    </tr>
  </thead>
  <tbody>
	  <c:forEach var="item" items="${list_of_users}">
	  
	   <c:url var="acceptOfferLink" value="/post/acceptOffer">
 		<c:param name="bookid2" value="${current_book.book_id}" /> 
		<c:param name="userid" value="${item.id}" />
	  </c:url>
	  
	  <tr>
	      <td>
		      <h4 class="ml-5"><c:out value="${item.firstName}" /> <c:out value="${item.lastName}" /></h4>
		      <p class="ml-5">Email: <c:out value="${item.email}" /></p>
		      <p class="ml-5">Phone: <c:out value="${item.phoneNumber}" /></p>
		      
	      </td>    
	      <td>
			<a href="" class="btn btn-outline-warning my-2 my-sm-0" data-toggle="modal" data-target="#messageModal">Message</a>
			<a href="${acceptOfferLink}" class=" btn btn-outline-success my-2 my-sm-0">Accept Offer!</a>
			
	      </td> 
	      
		<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog" role="document">
		        <div class="modal-content">
		            <div class="modal-header text-center">
		                <h4 class="modal-title w-100 font-weight-bold">Send Message!</h4>
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                    <span aria-hidden="true">&times;</span>
		                </button>
		            </div>
		            <div class="modal-body mx-3">
		                <div class="md-form mb-5">
		                	<form action="sendMessage" method="POST" data-toggle="validator" role="form">
		                	  <div class="input-group mb-2">
			                	  <div class="input-group-prepend">
			          				<div class="input-group-text">@</div>
			        			  </div>
						      	<input value="${item.email}" type="email" name="email" id="inputEmail" class="form-control mb-2" placeholder="Email address" required="required"/>
						      </div>
						      <div>
						      	<input type="text" name="subject" id="subjectinput" class="form-control mb-2" placeholder="Subject" required="required"/>
						      </div>
						      
						      <div>
		            		  	<textarea class="form-control mb-2" name="message" placeholder="Message..." id="message-text"></textarea>
		            		  </div>
		            		  
		            		  <div class="text-center">
						      	<button class="btn btn-default flex-center" type="submit">Send!</button>
						      </div>
						      
						     </form>  
		                </div>
		            </div>
		           
		        </div>
		    </div>
		</div>      
	  </tr>
	  </c:forEach>
  </tbody>
  </table>
  
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
  crossorigin="anonymous">
</script>
<script src="semantic/dist/semantic.min.js"></script>
</body>
</html>