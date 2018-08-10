<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

<table class="table mt-5">
  <thead class="thead text-success">
    <tr class="mt-3 bg-light">
      <th><h3 class="pt-3 ml-5">Users</h3></th>
      <th><h3 class="pt-3 ml-5"></h3></th>
    </tr>
  </thead>
  <tbody>
	  <c:forEach var="item" items="${list_of_posts}">
	  
	  <c:url var="removeInterested" value="/post/removeFromInterested">
		<c:param name="bookid" value="${item.book_id}" />
		<c:param name="user" value="${item.user}" />
	  </c:url>
	  
	  <c:url var="placeOrder" value="/order/placeOrder">
		<c:param name="bookid2" value="${item.book_id}" />
	  </c:url>
	  
	  <tr>
	      <td>
		    <h4 class="ml-5"><c:out value="${item.title}" /></h4>
		      <p class="ml-5">Author: <c:out value="${item.author}" /></p>
		      <p class="ml-5">ISBN: <c:out value="${item.book_isbn}" /></p>
		      <p class="ml-5">Department: <c:out value="${item.department}" /> / Professor: <c:out value="${item.professor}" /></p>
		      <p class="ml-5">Course: <c:out value="${item.course_code}" /> / Course Number: <c:out value="${item.course_number}" /></p>
		      <p class="ml-5">Price: <c:out value="${item.price}" /></p>
		      <p class="ml-5">Posted by: <c:out value="${item.user.firstName}" /></p>
		      
	      </td>    
	      <td>
	      <button type="button" class="btn btn-outline text-dark my-2 my-sm-0 mr-2 pb-0" disabled>
		      <div>
			      <ion-icon size="large" name="people"></ion-icon>
			      <p class="mb-2">Interested Users: <c:out value="${fn:length(item.interestedUsers)}" /></p>
		      </div>
	      </button>
 	      <a class="btn btn-outline-info my-2 my-sm-0" href="${removeInterested}">Remove From Favorites</a>
	      <a href="/HibernateDemo/customer/showLoginForm" class="btn btn-outline-warning my-2 my-sm-0" >Message</a>
	      
			<c:if test="${item.acceptedBuyer eq sessionScope.currentuser}">
      			<a href="" class="btn btn-outline-success my-2 my-sm-0" data-toggle="modal" data-target="#placeOrderModal">Order</a>
      		</c:if>
	      
	      </td>  
	      
	      <div class="modal fade" id="placeOrderModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			    <div class="modal-dialog" role="document">
			        <div class="modal-content">
			            <div class="modal-header text-center">
			                <h4 class="modal-title w-100 font-weight-bold">Place Order</h4>
			                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                    <span aria-hidden="true">&times;</span>
			                </button>
			            </div>
			            <div class="modal-body mx-3">
			                <div class="md-form mb-5">
			                <form action="${placeOrder}" method="POST" data-toggle="validator" role="form">
			                	<label>Method of Paying</label><br>
			                    <div class="custom-control custom-radio">
			                    <input class="form-check-input ml-2" name="payment" type="radio" value="Venmo" id="defaultCheck1">
			                    <label class="form-check-label ml-4" for="defaultCheck1">
			    					Venmo
			  					</label><br>
			  					</div>
			  					<div class="custom-control custom-radio">
			                    <input class="form-check-input ml-2" name="payment" type="radio" value="Cash in person" id="defaultCheck2">
			                	<label class="form-check-label ml-4" for="defaultCheck2">
			    					Cash in person
			  					</label>
			  					</div>
			  					
			                	<button class="btn btn-default">Place Order</button>
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