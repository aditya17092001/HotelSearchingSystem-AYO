package com.ayo;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet
{
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		String email = req.getParameter("email");
        String password = req.getParameter("password");
        HttpSession session = req.getSession();
        AdminLoginDAO dao = new AdminLoginDAO();
        if (dao.check(email, password)) {
            session.setAttribute("adminemail", email);
            session.setAttribute("password", password);
            GenerateOTP gotp = new GenerateOTP();
            String actualotp = gotp.otp();
            session.setAttribute("generatedOTP", actualotp);         
            SendMail smail = new SendMail();
            String fname = dao.getfname();
            String address = dao.getaddress();
            String hotel_name = dao.gethotel_name();
            String phone_number = dao.getphone_number();
            session.setAttribute("hotel_owner", fname);
            session.setAttribute("hotel_name", hotel_name);
            session.setAttribute("address", address);
            session.setAttribute("phone_number", phone_number);
            System.out.println(fname+", "+hotel_name+", "+address+", "+phone_number);
            smail.send(email, actualotp, fname);
            req.getRequestDispatcher("adminOtp.jsp").forward(req,res);
        } else {
            req.setAttribute("errorMessage", "Can't able to login,\n Please contact the service provider!");
            req.getRequestDispatcher("adminLogin.jsp").forward(req, res);
        }
	 }
}
