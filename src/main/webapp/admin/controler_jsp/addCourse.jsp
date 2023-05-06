<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="com.model.ECourse" %>
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
	ECourse course = new ECourse();
	String cid = request.getParameter("courseId");
	String name = request.getParameter("courseName");
	
	if((cid == null || cid.length() == 0) ||
			   (name== null || name.length() == 0)){
				
				response.sendRedirect("../course.jsp?error=Fields can't be empty");
				
			}else{
				course.setCourseId(cid);
				course.setCourseName(name);
				course.setDate(new Date());
				if(CourseControler.addData(course)){
					response.sendRedirect("../course.jsp?success=Data Saved");
				}
			}
%>
</body>
</html>