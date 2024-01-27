<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Rooms</title>
        <link rel="stylesheet" href="CSS/selectResults.css">
</head>
<body>
    <h1>Delete Rooms</h1>
<% if (request.getParameter("deleteSuccess") != null) { %>
    <p style="color: green;">Deletion was successful.</p>
<% } else if (request.getParameter("deleteError") != null) { %>
    <p style="color: red;">Error occurred during deletion.</p>
<% } %>
    
    
    <table border="1">
        <tr>
            <th>State</th>
            <th>District</th>
            <th>Bedrooms</th>
            <th>Room Type</th>
            <th>Hall</th>
            <th>Washroom</th>
            <th>Room Number</th>
            <th>Phone Number</th>
            <th>Action</th>
        </tr>
        
        <%
        	java.sql.ResultSet result = (java.sql.ResultSet) session.getAttribute("deleteRooms");
			while (result.next()) {
                String state = result.getString("state");
                String district = result.getString("district");
                String bedrooms = result.getString("bedrooms");
                String roomType = result.getString("roomtype");
                String hall = result.getString("hall");
                String washroom = result.getString("washroom");
                int roomNumber = result.getInt("roomNumber");
                String phoneNumber = result.getString("phone_number");
        %>
        <tr>
            <td><%= state %></td>
            <td><%= district %></td>
            <td><%= bedrooms %></td>
            <td><%= roomType %></td>
            <td><%= hall %></td>
            <td><%= washroom %></td>
            <td><%= roomNumber %></td>
            <td><%= phoneNumber %></td>
            <td>
                <form action="DeleteDataServlet" method="post">
                    <input type="hidden" name="state" value="<%= state %>">
                    <input type="hidden" name="district" value="<%= district %>">
                    <input type="hidden" name="bedrooms" value="<%= bedrooms %>">
                    <input type="hidden" name="roomtype" value="<%= roomType %>">
                    <input type="hidden" name="hall" value="<%= hall %>">
                    <input type="hidden" name="washroom" value="<%= washroom %>">
                    <input type="hidden" name="roomNumber" value="<%= roomNumber %>">
                    <input type="hidden" name="phone_number" value="<%= phoneNumber %>">
                    <input type="submit" value="Delete">
                </form>
            </td>
        </tr>
        <%
            }
        %> 
    </table>
</body>
</html>
