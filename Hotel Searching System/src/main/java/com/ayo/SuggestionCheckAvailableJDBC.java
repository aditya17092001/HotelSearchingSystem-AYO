package com.ayo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SuggestionCheckAvailableJDBC {
	public ResultSet values(String bedrooms, String roomtype, String hall, String washroom, String email) {
		ResultSet resultSet = null;
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		    String url = "jdbc:mysql://localhost/AYO", user1 = "root" ,pass1 = "toor";
		    Connection con = DriverManager.getConnection(url, user1, pass1);
		    String query = "SELECT bedrooms, roomtype, hall, washroom, roomNumber FROM details_of_hotels WHERE email = ?";
		    PreparedStatement ps=con.prepareStatement(query);
		    ps.setString(1, email);
		    resultSet = ps.executeQuery();
		}
		catch(Exception e) 
		{
			System.out.println(e);
		}
		return resultSet;
	}
}
