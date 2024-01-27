package com.ayo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminLoginDAO {
	String fname = null;
	String hotel_name = null;
	String address = null;
	String phone_number = null;
	public boolean check(String email, String password)
	{
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		    String url = "jdbc:mysql://localhost/AYO", user1 = "root" ,pass1 = "toor";
		    Connection con = DriverManager.getConnection(url, user1, pass1);
		    String query = "SELECT hotel_owner,email,hotel_name,phone_number,address FROM hotel_owner_details WHERE email = ? and password = ?";
		    PreparedStatement ps=con.prepareStatement(query);
	        ps.setString(1, email);
	        ps.setString(2, password);
	        ResultSet rs=ps.executeQuery();
	         if(rs.next())
	         {
	        	 fname = rs.getString("hotel_owner");
        		 hotel_name = rs.getString("hotel_name");
        		 phone_number = rs.getString("phone_number");
        		 address = rs.getString("address");
	        	 return true;
	         }
		} 
		catch(Exception e) 
		{
		    System.out.println(e);
		}
		return false;
	}
	
	public String getfname()
	{
		if(fname != null) return fname;
		return fname;
	}
	
	public String gethotel_name()
	{
		if(hotel_name != null) return hotel_name;
		return null;
	}
	
	public String getaddress()
	{
		if(address != null) return address;
		return null;
	}
	
	public String getphone_number()
	{
		if(phone_number != null) return phone_number;
		return null;
	}
	
}
