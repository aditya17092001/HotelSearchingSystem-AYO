package com.ayo;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminvalidateOTP")
public class AdminValidateOTP extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
	{
		String first = req.getParameter("first");
		String second = req.getParameter("second");
		String third = req.getParameter("third");
		String fourth = req.getParameter("fourth");
		String fifth = req.getParameter("fifth");
		String sixth = req.getParameter("sixth");
		String otp = first+second+third+fourth+fifth+sixth;
		System.out.println("Entered otp is: "+otp);
		HttpSession session = req.getSession();
		String wotp = (String)session.getAttribute("generatedOTP");
		System.out.println("Generated otp is:"+wotp);
		if(otp.equals(wotp)) req.getRequestDispatcher("adminSelectOrAddRooms.jsp").forward(req,res);
		else 
		{
			req.setAttribute("errorMessage", "Invalid OTP. Please try again.");
            req.getRequestDispatcher("adminOtp.jsp").forward(req, res);
		}
	}
}
