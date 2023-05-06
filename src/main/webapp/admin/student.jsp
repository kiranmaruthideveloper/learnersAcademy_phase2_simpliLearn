<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
 <%@ page import="com.model.*" %>
 <%@ page import="com.controler.*" %>
 <%@ page import="java.util.*" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Students</title>
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
		<h1 class="text-center">Add Student</h1>
		<form action="controler_jsp/studentControler.jsp" method="post">
			Roll: <input type="text" name="roll">
			Name: <input type="text" name="name">
			Class:
			<select name="class">
				<option value="0">Select a class</option>
				<%
					List<EClasses> classList = ClassControler.getClasses();
				
					for(EClasses cls: classList){
				%>
				<option value="<%=cls.getId() %>"><%=cls.getClassName() %></option>
				<%} %>
			</select>
			<input type="submit">
		</form>
	</div>
	<br />
	<div class="container">
		<div>
			<h1 class="text-center">list of Students Enrolled!</h1>
		</div>
		<div>
			<table class="table">
			  <thead class="thead-dark">
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">Roll</th>
			      <th scope="col">Name</th>
			      <th scope="col">Class</th>
			      <th scope="col">Update Class</th>
			      <th scope="col"></th>
			      <th scope="col"></th>
			    </tr>
			  </thead>
			  <tbody>
			  	<%
			  		List<EStudent> studentList = StudentControler.getStudents();
			  		int cc = 1;
			  	
			  		for(EStudent st: studentList){
			  	%>
			    <tr>
			    <form method="POST" action="controler_jsp/updateStudent.jsp">
			      <th scope="row"><%=cc++ %></th>
			      <td>
			      	<%=st.getRoll() %>
			      	<input type="text" value="<%=st.getRoll() %>" name="student_roll" hidden=true>
			      </td>
			      <td>
			      	<%=st.getName() %>
			      	<input type="text" value="<%=st.getName() %>" name="student_name" hidden=true>
			      </td>
			      <td><%=ClassControler.getClassesById(st.getsClass()).getClassName() %></td>
				  <td>
				     <select name="updated_class">
				      	<option value="0"><%=ClassControler.getClassesById(st.getsClass()).getClassName() %></option>
				      	<%
							List<EClasses> classList1 = ClassControler.getClasses();
				      	
						
							for(EClasses cls: classList1){
						%>
						<option value="<%=cls.getId() %>"><%=cls.getClassName() %></option>
						<%} %>
				     </select>
			     </td>
				<td>
					<input type="text" value="<%=st.getId() %>" name="student_id" hidden=true>
					<input type="submit" value="Update">
				</td>
			</form>
			      <td><a href="controler_jsp/deleteStudent.jsp?stid=<%=st.getId() %>">Remove</a></td>
			    </tr>
			    <%} %>
			  </tbody>
			</table>
		
		</div>
	</div>
</body>
</html>