package com.ayo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class GetRoomsJDBC {

	public ResultSet values(String email) {

		ResultSet resultSet = null;
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		    String url = "jdbc:mysql://localhost/AYO", user1 = "root" ,pass1 = "toor";
		    Connection con = DriverManager.getConnection(url, user1, pass1);
		    String query = "SELECT * FROM details_of_hotels WHERE email = ?";
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
