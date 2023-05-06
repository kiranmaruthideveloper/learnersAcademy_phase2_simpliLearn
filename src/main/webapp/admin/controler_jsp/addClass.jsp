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
	EClasses nClass = new EClasses();
	String cName = request.getParameter("ClassName");
	String mCourse = request.getParameter("mappedCourse");
	
	if((cName== null || cName.length() == 0) ||
			   (mCourse.equals("0")) ){
				
				response.sendRedirect("../classes.jsp?error=Fields can't be empty");
				
			}else{
				nClass.setClassName(cName);
				nClass.setCourseId(mCourse);
				nClass.setDate(new Date());
				if(ClassControler.addData(nClass)){
					response.sendRedirect("../classes.jsp?success=Data Saved");
				}
			}
%>
</body>
</html>