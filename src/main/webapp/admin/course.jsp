<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
 <%@ page import="com.model.*" %>
 <%@ page import="com.controler.*" %>
 <%@ page import="java.util.*" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Course</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

</head>
<body>
	<div class="container">
		<div class="text-center">
				<% 
			
				String errorResp = request.getParameter("error");
				String successResp = request.getParameter("success");
			
				if(errorResp!=null){%>
					<div class="alert alert-danger" role="alert">
					  <%=errorResp %>
					</div>
				<%}
				if(successResp!=null){%>
					<div class="alert alert-success" role="alert">
						<%=successResp %>
					</div>
				<%}
				
				%>
		</div>
	
	<div class="container text-center border-1">
		<h1 class="text-center">Add Course</h1>
		<form action="controler_jsp/addCourse.jsp" method="post">
			Course Id: <input type="text" name="courseId">
			Course Name: <input type="text" name="courseName">
			
			<input type="submit">
		</form>
	</div>
	<br />
	
		<div>
			<h1 class="text-center">list of Courses!</h1>
		</div>
		<div>
			<table class="table">
			  <thead class="thead-dark">
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">Course Id</th>
			      <th scope="col">Name Name</th>
			      <th scope="col"></th>
			    </tr>
			  </thead>
			  <tbody>
			  	<%
			  		List<ECourse> courseList = CourseControler.getCourses();
			  		int cc = 1;
			  	
			  		for(ECourse cl: courseList){
			  	%>
			    <tr>
			      <th scope="row"><%=cc++ %></th>
			      <td>
			      	<%=cl.getCourseId() %>
			      </td>
			      <td>
			      	<%=cl.getCourseName() %>
			      </td>
			      <td><a href="controler_jsp/deleteCourse.jsp?cid=<%=cl.getCourseId()%>">Remove</a></td>
			    </tr>
			    <%} %>
			  </tbody>
			</table>
		
		</div>
	</div>
</body>
</html>