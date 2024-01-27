<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="CSS/adminSOrR.css">
</head>
<body>
	<%
		String hotel_owner = (String) session.getAttribute("hotel_owner");
	%>
	<h1>Welcome  <%= hotel_owner %></h1>
	<form action="addRooms.jsp">
	    <input type="submit" id= "addRooms" value = "Add Rooms">
	</form>

	<form action="deleteRooms">
	    <input type="submit" value = "Delete Rooms">
	</form>
</body>
</html>