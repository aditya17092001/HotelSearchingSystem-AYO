package com.ayo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SuggestionRoomJDBC {

		public ResultSet values(String states, String district, int bedrooms, String roomtype, String hall, String washroom) {
		ResultSet resultSet = null;
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		    String url = "jdbc:mysql://localhost/AYO", user1 = "root" ,pass1 = "toor";
		    Connection con = DriverManager.getConnection(url, user1, pass1);
		    String query = "SELECT hotel_name, address, roomNumber, district FROM details_of_hotels WHERE state = ? AND district = ? AND bedrooms = ?";
		    PreparedStatement ps=con.prepareStatement(query);
		    ps.setString(1, states);
		    ps.setString(2, district);
		    ps.setInt(3, bedrooms);
		    resultSet = ps.executeQuery();
		}
		catch(Exception e) 
		{
			System.out.println(e);
		}
		return resultSet;
	}

}


