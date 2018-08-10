<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Register</title>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	
</head>

<body>

	<form:form action="saveUser" modelAttribute="user" method="POST" data-toggle="validator" role="form">
		  
		  <form:hidden path="id" />
		  
		  <div class = "text-center pt-5 pb-5">
	      	<ion-icon size="large" name="document"></ion-icon>
	      </div>
	      <h1 class="h3 mb-3 font-weight-normal text-center text-success">Please register</h1>
	      <div class="text-danger font-italic text-center pb-2">
	      ${register_error}
	      </div>
	      <label for="inputEmail" class="sr-only">Email address</label>
	      <div class="col-sm-4 mx-auto pb-3">
	      	<form:input path="email" type="email" id="inputEmail" class="form-control" placeholder="Email address" required="required" autofocus=""/>
	      </div>
	      <label for="inputPassword" class="sr-only">Password</label>
	      <div class="col-sm-4 mx-auto pb-3">
	      	<form:input path="password" type="password" id="inputPassword" class="form-control" placeholder="Password" required="required"/>
	      </div>
	      <label for="firstName" class="sr-only">First Name</label>
	      <div class="col-sm-4 mx-auto pb-3">
	      	<form:input path="firstName" type="text" id="firstName" class="form-control" placeholder="First Name" required="required"/>
	      </div>
	      <label for="lastName" class="sr-only">Last Name</label>
	      <div class="col-sm-4 mx-auto pb-3">
	      	<form:input path="lastName" type="text" id="lastName" class="form-control" placeholder="Last Name" required="required"/>
	      </div>
	      <div class="checkbox mb-3 text-center">
	        <label>
	          <input type="checkbox" value="remember-me"> Remember me
	        </label>
	      </div>
	      <div class="text-center">
	      <button class="btn btn-success flex-center" type="submit">Register</button>
	      </div>
	      <p class="mt-5 mb-3 text-muted text-center">� 2017-2018</p>
	</form:form>

<script src="https://unpkg.com/ionicons@4.2.5/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>


</html>