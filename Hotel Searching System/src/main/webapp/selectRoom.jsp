<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select Rooms</title>
    <link rel="stylesheet" href="CSS/selectRooms.css">
</head>

<body>
	<%if(session.getAttribute("password")==null && session.getAttribute("email") == null) { response.sendRedirect("login.jsp"); return ; } %>
    <form action="selectRoom" method ="get">
        <table>
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
                <td><label>Need a Common Sharing Hall:</label></td>
                <td>
                    <input type="radio" id="yes" name="hall" value="Yes">
                    <label for="yes">Yes</label>
                    <input type="radio" id="no" name="hall" value="No">
                    <label for="no">No</label>
                </td>
            </tr>
            <tr>
                <td><label>Select Washroom:</label></td>
                <td>
                    <select name="washroom" id="washroom">
                        <option value="1_for_each_bedroom">1 for each bedroom</option>
                        <option value="common">Common sharing washroom</option>
                    </select>
                </td>
            </tr>
        </table>
        <input type="submit" value="Show Rooms">
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