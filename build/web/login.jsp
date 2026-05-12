<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - UMT Gaming Lounge</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
    <div class="glass-card">
        <img src="<%= request.getContextPath() %>/images/logo.jpg" alt="Logo" class="brand-logo">
        <h2>UMT Gaming Lounge</h2>
        <p class="subtitle">Login to book your station</p>

        <% if ("1".equals(request.getParameter("error"))) { %>
            <div class="error-alert">
                 Invalid email or password. Please try again.
            </div>
        <% } %>

        <form action="<%= request.getContextPath() %>/LoginServlet" method="POST">
            <div class="input-group">
                <label>EMAIL ADDRESS</label>
                <input type="email" name="email" required placeholder="s12345@ocean.umt.edu.my">
            </div>
            
            <div class="input-group">
                <label>PASSWORD</label>
                <input type="password" name="password" required placeholder="••••••••">
            </div>
            
            <button type="submit" class="btn-primary">ACCESS LOUNGE</button>
        </form>
    </div>
</body>
</html>