package com.lab.controller;

import com.lab.dao.UserDAO;
import com.lab.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userDAO.authenticateUser(email, password);

        if (user != null) {

            HttpSession session = request.getSession();
            session.setAttribute("currentUser", user);

            String role = user.getRole();

            if ("student".equals(role)) {
                response.sendRedirect("student/dashboardStudent.jsp");

            } else if ("ajk".equals(role)) {
                response.sendRedirect("ajk/dashboardAjk.jsp");

            } else if ("advisor".equals(role)) {
                response.sendRedirect("advisor/dashboardAdvisor.jsp");

            } else {
                response.sendRedirect("login.jsp?error=1");
            }

        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
