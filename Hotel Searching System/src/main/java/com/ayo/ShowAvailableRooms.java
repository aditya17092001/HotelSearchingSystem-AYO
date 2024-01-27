package com.ayo;

import java.io.IOException;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/showAvailableRooms")

public class ShowAvailableRooms extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
	{
		String bedrooms = req.getParameter("bedrooms");
		String roomtype = req.getParameter("roomtype");
		String hall = req.getParameter("hall");
		String washroom = req.getParameter("washroom");
		HttpSession session = req.getSession();
		String email = (String) session.getAttribute("adminemail");
		CheckAvailableJDBC jdbc = new CheckAvailableJDBC();
		SuggestionCheckAvailableJDBC sjdbc = new SuggestionCheckAvailableJDBC();
		ResultSet result = jdbc.values(bedrooms, roomtype, hall, washroom, email);
		ResultSet suggestResult = sjdbc.values(bedrooms, roomtype, hall, washroom, email);
		System.out.println(bedrooms+", "+roomtype+", "+hall+", "+washroom+", "+email);
		session.setAttribute("adminSearchResult", result);
		session.setAttribute("adminSuggestResult", suggestResult);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/adminShowAvailableRooms.jsp");
        dispatcher.forward(req, res);
		
	}
}
