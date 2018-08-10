<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Add/Edit</title>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	
</head>

<body>

	<form:form action="savePost" modelAttribute="post" method="POST" data-toggle="validator" role="form">
		  
		  <form:hidden path="book_id" />
		  
		  <div class = "text-center pt-5 pb-5">
	      	<ion-icon size="large" name="document"></ion-icon>
	      </div>
	      <h1 class="h3 mb-3 font-weight-normal text-center text-success">Add/Edit Post</h1>
	      <div class="text-danger font-italic text-center pb-2">
	      </div>
	      
	      <label for="book_isbn" class="sr-only">Book ISBN</label>
	      <div class="col-sm-4 mx-auto pb-3">
	      	<form:input path="book_isbn" type="text" id="book_isbn" class="form-control" placeholder="Book ISBN" required="required"/>
	      </div>
	      <label for="author" class="sr-only">Author</label>
	      <div class="col-sm-4 mx-auto pb-3">
	      	<form:input path="author" type="text" id="author" class="form-control" placeholder="Author" required="required"/>
	      </div>
	      <label for="title" class="sr-only">Title</label>
	      <div class="col-sm-4 mx-auto pb-3">
	      	<form:input path="title" type="text" id="title" class="form-control" placeholder="Title" required="required"/>
	      </div>
	      <label for="course_code" class="sr-only">Course Code</label>
	      <div class="col-sm-4 mx-auto pb-3">  
	         <div class="input-group mb-3">
	  			<div class="input-group-prepend">
	   				 <label class="input-group-text" for="inputGroupSelect01">Course Code</label>
	  			</div>
	  			<form:select path="course_code" class="custom-select form-control" id="inputGroupSelect01" required="required">
	    			
	    			<form:option value="ECON">ECON</form:option>
	    			<form:option value="BIOL">BIOL</form:option>
	    			<form:option value="CS">CS</form:option>
	  			</form:select>
			 </div>
		 </div>
	      <label for="course_number" class="sr-only">Course Number</label>
	      <div class="col-sm-4 mx-auto pb-3">
	      	<form:input path="course_number" type="number" id="course_number" class="form-control" placeholder="CourseNumber" required="required"/>
	      </div>
	      
	      <label for="professor" class="sr-only">Professor</label>
	      <div class="col-sm-4 mx-auto pb-3">
	      	<form:input path="professor" type="text" id="professor" class="form-control" placeholder="Professor" required="required"/>
	      </div>
	      
	      <label for="department" class="sr-only">Department</label>
	      <div class="col-sm-4 mx-auto pb-3">  
	         <div class="input-group mb-3">
	  			<div class="input-group-prepend">
	   				 <label class="input-group-text" for="inputGroupSelect01">Department</label>
	  			</div>
	  			<form:select path="department" class="custom-select form-control" id="inputGroupSelect01" required="required">
	    			
	    			<form:option value="English">English</form:option>
	    			<form:option value="Anthropology">Anthropology</form:option>
	    			<form:option value="Cognitive Science">Cognitive Science</form:option>
	  			</form:select>
			 </div>
		 </div>
		 
		 <div class="input-group mb-3 col-sm-4 mx-auto pb-3">
  			<div class="input-group-prepend">
    			<span class="input-group-text">$</span>
    			<span class="input-group-text">0.00</span>
  			</div>
  		<label for="price" class="sr-only">Price</label>
  		<form:input path="price" type="text" class="form-control" id="price" placeholder="Price" required="required" aria-label="Amount (to the nearest dollar)" />
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