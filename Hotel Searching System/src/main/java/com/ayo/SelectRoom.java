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

@WebServlet("/selectRoom")
public class SelectRoom extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
	{
		String states = req.getParameter("states");
		String districts = req.getParameter("districts");
		String bedroom = req.getParameter("bedrooms");
		String roomtype = req.getParameter("roomtype");
		String hall = req.getParameter("hall");
		String washroom = req.getParameter("washroom");
		HttpSession s = req.getSession();
		s.setAttribute("district", districts);
		System.out.println("States: "+states+", Districts: "+districts+", Bedroom: "+bedroom+", Roomtype: "+roomtype+", Hall: "+hall+", Washroom: "+washroom);
		
		SelectRoomJDBC srjdbc = new SelectRoomJDBC();
		SuggestionRoomJDBC sugjdbc = new SuggestionRoomJDBC();
		ResultSet hotels = srjdbc.values(states, districts, Integer.parseInt(bedroom), roomtype, hall, washroom);
		ResultSet suggestHotel = sugjdbc.values(states, districts, Integer.parseInt(bedroom), roomtype, hall, washroom);
		req.setAttribute("hotels", hotels);
		req.setAttribute("suggestHotel", suggestHotel);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/SearchResults.jsp");
        dispatcher.forward(req, res);
	}
}
