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
		String cid = request.getParameter("cid");
		if(ClassControler.isClassMappedToFacultyOrStudent(cid)){
			response.sendRedirect("../classes.jsp?error=Can't delete this Class, This Course is already mapped to a student/ Teacher. UnMap to delete!");
		}else{
			
			if(ClassControler.remove(Integer.parseInt(cid))){
				response.sendRedirect("../classes.jsp?success=Class Deleted!");
			}else{
				response.sendRedirect("../classes.jsp?error=Faild to delete!");			
			}
		}
		
	
	%>
</body>
</html>