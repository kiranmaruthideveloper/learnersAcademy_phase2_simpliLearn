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
		String stid = request.getParameter("stid");
		if(StudentControler.remove(Integer.parseInt(stid))){
			response.sendRedirect("../student.jsp?success=Student Deleted!");
		}else{
			response.sendRedirect("../student.jsp?error=Faild to delete!");			
		}
		
	
	%>
</body>
</html>