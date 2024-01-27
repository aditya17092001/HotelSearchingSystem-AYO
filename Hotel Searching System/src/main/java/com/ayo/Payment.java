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

@WebServlet("/payment")
public class Payment extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		String hotelName = req.getParameter("hotelName");
		String address = req.getParameter("address");
		String roomNumber = req.getParameter("roomNumber");
		HttpSession s = req.getSession();
		String district = (String)s.getAttribute("district");
		PaymentJDBC pjdbc = new PaymentJDBC();
		ResultSet finalPaymentData = pjdbc.values(hotelName, address, roomNumber, district);
		req.setAttribute("finalPaymentData", finalPaymentData);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/payment.jsp");
        dispatcher.forward(req, res);
	}




}
