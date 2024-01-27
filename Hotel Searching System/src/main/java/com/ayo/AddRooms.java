package com.ayo;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addRoomsAdmin")
public class AddRooms extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		String state = req.getParameter("states");
		String district = req.getParameter("districts");
		String bedroom = req.getParameter("bedrooms");
		String roomtype = req.getParameter("roomtype");
		String hall = req.getParameter("hall");
		String washroom = req.getParameter("washroom");
		int roomNumber = Integer.parseInt(req.getParameter("roomNumber"));
		HttpSession session = req.getSession();
		String email = (String) session.getAttribute("adminemail");
		String hotel_name = (String) session.getAttribute("hotel_name");
		String address = (String) session.getAttribute("address");
		String phone_number = (String) session.getAttribute("phone_number");
		AddRoomsJDBC jdbc = new AddRoomsJDBC();
		System.out.println("email: "+email+" hotel_name: "+hotel_name+", "+"States: "+state+", Districts: "+district+", Bedroom: "+bedroom+", Roomtype: "+roomtype+", Hall: "+hall+", Washroom: "+washroom);
		boolean bol = jdbc.values(email, hotel_name, address, state, district, bedroom, roomtype, hall, washroom, roomNumber, phone_number);
		if(bol)
		{
			req.setAttribute("updateMessage", "Successfully Added!");
            req.getRequestDispatcher("addRooms.jsp").forward(req, res);
		}
		else 
		{
			req.setAttribute("updateErrorMessage", "Can't able to Add!");
            req.getRequestDispatcher("addRooms.jsp").forward(req, res);
		}
	}
}
