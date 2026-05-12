<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lab.model.User" %>
<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Advisor Dashboard - Gaming Lounge</title>
    <link rel="stylesheet" href="../css/dashboard.css">
</head>
<body>
    <div class="navbar">
        <h1>Gaming Lounge - Advisor Dashboard</h1>
        <a href="../login.jsp">Logout</a>
    </div>
    
    <div class="container">
        <div class="welcome-box">
            <h2>Welcome, <%= currentUser.getUsername() %>!</h2>
            <div class="user-info">
                <p><strong>User ID:</strong> <%= currentUser.getUserId() %></p>
                <p><strong>Email:</strong> <%= currentUser.getEmail() %></p>
                <p><strong>Role:</strong> <span style="text-transform: capitalize;"><%= currentUser.getRole() %></span></p>
            </div>
        </div>
            <h2 style="margin-bottom: 20px; color: #333;">System Analytics</h2>
        <div class="stats-grid">
            <div class="stat-card">
                <p>Total Active Users</p>
                <h3>45</h3>
            </div>
            
            <div class="stat-card">
                <p>Available Stations</p>
                <h3>12</h3>
            </div>
            
            <div class="stat-card">
                <p>Total Revenue</p>
                <h3>RM 1,250</h3>
            </div>
            
            <div class="stat-card">
                <p>Peak Hours Usage</p>
                <h3>89%</h3>
            </div>
        </div>
    </div>
</body>
</html>
