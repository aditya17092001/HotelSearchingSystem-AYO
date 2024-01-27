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

@WebServlet("/deleteRooms")
public class DeleteRooms extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
	{
		GetRoomsJDBC jdbc = new GetRoomsJDBC();
		HttpSession session = req.getSession();
		String email = (String) session.getAttribute("adminemail");
		ResultSet result = jdbc.values(email);
		session.setAttribute("deleteRooms", result);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/deleteRooms.jsp");
        dispatcher.forward(req, res);
	}

}


