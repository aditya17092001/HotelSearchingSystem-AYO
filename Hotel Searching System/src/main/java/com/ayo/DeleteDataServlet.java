package com.ayo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DeleteDataServlet")
public class DeleteDataServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String state = request.getParameter("state");
        String district = request.getParameter("district");
        String bedrooms = request.getParameter("bedrooms");
        String roomtype = request.getParameter("roomtype");
        String hall = request.getParameter("hall");
        String washroom = request.getParameter("washroom");
        String phone_number = request.getParameter("phone_number");
        int roomNumber = Integer.parseInt(request.getParameter("roomNumber"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost/AYO", user1 = "root", pass1 = "toor";
            Connection con = DriverManager.getConnection(url, user1, pass1);
            String deleteQuery = "DELETE FROM details_of_hotels WHERE state = ? AND district = ? AND bedrooms = ? AND roomtype = ? AND hall = ? AND washroom = ? AND phone_number = ? AND roomNumber = ?";
            PreparedStatement ps = con.prepareStatement(deleteQuery);
            ps.setString(1, state);
            ps.setString(2, district);
            ps.setString(3, bedrooms);
            ps.setString(4, roomtype);
            ps.setString(5, hall);
            ps.setString(6, washroom);
            ps.setString(7, phone_number);
            ps.setInt(8, roomNumber);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
            	GetRoomsJDBC jdbc = new GetRoomsJDBC();
        		HttpSession session = request.getSession();
        		String email = (String) session.getAttribute("adminemail");
        		ResultSet result = jdbc.values(email);
        		session.setAttribute("deleteRooms", result);
        		String deleteSuccess = "Successfully Deleted!";
        		request.setAttribute("deleteSuccess", deleteSuccess);
        		RequestDispatcher dispatcher = request.getRequestDispatcher("/deleteRooms.jsp");
                dispatcher.forward(request, response);
            } else {
                // Deletion failed
                response.sendRedirect("deleteRooms.jsp?deleteError=true");
            }
        } catch (Exception e) {
            System.out.println(e);
            response.sendRedirect("deleteRooms.jsp?deleteError=true");
        }
    }
}

