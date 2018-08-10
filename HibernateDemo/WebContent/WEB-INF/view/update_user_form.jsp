<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Update User</title>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	
</head>

<body>

	<form:form action="updateUser" modelAttribute="user" method="POST" data-toggle="validator" role="form">
		  
		  <form:hidden path="id" />
		  
		  <div class = "text-center pt-5 pb-5">
	      	<ion-icon size="large" name="document"></ion-icon>
	      </div>
	      <h1 class="h3 mb-3 font-weight-normal text-center text-success">Update Profile</h1>
	      <div class="text-danger font-italic text-center pb-2">
	      </div>
	      
	      <label for="firstname" class="sr-only">First Name</label>
	      <div class="col-sm-4 mx-auto pb-3">
	      	<form:input path="firstName" type="text" id="firstname" class="form-control" placeholder="First Name" required="required"/>
	      </div>
	      <label for="lastname" class="sr-only">Last Name</label>
	      <div class="col-sm-4 mx-auto pb-3">
	      	<form:input path="lastName" type="text" id="lastname" class="form-control" placeholder="Last Name" required="required"/>
	      </div>
	      <label for="email" class="sr-only">Email</label>
	      <div class="col-sm-4 mx-auto pb-3">
	      	<form:input path="email" type="email" id="email" class="form-control" placeholder="Email" required="required"/>
	      </div>
	      
	      <label for="password" class="sr-only">Password</label>
	      <div class="col-sm-4 mx-auto pb-3">
	      	<form:input path="password" type="password" id="password" class="form-control" placeholder="Password" required="required"/>
	      </div>
	      
	      <label for="street" class="sr-only">Street</label>
	      <div class="col-sm-4 mx-auto pb-3">
	      	<form:input path="street" type="text" id="street" class="form-control" placeholder="Street" required="required"/>
	      </div>
	      
	      <label for="city" class="sr-only">City</label>
	      <div class="col-sm-4 mx-auto pb-3">
	      	<form:input path="city" type="text" id="city" class="form-control" placeholder="City" required="required"/>
	      </div>
	      
	      <label for="state" class="sr-only">State</label>
	      <div class="col-sm-4 mx-auto pb-3">
	      	<form:input path="state" type="text" id="state" class="form-control" placeholder="State" required="required"/>
	      </div>
	      
	      <label for="phonenumber" class="sr-only">Phone Number</label>
	      <div class="col-sm-4 mx-auto pb-3">
	      	<form:input path="phoneNumber" type="text" id="phonenumber" class="form-control" placeholder="Phone Number" required="required"/>
	      </div>
	      
	      
	      <div class="text-center">
	      <button class="btn btn-success flex-center" type="submit">Submit</button>
	      </div>
	      <p class="mt-5 mb-3 text-muted text-center">© 2017-2018</p>
	</form:form>

<script src="https://unpkg.com/ionicons@4.2.5/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>


</html>