<%-- 
    Document   : main
    Created on : May 12, 2026, 3:57:46 PM
    Author     : Nurbatrisyia Aliza Binti Alias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Dashboard</title>
</head>
<body>
    <%
        // Retrieve the data stored in the session from doLogin.jsp
        String loggedUser = (String) session.getAttribute("sessionUser");
        String firstName = (String) session.getAttribute("sessionFname");
        String lastName = (String) session.getAttribute("sessionLname");

        // Security check: If someone tries to access main.jsp without logging in, kick them back to login
        if(loggedUser == null) {
            response.sendRedirect("login.jsp");
        } else {
    %>
    
    <h2>Welcome to the Main System!</h2>
    
    <div style="border: 1px solid #000; padding: 15px; width: 300px;">
        <p><strong>First Name:</strong> <%= firstName %></p>
        <p><strong>Last Name:</strong> <%= lastName %></p>
        <p><strong>Username:</strong> <%= loggedUser %></p>
    </div>
    
    <br>
    <%-- A simple logout link to destroy the session --%>
    <a href="login.jsp" onclick="<% session.invalidate(); %>">Logout</a>

    <%
        } // End of the else block
    %>
</body>
</html>