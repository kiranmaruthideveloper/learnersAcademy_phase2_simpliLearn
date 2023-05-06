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
	String roll = request.getParameter("roll");
	String name = request.getParameter("name");
	String sClass = request.getParameter("class");
	
	if((roll == null || roll.length() == 0) ||
	   (name== null || name.length() == 0) ||
	   (sClass.equals("0")) ){
		
		response.sendRedirect("../student.jsp?error=Fields can't be empty");
		
	}else{
		student.setRoll(roll);
		student.setName(name);
		student.setsClass(sClass);
		student.setDate(new Date());
		if(StudentControler.addData(student)){
			response.sendRedirect("../student.jsp?success=Data Saved");
		}
	}

%>
</body>
</html>