<%-- 
    Document   : login
    Created on : May 12, 2026, 3:56:21 PM
    Author     : Nurbatrisyia Aliza Binti Alias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Login</title>
</head>
<body>
    <h2>Login to System</h2>
    
    <%-- Check if the URL contains an error parameter from doLogin.jsp --%>
    <%
        String errorMsg = request.getParameter("error");
        if (errorMsg != null && errorMsg.equals("invalid")) {
            out.print("<p style='color:red; font-weight:bold;'>Invalid username or password..!</p>");
        }
    %>

    <form action="doLogin.jsp" method="POST">
        <table>
            <tr>
                <td>Username:</td>
                <td><input type="text" name="username" required></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type="password" name="password" required></td>
            </tr>
        </table>
        <br>
        <input type="submit" value="Login">
    </form>
    
    <p>Don't have an account? <a href="insertUser.html">Register here</a>.</p>
</body>
</html>