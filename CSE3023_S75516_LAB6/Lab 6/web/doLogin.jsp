<%-- 
    Document   : doLogin
    Created on : May 12, 2026, 3:56:58 PM
    Author     : Nurbatrisyia Aliza Binti Alias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    String user = request.getParameter("username");
    String pass = request.getParameter("password");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String myURL = "jdbc:mysql://localhost/cse3023";
        Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");

        String sQuery = "SELECT * FROM userprofile WHERE username = ? AND password = ?";
        PreparedStatement myPS = myConnection.prepareStatement(sQuery);
        
        myPS.setString(1, user);
        myPS.setString(2, pass);
        
        ResultSet rs = myPS.executeQuery();

        if(rs.next()) {
            // Validation successful! Save user details to the session
            session.setAttribute("sessionUser", rs.getString("username"));
            session.setAttribute("sessionFname", rs.getString("firstname"));
            session.setAttribute("sessionLname", rs.getString("lastname"));
            
            // Redirect to main page
            response.sendRedirect("main.jsp");
        } else {
            // Validation unsuccessful! Redirect to login with error parameter
            response.sendRedirect("login.jsp?error=invalid");
        }

        myConnection.close();
    } catch (Exception e) {
        out.print("Error connecting to database: " + e.getMessage());
    }
%>