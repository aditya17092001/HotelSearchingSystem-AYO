//package com.ayo;
//
//import java.io.IOException;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//@WebServlet("/login")
//
//public class Login extends HttpServlet {
//	
//	/**
//	 * 
//	 */
//	private static final long serialVersionUID = 1L;
//
//	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
//	{
//		String email = req.getParameter("email");
//		String password = req.getParameter("password");
//		HttpSession session = req.getSession();
//		LoginDAO dao = new LoginDAO();
//		if(dao.check(email,password))
//		{
//			session.setAttribute("email", email);
//			session.setAttribute("password", password);
//			GenerateOTP gotp = new GenerateOTP();
//			String actualotp = gotp.otp();
//			session.setAttribute("generatedOTP", actualotp);
//			
//			SendMail smail = new SendMail();
//			String fname = dao.getfname();
//			smail.send(email, actualotp, fname);
//			res.sendRedirect("otp.jsp");
//		}
//		else //res.sendRedirect("login.html");
//		{
//			req.setAttribute("errorMessage", "Incorrect username or password");
//			req.getRequestDispatcher("login.html").forward(req, res);
//		}
//	}
//}
//
package com.ayo;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        HttpSession session = req.getSession();
        LoginDAO dao = new LoginDAO();
        if (dao.check(email, password)) {
            session.setAttribute("email", email);
            session.setAttribute("password", password);
            GenerateOTP gotp = new GenerateOTP();
            String actualotp = gotp.otp();
            session.setAttribute("generatedOTP", actualotp);

            SendMail smail = new SendMail();
            String fname = dao.getfname();
            smail.send(email, actualotp, fname);
            res.sendRedirect("otp.jsp");
        } else {
            req.setAttribute("errorMessage", "Incorrect username or password!");
            req.getRequestDispatcher("login.jsp").forward(req, res);
        }
    }
}

