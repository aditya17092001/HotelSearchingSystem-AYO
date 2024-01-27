<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Page</title>
    <link rel="stylesheet" href="CSS/payment.css">
</head>
<body>
    <h1>Payment Page</h1>
    
    <table border="1">
        <tr>
            <th>Email</th>
            <th>Hotel Name</th>
            <th>Address</th>
            <th>State</th>
            <th>District</th>
            <th>Bedrooms</th>
            <th>Room Type</th>
            <th>Hall</th>
            <th>Washroom</th>
            <th>Room Number</th>
        </tr>
        
        <%
            java.sql.ResultSet finalPaymentData = (java.sql.ResultSet) request.getAttribute("finalPaymentData");
            
            
            while (finalPaymentData.next()) {
                String email = finalPaymentData.getString("email");
                String hotelName = finalPaymentData.getString("hotel_name");
                String address = finalPaymentData.getString("address");
                String state = finalPaymentData.getString("state");
                String district = finalPaymentData.getString("district");
                int bedrooms = finalPaymentData.getInt("bedrooms");
                String roomType = finalPaymentData.getString("roomtype");
                String hall = finalPaymentData.getString("hall");
                String washroom = finalPaymentData.getString("washroom");
                int roomNumber = finalPaymentData.getInt("roomNumber");
        %>
        <tr>
            <td><%= email %></td>
            <td><%= hotelName %></td>
            <td><%= address %></td>
            <td><%= state %></td>
            <td><%= district %></td>
            <td><%= bedrooms %></td>
            <td><%= roomType %></td>
            <td><%= hall %></td>
            <td><%= washroom %></td>
            <td><%= roomNumber %></td>
        </tr>
        <%
            }
            finalPaymentData.close();
        %>
    </table>
    <h1> Please Enter the card details!</h1>
    <div id = "paymentdiv">
    <table border="1">
        <tr>
            <td id = "td">
                <form action="succesfull.jsp" method="post">
                    <table>
                        <tr>
                            <td><label for="card_number">Card Number:</label></td>
                            <td><input type="text" id="card_number" name="card_number" required></td>
                        </tr>
                        <tr>
                            <td><label for="expiration_date">Expiration Date:</label></td>
                            <td><input type="text" id="expiration_date" name="expiration_date" placeholder="MM/YYYY" required></td>
                        </tr>
                        <tr>
                            <td><label for="cvv">CVV:</label></td>
                            <td><input type="text" id="cvv" name="cvv" required></td>
                        </tr>
                        <tr>
                            <td><label for="amount">Amount:</label></td>
                            <td><input type="text" id="amount" name="amount" required></td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="submit" value="Pay Now"></td>
                        </tr>
                    </table>
                </form>
            </td>
        </tr>
    </table>
    </div>
</body>
</html>
