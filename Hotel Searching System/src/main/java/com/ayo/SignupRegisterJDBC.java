package com.ayo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

public class SignupRegisterJDBC 
{
	public void values(String fname, String lname, String email, String password, String address)
	{
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		    String url = "jdbc:mysql://localhost/AYO", user1 = "root" ,pass1 = "toor";
		    Connection con = DriverManager.getConnection(url, user1, pass1);
		    String query = "INSERT INTO SIGNUP VALUES(?,?,?,?,?);";
		    PreparedStatement ps = con.prepareStatement(query);
		    ps.setString(1, fname);
		    ps.setString(2, lname);
		    ps.setString(3, email);
		    ps.setString(4, password);
		    ps.setString(5, address);
		    ps.execute();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
}
