<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Room Information</title>
    <link rel="stylesheet" href="CSS/addRooms.css">
</head>
<body>
    <h1>Add Rooms</h1>
    <form action="addRoomsAdmin" method ="post">
    <p id="updateMessage" style="color: green;">
                <% String updateMessage = (String) request.getAttribute("updateMessage");
                if (updateMessage != null && !updateMessage.isEmpty()) {
                    out.print(updateMessage);
                } %>
     </p>
     <p id="updateErrorMessage" style="color: red;">
                <% String updateErrorMessage = (String) request.getAttribute("updateErrorMessage");
                if (updateErrorMessage != null && !updateErrorMessage.isEmpty()) {
                    out.print(updateErrorMessage);
                } %>
     </p>
    <table border="1">
        <tr>
                <td><label for="states">Select a State:</label></td>
                <td>
                    <select id="states" name="states" onchange="populateDistricts()">
                        <option value="">Select a state</option>
                        <option value="Andhra Pradesh">Andhra Pradesh</option>
                        <option value="Telangana">Telangana</option>
                        <option value="Karnataka">Karnataka</option>
                    </select>
                </td>
            </tr>
        <tr>
                <td><label for="districts">Select a District:</label></td>
                <td>
                    <select id="districts" name="districts"></select>
                </td>
        </tr>
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
        <tr>
            <td><label for="roomNumber">Room Number:</label></td>
            <td><input type="text" id="roomNumber" name="roomNumber" required></td>
        </tr>
    </table>
    <input type="submit" value="Add">

    </form>
 <script>
        const districtsByState = {
            "Andhra Pradesh": [
                "Chittoor",
                "East Godavari",
                "Guntur",
                "Srikakulam",
                "Visakhapatnam",
                "Vizianagaram",
                "West Godavari",
            ],
            "Telangana": [
                "Adilabad",
                "Hyderabad",
                "Kamareddy",
                "Karimnagar",
                "Khammam",
                "Mahabubnagar",
                "Medak",
                "Medchal-Malkajgiri",
                "Nizamabad",
                "Rangareddy",
                "Sangareddy",
                "Siddipet",
                "Vikarabad",
                "Warangal Rural",
                "Warangal Urban",
                "Yadadri Bhuvanagiri"
            ],
            "Karnataka": [
                "Ballari",
                "Belagavi",
                "Bengaluru Rural",
                "Bengaluru Urban",
                "Bidar",
                "Chikballapur",
                "Chikkamagaluru",
                "Dharwad",
                "Kalaburagi",
                "Mysuru",
                "Raichur",
                "Shivamogga",
                "Udupi",
                "Vijayapura",
            ]
        };


        function populateDistricts() {
            const stateDropdown = document.getElementById("states");
            const districtsDropdown = document.getElementById("districts");
            const selectedState = stateDropdown.value;

            districtsDropdown.innerHTML = "";

            if (selectedState !== "") {
                const districts = districtsByState[selectedState];
                for (const district of districts) {
                    const option = document.createElement("option");
                    option.text = district;
                    districtsDropdown.appendChild(option);
                }
            }
        }
    </script>
</body>
</html>
