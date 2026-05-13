package com.lab.controller;

import com.lab.dao.UserDAO;
import com.lab.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        UserDAO uDao = new UserDAO();

        try {
            if ("registerAjk".equals(action)) {
                // 1. Ambil data dari form addAjk.jsp
                String userId = request.getParameter("userId");
                String username = request.getParameter("username");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String position = request.getParameter("position");

                User newUser = new User(userId, username, email, password, "ajk");
                newUser.setPosition(position);

                // 2. Simpan ke database
                boolean success = uDao.registerAjkWithProfile(newUser);

                if (success) {
                    response.sendRedirect("rolesAdvisor/dashboardAdvisor.jsp?msg=success");
                } else {
                    response.sendRedirect("rolesAdvisor/addAjk.jsp?error=failed");
                }

            } else if ("updateAjk".equals(action)) {
                // 1. Ambil data dari editAjk.jsp
                String userId = request.getParameter("userId");
                String username = request.getParameter("username");
                String email = request.getParameter("email");
                String position = request.getParameter("position");

                User updatedUser = new User();
                updatedUser.setUserId(userId);
                updatedUser.setUsername(username);
                updatedUser.setEmail(email);
                updatedUser.setPosition(position);

                // 2. Update database
                boolean success = uDao.updateAjkWithProfile(updatedUser);

                if (success) {
                    response.sendRedirect("rolesAdvisor/dashboardAdvisor.jsp?msg=updated");
                } else {
                    response.sendRedirect("rolesAdvisor/editAjk.jsp?id=" + userId + "&error=failed");
                }

            } else if ("deleteAjk".equals(action)) {
                String userId = request.getParameter("userId");
                boolean success = uDao.deleteUser(userId); // Pastikan delete handle cascading dlm DB/DAO

                response.sendRedirect("rolesAdvisor/dashboardAdvisor.jsp?msg=deleted");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}