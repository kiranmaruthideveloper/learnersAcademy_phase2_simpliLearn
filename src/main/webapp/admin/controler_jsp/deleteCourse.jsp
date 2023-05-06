<%@page import="org.hibernate.internal.build.AllowSysOut"%>
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
		System.out.println(CourseControler.isCourseMappedtoClass(cid));
		if(CourseControler.isCourseMappedtoClass(cid)){
			response.sendRedirect("../course.jsp?error=Can't delete this course, This Course is already mapped to a class. UnMap to delete!");	
			
		}else{
			if(CourseControler.remove(Integer.parseInt(cid))){
				response.sendRedirect("../course.jsp?success=Course Deleted!");
			}else{
				response.sendRedirect("../course.jsp?error=Faild to delete!");			
			}
		}
		
		
	
	%>
</body>
</html>