<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lab.model.User, com.lab.dao.UserDAO" %>
<%
    String userId = request.getParameter("id");
    UserDAO uDao = new UserDAO();
    User ajk = uDao.getUserById(userId); // Pastikan kau ada method ni dlm UserDAO

    if (ajk == null) {
        response.sendRedirect("dashboardAdvisor.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit AJK Profile - Playje</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body style="display: block; padding-top: 80px;">
    <%@ include file="../header.jsp" %>
    
    <div class="container" style="max-width: 600px;">
        <div class="card">
            <h2 style="color: #c77dff; margin-bottom: 20px;">Edit AJK: <%= ajk.getUsername() %></h2>
            <form action="../UserServlet" method="POST">
                <input type="hidden" name="action" value="updateAjk">
                <input type="hidden" name="userId" value="<%= ajk.getUserId() %>">
                
                <div style="margin-bottom: 15px;">
                    <label>No. Matric (Read-only):</label>
                    <input type="text" value="<%= ajk.getUserId() %>" disabled class="input-field" style="width: 100%; background: #333;">
                </div>

                <div style="margin-bottom: 15px;">
                    <label>Full Name:</label>
                    <input type="text" name="username" value="<%= ajk.getUsername() %>" required class="input-field" style="width: 100%;">
                </div>

                <div style="margin-bottom: 15px;">
                    <label>Email:</label>
                    <input type="email" name="email" value="<%= ajk.getEmail() %>" required class="input-field" style="width: 100%;">
                </div>

                <div style="margin-bottom: 25px;">
                    <label>Current Position:</label>
                    <select name="position" required class="input-field" style="width: 100%;">
                        <option value="President" <%= ajk.getPosition().equals("President") ? "selected" : "" %>>President</option>
                        <option value="Vice President" <%= ajk.getPosition().equals("Vice President") ? "selected" : "" %>>Vice President</option>
                        <option value="Secretary" <%= ajk.getPosition().equals("Secretary") ? "selected" : "" %>>Secretary</option>
                        <option value="Treasurer" <%= ajk.getPosition().equals("Treasurer") ? "selected" : "" %>>Treasurer</option>
                        <option value="Technical AJK" <%= ajk.getPosition().equals("Technical AJK") ? "selected" : "" %>>Technical AJK</option>
                        <option value="Lounge Management" <%= ajk.getPosition().equals("Lounge Management") ? "selected" : "" %>>Lounge Management</option>
                    </select>
                </div>

                <div style="display: flex; gap: 10px;">
                    <button type="submit" class="btn-primary">Update Profile</button>
                    <button type="button" onclick="location.href='dashboardAdvisor.jsp'" class="btn-secondary" style="background: #444;">Back</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>