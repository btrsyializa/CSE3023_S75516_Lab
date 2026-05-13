<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New AJK - Playje</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body style="display: block; padding-top: 80px;">
    <%@ include file="../header.jsp" %>
    
    <div class="container" style="max-width: 600px;">
        <div class="card">
            <h2 style="color: #c77dff; margin-bottom: 20px;">Register New AJK</h2>
            <form action="../UserServlet" method="POST">
                <input type="hidden" name="action" value="registerAjk">
                
                <div style="margin-bottom: 15px;">
                    <label>No. Matric (User ID):</label>
                    <input type="text" name="userId" placeholder="e.g. S12345" required class="input-field" style="width: 100%;">
                </div>

                <div style="margin-bottom: 15px;">
                    <label>Username:</label>
                    <input type="text" name="username" required class="input-field" style="width: 100%;">
                </div>

                <div style="margin-bottom: 15px;">
                    <label>Email:</label>
                    <input type="email" name="email" required class="input-field" style="width: 100%;">
                </div>

                <div style="margin-bottom: 15px;">
                    <label>Temporary Password:</label>
                    <input type="password" name="password" required class="input-field" style="width: 100%;">
                </div>

                <div style="margin-bottom: 25px;">
                    <label>Position in Esports Club:</label>
                    <select name="position" required class="input-field" style="width: 100%;">
                        <option value="President">President</option>
                        <option value="Vice President">Vice President</option>
                        <option value="Secretary">Secretary</option>
                        <option value="Treasurer">Treasurer</option>
                        <option value="Technical AJK">Technical AJK</option>
                        <option value="Lounge Management">Lounge Management</option>
                    </select>
                </div>

                <div style="display: flex; gap: 10px;">
                    <button type="submit" class="btn-primary">Register AJK</button>
                    <button type="button" onclick="history.back()" class="btn-secondary" style="background: #444;">Cancel</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>