package com.ayo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PaymentJDBC {

	public ResultSet values(String hotelName, String address, String roomNumber, String district) {
		ResultSet resultSet = null;
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		    String url = "jdbc:mysql://localhost/AYO", user1 = "root" ,pass1 = "toor";
		    Connection con = DriverManager.getConnection(url, user1, pass1);
		    System.out.println(district);
		    String query = "SELECT * from details_of_hotels where hotel_name = ? and address = ? and roomNumber = ? and district = ?";
		    PreparedStatement ps=con.prepareStatement(query);
		    ps.setString(1, hotelName);
		    ps.setString(2, address);
		    ps.setString(3, roomNumber);
		    ps.setString(4, district);
		    resultSet = ps.executeQuery();
		}
		catch(Exception e) 
		{
			System.out.println(e);
		}
		return resultSet;
	}

}
