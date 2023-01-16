<%@ page import ="com.cisco.model.Alien" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% 
		Alien a=(Alien) request.getAttribute("fetchalien");
		out.println(a);
	%>
	in show alien
</body>
</html>