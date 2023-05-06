<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="com.model.EClasses" %>
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
	EClasses nclass = new EClasses();
	int id = Integer.parseInt(request.getParameter("class_id"));
	String className = request.getParameter("className");
	String courseId = request.getParameter("updated_course");
	
	if((courseId.equals("0")) ){
				
				response.sendRedirect("../classes.jsp?error=Select a valid class");
				
			}else{
				nclass.setId(id);
				nclass.setClassName(className);
				nclass.setCourseId(courseId);
				nclass.setDate(new Date());
				if(ClassControler.update(nclass)){
					response.sendRedirect("../classes.jsp?success=Class Updated");
				}
			}
%>
</body>
</html>