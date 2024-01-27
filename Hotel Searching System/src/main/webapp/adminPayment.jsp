<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="CSS/selectResults.css">
</head>
<body>
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