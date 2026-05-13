<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lab.model.User" %>
<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null || !currentUser.getRole().equals("ajk")) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Station - Playje</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/dashboard.css">
</head>
<body style="display: block; padding-top: 80px;">
    <%@ include file="../header.jsp" %>
    
    <div class="container" style="max-width: 600px;">
        <div class="card">
            <h2 style="color: #c77dff; margin-bottom: 25px;">Register New Gaming Station</h2>
            
            <form action="../StationServlet" method="POST">
                <input type="hidden" name="action" value="add">
                
                <!-- 1. Station ID (Primary Key) -->
                <div style="margin-bottom: 15px;">
                    <label>Station ID (e.g., PS001):</label>
                    <input type="text" name="stationId" placeholder="Enter unique ID" required class="input-field" style="width: 100%; margin-top: 5px;">
                </div>

                <!-- 2. Station Name -->
                <div style="margin-bottom: 15px;">
                    <label>Station Name:</label>
                    <input type="text" name="stationName" placeholder="e.g., PS5 Station 4" required class="input-field" style="width: 100%; margin-top: 5px;">
                </div>

                <!-- 3. Pricing ID (Wajib untuk elak error JOIN) -->
                <div style="margin-bottom: 15px;">
                    <label>Pricing Category (Pricing ID):</label>
                    <select name="pricingId" required class="input-field" style="width: 100%; margin-top: 5px;">
                        <option value="">-- Select Pricing Category --</option>
                        <option value="P001">P001 - PS5 Standard</option>
                        <option value="P002">P002 - Simulator Pro</option>
                        <option value="P003">P003 - PC Gaming</option>
                    </select>
                </div>

                <!-- 4. Specifications -->
                <div style="margin-bottom: 15px;">
                    <label>Specifications:</label>
                    <textarea name="specifications" placeholder="e.g., Sony PS5 + 2 DualSense Controllers" required class="input-field" style="width: 100%; height: 80px; margin-top: 5px; padding: 10px;"></textarea>
                </div>

                <!-- 5. Initial Status -->
                <div style="margin-bottom: 25px;">
                    <label>Status:</label>
                    <select name="status" class="input-field" style="width: 100%; margin-top: 5px;">
                        <option value="available">Available</option>
                        <option value="maintenance">Maintenance</option>
                    </select>
                </div>

                <div style="display: flex; gap: 10px;">
                    <button type="submit" class="btn-primary" style="flex: 2;">Save Station</button>
                    <button type="button" onclick="location.href='dashboardAjk.jsp'" class="btn-secondary" style="flex: 1; background: #444;">Cancel</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>