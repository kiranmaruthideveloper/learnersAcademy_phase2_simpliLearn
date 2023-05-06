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
	int id = Integer.parseInt(request.getParameter("faculty_uid"));
	String fid = request.getParameter("faculty_id");
	String name = request.getParameter("faculty_name");
	String fclass = request.getParameter("updated_class");
	
	if((fclass.equals("0")) ){
				
				response.sendRedirect("../faculty.jsp?error=not a valid class");
				
			}else{
				faculty.setId(id);
				faculty.setFacultyId(fid);
				faculty.setName(name);
				faculty.setFacultyClass(fclass);
				faculty.setDate(new Date());
				if(FacultyControler.update(faculty)){
					response.sendRedirect("../faculty.jsp?success=Data Saved");
				}
			}
%>
</body>
</html>