<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="com.model.EStudent" %>
<%@page import="java.util.*" %>
<%@page import="com.controler.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Loading...</title>
</head>
<body>
<%
	EStudent student = new EStudent();
	int id = Integer.parseInt(request.getParameter("student_id"));
	String roll = request.getParameter("student_roll");
	String name = request.getParameter("student_name");
	String sClass = request.getParameter("updated_class");
	
	if(sClass.equals("0")){
		
		response.sendRedirect("../student.jsp?error=Select a valid Class");
		
	}else{
		student.setId(id);
		student.setRoll(roll);
		student.setName(name);
		student.setsClass(sClass);
		student.setDate(new Date());
		if(StudentControler.update(student)){
			response.sendRedirect("../student.jsp?success=Data Updated");
		}
	}

%>
</body>
</html>