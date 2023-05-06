<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "org.hibernate.SessionFactory" %>
<%@ page import = "org.hibernate.Session" %>
<%@ page import = "com.controler.ValidateLogin" %>

<jsp:useBean id= "login" class="com.controler.ValidateLogin"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String uname = request.getParameter("uname");
String password = request.getParameter("password");

String validationRsp = login.validateUser(uname, password);
if(validationRsp == "1"){
	response.sendRedirect("./dashboard.jsp");
}else if(validationRsp == "0"){
	response.sendRedirect("../index.jsp?error=Invalid Login");
}else{
	response.sendRedirect("../index.jsp?error="+validationRsp);	
}
	


%>
</body>
</html>