<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
 <%@ page import="com.model.*" %>
 <%@ page import="com.controler.*" %>
 <%@ page import="java.util.*" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Classes</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

</head>
<body>
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
		<h1 class="text-center">Add Class</h1>
		<form action="controler_jsp/addClass.jsp" method="post">
			Class Name: <input type="text" name="ClassName">
			Map to Course:
			<select name="mappedCourse">
				<option value="0">Select a Course</option>
				<%
					List<ECourse> courseList = CourseControler.getCourses();
				
					for(ECourse course:courseList){
				%>
				<option value="<%= course.getCourseId() %>"><%= course.getCourseName() %></option>
				<%} %>
			</select>
			<input type="submit">
		</form>
	</div>
	<br />
	<div class="container">
		<div>
			<h1 class="text-center">list of Classes Enrolled!</h1>
		</div>
		<div>
			<table class="table">
			  <thead class="thead-dark">
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">Class Id</th>
			      <th scope="col">Class Name</th>
			      <th scope="col">Course ID</th>
			      <th scope="col">Course Name</th>
			      <th scope="col">Update Course</th>
			      <th scope="col"></th>
			      <th scope="col"></th>
			    </tr>
			  </thead>
			  <tbody>
			  	<%
			  		try{
			  			
			  		List<EClasses> classList = ClassControler.getClasses();
			  		int cc = 1;
			  	
			  		for(EClasses cl: classList){
			  	%>
			    <tr>
			    <form method="POST" action="controler_jsp/updateClass.jsp">
			      <th scope="row"><%=cc++ %></th>
			      <td>
			      	<%=cl.getId() %>
			      	<input type="text" value="<%=cl.getId() %>" name="class_id" hidden=true>
			      </td>
			      <td>
			      	<%=cl.getClassName() %>
			      	<input type="text" value="<%=cl.getClassName() %>" name="className" hidden=true>
			      </td>
			      <td>
			      	<%=cl.getCourseId() %>
			      </td>
			      <td>
			      	<%=CourseControler.getCoursesById(cl.getCourseId()).getCourseName() %>
			      </td>
				  <td>
				     <select name="updated_course">
				      	<option value="0"><%=CourseControler.getCoursesById(cl.getCourseId()).getCourseName() %></option>
				      	<%
							List<ECourse> courseList1 = CourseControler.getCourses();
						
							for(ECourse course:courseList1){
						%>
							<option value="<%= course.getCourseId() %>"><%= course.getCourseName() %></option>
						<%} %>
				     </select>
			     </td>
				<td>
					<input type="submit" value="Update">
				</td>
			</form>
			      <td><a href="controler_jsp/deleteClass.jsp?cid=<%=cl.getId() %>">Remove</a></td>
			    </tr>
			    <%} 
			  	}catch(Exception e){}
			    
			    %>
			  </tbody>
			</table>
		
		</div>
	</div>
</body>
</html>