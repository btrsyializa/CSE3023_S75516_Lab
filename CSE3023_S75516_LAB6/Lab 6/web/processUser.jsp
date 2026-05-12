<%-- 
    Document   : processUser
    Created on : May 12, 2026, 3:55:49 PM
    Author     : Nurbatrisyia Aliza Binti Alias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Process Registration</title>
</head>
<body>
    <h2>Registration Status</h2>
    <%
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        String fname = request.getParameter("firstname");
        String lname = request.getParameter("lastname");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String myURL = "jdbc:mysql://localhost/cse3023";
            Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");

            String sInsertQry = "INSERT INTO userprofile (username, password, firstname, lastname) VALUES (?, ?, ?, ?)";
            PreparedStatement myPS = myConnection.prepareStatement(sInsertQry);

            myPS.setString(1, user);
            myPS.setString(2, pass);
            myPS.setString(3, fname);
            myPS.setString(4, lname);

            int result = myPS.executeUpdate();

            if(result > 0) {
                out.print("<p style='color:green;'>User successfully registered!</p>");
                out.print("<a href='login.jsp'>Click here to Login</a>");
            }

            myConnection.close();
        } catch (Exception e) {
            out.print("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            out.print("<a href='insertUser.html'>Try Again</a>");
        }
    %>
</body>
</html>