<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hotel Search Results</title>
    <link rel="stylesheet" href="CSS/selectResults.css">
</head>
<body>
	<div>
    	<h1>Hotel Search Results</h1>
    </div>
    <table border="1">
        <tr>
            <th>Hotel Name</th>
            <th>Address</th>
            <th>Room Number</th>
            <th></th>
        </tr>
        
        <%
            java.sql.ResultSet hotels = (java.sql.ResultSet) request.getAttribute("hotels");
            
            while (hotels.next()) {
                String hotelName = hotels.getString("hotel_name");
                String address = hotels.getString("address");
                int roomNumber = hotels.getInt("roomNumber");
        %>
        <tr>
            <td><%= hotelName %></td>
            <td><%= address %></td>
            <td><%= roomNumber %></td>
            <td>
                <form method="post" action="book.jsp">
                    <input type="hidden" name="hotelName" value="<%= hotelName %>">
                    <input type="hidden" name="address" value="<%= address %>">
                    <input type="hidden" name="roomNumber" value="<%= roomNumber%>"> 
                    <input type="submit" value="Book">
                </form>
            </td>
        </tr>
        <%
            }
            hotels.close();
        %>        
    </table>
    
</body>
</html>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hotel Search Results</title>
    <link rel="stylesheet" href="CSS/selectResults.css">
</head>
<body>
    <!-- Wrap the table and header in separate divs -->
    <div class="header">
        <h1>Hotel Search Results</h1>
    </div>
    <div class="table-container">
        <table border="1">
        
            <tr>
                <th>Hotel Name</th>
                <th>Address</th>
                <th>Room Number</th>
                <th></th>
            </tr>
            
            <%
                java.sql.ResultSet hotels = (java.sql.ResultSet) request.getAttribute("hotels");
                
                while (hotels.next()) {
                    String hotelName = hotels.getString("hotel_name");
                    String address = hotels.getString("address");
                    int roomNumber = hotels.getInt("roomNumber");
            %>
            <tr>
                <td><%= hotelName %></td>
                <td><%= address %></td>
                <td><%= roomNumber %></td>
                <td>
                    <form method="post" action="book.jsp">
                        <input type="hidden" name="hotelName" value="<%= hotelName %>">
                        <input type="hidden" name="address" value="<%= address %>">
                        <input type="hidden" name="roomNumber" value="<%= roomNumber%>"> 
                        <input type="submit" value="Book">
                    </form>
                </td>
            </tr>
            <%
                }
                hotels.close();
            %>        
        </table>
    </div>
</body>
</html>

--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hotel Search Results</title>
    <link rel="stylesheet" href="CSS/selectResults.css">
</head>
<body>
    <div class="header">
        <h1>Hotel Search Results</h1>
    </div>
    <div class="table-container">
        <table border="1">
        
            <tr>
                <th>Hotel Name</th>
                <th>Address</th>
                <th>Room Number</th>
                <th></th>
            </tr>
            
            <%
                java.sql.ResultSet hotels = (java.sql.ResultSet) request.getAttribute("hotels");
                
                while (hotels.next()) {
                    String hotelName = hotels.getString("hotel_name");
                    String address = hotels.getString("address");
                    int roomNumber = hotels.getInt("roomNumber");
                    System.out.println(hotelName+", "+address+", "+roomNumber);
            %>
            <tr>
                <td><%= hotelName %></td>
                <td><%= address %></td>
                <td><%= roomNumber %></td>
                <td>
                    <form method="post" action="payment">
                        <input type="hidden" name="hotelName" value="<%= hotelName %>">
                        <input type="hidden" name="address" value="<%= address %>">
                        <input type="hidden" name="roomNumber" value="<%= roomNumber%>">
                        <input type="submit" value="Book">
                    </form>
                </td>
            </tr>
            <%
                }
                hotels.close();
            %>        
        </table>
    </div>
    <div id = "head2">
        <h2>Suggestions</h2>
     </div>
        <div class="suggestions-container">
        <table border="1">
            <tr>
                <th>Hotel Name</th>
                <th>Address</th>
                <th>Room Number</th>
                <th></th>
            </tr>
         <%
                java.sql.ResultSet suggestHotel = (java.sql.ResultSet) request.getAttribute("suggestHotel");
                
                while (suggestHotel.next()) {
                    String suggestionHotelName = suggestHotel.getString("hotel_name");
                    String suggestionAddress = suggestHotel.getString("address");
                    int suggestionRoomNumber = suggestHotel.getInt("roomNumber");
            %>   
            <tr>
                <td><%= suggestionHotelName %></td>
                <td><%= suggestionAddress %></td>
                <td><%= suggestionRoomNumber %></td>
                <td>
                    <form method="post" action="payment">
                        <input type="hidden" name="hotelName" value="<%= suggestionHotelName %>">
                        <input type="hidden" name="address" value="<%= suggestionAddress %>">
                        <input type="hidden" name="roomNumber" value="<%= suggestionRoomNumber %>"> 
                        <input type="submit" value="Book">
                    </form>
                </td>
            </tr>
            <%
                }
                suggestHotel.close();
            %> 
        </table>
    </div>
</body>
</html>
