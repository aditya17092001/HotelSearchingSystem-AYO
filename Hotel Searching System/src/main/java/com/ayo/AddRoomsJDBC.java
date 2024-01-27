package com.ayo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class AddRoomsJDBC {

	public boolean values(String email, String hotel_name, String address, String state, String district, String bedroom,String roomtype, String hall, String washroom, int roomNumber, String phone_number) {
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		    String url = "jdbc:mysql://localhost/AYO", user1 = "root" ,pass1 = "toor";
		    Connection con = DriverManager.getConnection(url, user1, pass1);
		    String query = "INSERT INTO details_of_hotels VALUES(?,?,?,?,?,?,?,?,?,?,?,?);";
		    PreparedStatement ps = con.prepareStatement(query);
		    String available = "yes";
//		    System.out.println(email);
		    if(email == null || hotel_name  == null || address  == null|| district  == null|| bedroom == null || bedroom == null || hall == null || washroom == null || roomtype == null || phone_number == null) return false;
		    ps.setString(1, email);
		    ps.setString(2, hotel_name);
		    ps.setString(3, address);
		    ps.setString(4, state);
		    ps.setString(5, district);
		    ps.setString(6, bedroom);
		    ps.setString(7, roomtype);
		    ps.setString(8, hall);
		    ps.setString(9, washroom);
		    ps.setInt(10, roomNumber);
		    ps.setString(11, phone_number);
		    ps.setString(12, available);
		    int rowsAffected = ps.executeUpdate();
		    return rowsAffected > 0;
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			return false;
		}
		
	}
	
}
