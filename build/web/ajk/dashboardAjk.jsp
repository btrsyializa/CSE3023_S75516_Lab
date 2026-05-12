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
    <title>AJK Dashboard - Gaming Lounge</title>
    <link rel="stylesheet" href="../css/dashboard.css">
</head>
<body>
    <div class="navbar">
        <h1>Gaming Lounge - AJK Dashboard</h1>
        <a href="../login.jsp">Logout</a>
    </div>
    
    <div class="container">
        <div class="welcome-box">
            <h2>Welcome AJK <%= currentUser.getUsername() %>!</h2>
            <div class="user-info">
                <p><strong>User ID:</strong> <%= currentUser.getUserId() %></p>
                <p><strong>Email:</strong> <%= currentUser.getEmail() %></p>
                <p><strong>Role:</strong> <span style="text-transform: capitalize;"><%= currentUser.getRole() %></span></p>
            </div>
        </div>
        
        <div class="management-section">
            <h3>Station Management</h3>
            <table>
                <thead>
                    <tr>
                        <th>Station ID</th>
                        <th>Station Name</th>
                        <th>Type</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>STN001</td>
                        <td>Station 01</td>
                        <td>Gaming PC</td>
                        <td><span style="color: green;">Available</span></td>
                        <td><button>Edit</button></td>
                    </tr>
                    <tr>
                        <td>STN002</td>
                        <td>Station 02</td>
                        <td>Gaming PC</td>
                        <td><span style="color: red;">Occupied</span></td>
                        <td><button>Edit</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
        
        <div class="management-section">
            <h3>User Management</h3>
            <table>
                <thead>
                    <tr>
                        <th>User ID</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>USR001</td>
                        <td>John Doe</td>
                        <td>john@umt.edu.my</td>
                        <td>Student</td>
                        <td><button>Edit</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
