package com.ayo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class LoginDAO {
	String fname = null;
	public boolean check(String email, String password)
	{
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		    String url = "jdbc:mysql://localhost/AYO", user1 = "root" ,pass1 = "toor";
		    Connection con = DriverManager.getConnection(url, user1, pass1);
		    Statement st = con.createStatement();
		    String query = "SELECT fname FROM SIGNUP WHERE email = ? and password = ?";
		    PreparedStatement ps=con.prepareStatement(query);
	        ps.setString(1, email);
	        ps.setString(2, password);
	        ResultSet rs=ps.executeQuery();
	         if(rs.next())
	         {
	        	 fname = rs.getString("fname");
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
}