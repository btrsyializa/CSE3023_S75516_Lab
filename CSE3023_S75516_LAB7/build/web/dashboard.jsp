<%-- 
    Document   : dashboard
    Created on : 19 May 2026, 4:14:06 pm
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Protection Layer: Kick out users who try to deep-link to the dashboard without logging in
    String user = (String) session.getAttribute("sess_user");
    if(user == null) {
        response.sendRedirect("login.jsp?msg=Please login first.");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background-color: #f4f7f6; }
        .dashboard-card { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.05); max-width: 600px; margin: 0 auto; }
        h1 { color: #2c3e50; }
        .btn-link { display: inline-block; background-color: #3498db; color: white; padding: 12px 24px; text-decoration: none; border-radius: 4px; font-weight: bold; margin-top: 15px; }
        .btn-logout { display: inline-block; background-color: #e74c3c; color: white; padding: 8px 15px; text-decoration: none; border-radius: 4px; float: right; font-size: 14px; }
    </style>
</head>
<body>
    <div class="dashboard-card">
        <a href="logout.jsp" class="btn-logout">Logout</a>
        <h1>Welcome back, Student!</h1>
        <p>Logged in Matric No: <strong><%= user %></strong></p>
        <hr style="border:0; border-top: 1px solid #eee; margin: 20px 0;">
        
        <h3>Academic Management Module</h3>
        <p>Click below to register new semester courses, modify existing details, or view current enrollment schedules.</p>
        
        <a href="SubjectServlet?action=list" class="btn-link">Manage Registered Subjects</a>
    </div>
</body>
</html>