<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
</head>
<body>
    <h1>Search Results</h1>
    
    <table border="1">
        <tr>
            <th>Bedrooms</th>
            <th>Room Type</th>
            <th>Hall</th>
            <th>Washroom</th>
            <th>Room Number</th>
        </tr>
        
        <%
        	java.sql.ResultSet result = (java.sql.ResultSet) session.getAttribute("adminSearchResult");
			while (result.next()) {
	                String bedrooms = result.getString("bedrooms");
	                String roomType = result.getString("roomtype");
	                String hall = result.getString("hall");
	                String washroom = result.getString("washroom");
	                int roomNumber = result.getInt("roomNumber");
	                System.out.println("page: "+bedrooms+", "+roomType+", "+hall+", "+washroom+", "+roomNumber);
        %>
        <tr>
            <td><%= bedrooms %></td>
            <td><%= roomType %></td>
            <td><%= hall %></td>
            <td><%= washroom %></td>
            <td><%= roomNumber %></td>
        </tr>
        <%
                }
			result.close();
            %> 
    </table>
    
    <h1>Suggestions</h1>
    <table border="1">
        <tr>
            <th>Bedrooms</th>
            <th>Room Type</th>
            <th>Hall</th>
            <th>Washroom</th>
            <th>Room Number</th>
        </tr>
        
        <%
        	java.sql.ResultSet adminSuggestResult = (java.sql.ResultSet) session .getAttribute("adminSuggestResult");
				while (adminSuggestResult.next()) {
                String bedrooms = adminSuggestResult.getString("bedrooms");
                String roomType = adminSuggestResult.getString("roomtype");
                String hall = adminSuggestResult.getString("hall");
                String washroom = adminSuggestResult.getString("washroom");
                int roomNumber = adminSuggestResult.getInt("roomNumber");
        %>
        <tr>
            <td><%= bedrooms %></td>
            <td><%= roomType %></td>
            <td><%= hall %></td>
            <td><%= washroom %></td>
            <td><%= roomNumber %></td>
        </tr>
        <%
            }
				adminSuggestResult.close();
        %>
    </table>
</body>
</html>
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
    <link rel="stylesheet" href="CSS/selectResults.css">
</head>
<body>
    <h1>Search Results</h1>
    
    <table border="1">
        <tr>
            <th>Bedrooms</th>
            <th>Room Type</th>
            <th>Hall</th>
            <th>Washroom</th>
            <th>Room Number</th>
            <th></th> 
        </tr>
        
        <%
        	java.sql.ResultSet result = (java.sql.ResultSet) session.getAttribute("adminSearchResult");
			while (result.next()) {
	                String bedrooms = result.getString("bedrooms");
	                String roomType = result.getString("roomtype");
	                String hall = result.getString("hall");
	                String washroom = result.getString("washroom");
	                int roomNumber = result.getInt("roomNumber");
	                System.out.println("page: "+bedrooms+", "+roomType+", "+hall+", "+washroom+", "+roomNumber);
        %>
        <tr>
            <td><%= bedrooms %></td>
            <td><%= roomType %></td>
            <td><%= hall %></td>
            <td><%= washroom %></td>
            <td><%= roomNumber %></td>
            <td>
                <form action="adminPayment.jsp" method="post">
                    <input type="hidden" name="bedrooms" value="<%= bedrooms %>">
                    <input type="hidden" name="roomType" value="<%= roomType %>">
                    <input type="hidden" name="hall" value="<%= hall %>">
                    <input type="hidden" name="washroom" value="<%= washroom %>">
                    <input type="hidden" name="roomNumber" value="<%= roomNumber %>">
                    <input type="submit" value="Book">
                </form>
            </td>
        </tr>
        <%
                }
			result.close();
        %> 
    </table>
    
    <h1>Suggestions</h1>
    <table border="1">
        <tr>
            <th>Bedrooms</th>
            <th>Room Type</th>
            <th>Hall</th>
            <th>Washroom</th>
            <th>Room Number</th>
            <th></th>
        </tr>
        
        <%
        	java.sql.ResultSet adminSuggestResult = (java.sql.ResultSet) session.getAttribute("adminSuggestResult");
				while (adminSuggestResult.next()) {
                String bedrooms = adminSuggestResult.getString("bedrooms");
                String roomType = adminSuggestResult.getString("roomtype");
                String hall = adminSuggestResult.getString("hall");
                String washroom = adminSuggestResult.getString("washroom");
                int roomNumber = adminSuggestResult.getInt("roomNumber");
        %>
        <tr>
            <td><%= bedrooms %></td>
            <td><%= roomType %></td>
            <td><%= hall %></td>
            <td><%= washroom %></td>
            <td><%= roomNumber %></td>
            <td>
                <form action="adminPayment.jsp" method="post">
                    <input type="hidden" name="bedrooms" value="<%= bedrooms %>">
                    <input type="hidden" name="roomType" value="<%= roomType %>">
                    <input type="hidden" name="hall" value="<%= hall %>">
                    <input type="hidden" name="washroom" value="<%= washroom %>">
                    <input type="hidden" name="roomNumber" value="<%= roomNumber %>">
                    <input type="submit" value="Book">
                </form>
            </td>
        </tr>
        <%
            }
			adminSuggestResult.close();
        %>
    </table>
</body>
</html>
