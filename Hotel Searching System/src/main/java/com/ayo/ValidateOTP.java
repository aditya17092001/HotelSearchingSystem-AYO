package com.ayo;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/validateOTP")
public class ValidateOTP extends HttpServlet {

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
		if(session.getAttribute("email") != null && session.getAttribute("password") != null && session.getAttribute("fname") != null && session.getAttribute("lname") != null && session.getAttribute("address") != null)
		{
			SignupRegisterJDBC executeJdbc = new SignupRegisterJDBC();
			String fname = (String) session.getAttribute("fname");
			String lname = (String) session.getAttribute("lname");
			String email = (String) session.getAttribute("email");
			String password = (String) session.getAttribute("password");
			String address = (String) session.getAttribute("address");
			executeJdbc.values(fname,lname,email,password,address);	
			System.out.println(fname+","+lname);
		}
		System.out.println("Generated otp is:"+wotp);
		if(otp.equals(wotp)) res.sendRedirect("selectRoom.jsp");
		else 
		{
			req.setAttribute("errorMessage", "Invalid OTP. Please try again.");
            req.getRequestDispatcher("otp.jsp").forward(req, res);
		}
	}
}
