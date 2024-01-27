<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="CSS/checkAvailable.css">
</head>
<body>	
	<form action="showAvailableRooms" method ="get">
		 <table>
		 	<tr>
                <td><label for="bedrooms">Select Bedrooms:</label></td>
                <td>
                    <select name="bedrooms" id="">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="room-type">Select Room Type:</label></td>
                <td>
                    <select id="room-type" name="roomtype">
                        <option value="ac">AC Room</option>
                        <option value="non-ac">Non-AC Room</option>
                    </select>
                </td>
            </tr>
             <tr>
                <td><label>Common Sharing Hall:</label></td>
                <td>
                    <input type="radio" id="yes" name="hall" value="Yes">
                    <label for="yes">Yes</label>
                    <input type="radio" id="no" name="hall" value="No">
                    <label for="no">No</label>
                </td>
            </tr>
              <tr>
                <td><label>Washroom:</label></td>
                <td>
                    <select name="washroom" id="washroom">
                        <option value="1_for_each_bedroom">1 for each bedroom</option>
                        <option value="common">Common sharing washroom</option>
                    </select>
                </td>
            </tr>
		 </table>
		 <input type="submit" value="Search">
	</form>
</body>
</html>