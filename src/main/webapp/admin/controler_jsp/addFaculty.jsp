<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="com.model.EFaculty" %>
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
	EFaculty faculty = new EFaculty();
	String fid = request.getParameter("fid");
	String name = request.getParameter("fname");
	String fclass = request.getParameter("fclass");
	
	if((fid == null || fid.length() == 0) ||
			   (name== null || name.length() == 0) ||
			   (fclass.equals("0")) ){
				
				response.sendRedirect("../faculty.jsp?error=Fields can't be empty");
				
			}else{
				faculty.setFacultyId(fid);
				faculty.setName(name);
				faculty.setFacultyClass(fclass);
				faculty.setDate(new Date());
				if(FacultyControler.addData(faculty)){
					response.sendRedirect("../faculty.jsp?success=Data Saved");
				}
			}
%>
</body>
</html>