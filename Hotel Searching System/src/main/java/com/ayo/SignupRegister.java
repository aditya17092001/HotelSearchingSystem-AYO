package com.ayo;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/signupRegister")
public class SignupRegister extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
	{
		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String address = req.getParameter("address");
		HttpSession session = req.getSession();	
		session.setAttribute("fname", fname);
		session.setAttribute("lname", lname);
		session.setAttribute("email",email);
		session.setAttribute("password", password);
		session.setAttribute("address", address);
		SignupRegisterJDBC executeJdbc = new SignupRegisterJDBC();
		executeJdbc.values(fname,lname,email,password,address);
		LoginDAO dao = new LoginDAO();
		if (dao.check(email, password)) {
			GenerateOTP gotp = new GenerateOTP();
			String actualotp = gotp.otp();
			session.setAttribute("generatedOTP", actualotp);
			SendMail smail = new SendMail();
			smail.send(email, actualotp, fname);
			res.sendRedirect("otp.jsp");
		}
		else {
			req.setAttribute("errorMessageSignup", "Please try again!");
            req.getRequestDispatcher("signup.jsp").forward(req, res);
		}
		System.out.println(fname+","+lname);
		
	}
}
