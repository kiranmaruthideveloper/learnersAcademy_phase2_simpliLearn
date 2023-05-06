<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin - Learners Academy</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body class="mt-5">
	<div>
		<% 
			if(request.getParameter("error")!=null){
				out.println("<h5>"+request.getParameter("error")+"</h5>");
			}
		%>
	</div>
	<div class="container">
		<form action="admin/login.jsp" method="post">
		  <!-- Email input -->
		  <div class="form-outline mb-4">
		    <input type="email" id="form2Example1" class="form-control" name="uname"/>
		    <label class="form-label" for="form2Example1" >Email address</label>
		  </div>
		
		  <!-- Password input -->
		  <div class="form-outline mb-4">
		    <input type="password" id="form2Example2" class="form-control" name="password"/>
		    <label class="form-label" for="form2Example2" >Password</label>
		  </div>
		
		  
		  <!-- Submit button -->
		  <button type="submit" class="btn btn-primary btn-block mb-4">Sign in</button>
		
		</form>
	</div>
</body>
</html>