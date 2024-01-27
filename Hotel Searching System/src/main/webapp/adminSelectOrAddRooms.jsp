<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
		System.out.println(hotel_owner);
	%>
	<h1>Welcome  <%= hotel_owner %></h1>
	<form action="editRoomsPage.jsp">
	    <input type="submit" id= "editRooms" value = "Edit Rooms">
	</form>

	<form action="checkAvailablePage.jsp">
	    <input type="submit" value = "Available Rooms">
	</form>
	
</body>
</html>