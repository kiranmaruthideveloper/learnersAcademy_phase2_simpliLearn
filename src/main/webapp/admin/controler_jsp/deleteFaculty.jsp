<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.controler.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Deleting...</title>
</head>
<body>
	<%
		String stid = request.getParameter("fcid");
		if(FacultyControler.remove(Integer.parseInt(stid))){
			response.sendRedirect("../faculty.jsp?success=Student Deleted!");
		}else{
			response.sendRedirect("../faculty.jsp?error=Faild to delete!");			
		}
		
	
	%>
</body>
</html>