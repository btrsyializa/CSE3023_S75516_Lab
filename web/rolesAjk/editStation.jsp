<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lab.model.Station, com.lab.dao.StationDAO" %>
<%
    String id = request.getParameter("id");
    StationDAO dao = new StationDAO();
    Station s = dao.getStationById(id);
    if(s == null) { response.sendRedirect("dashboardAjk.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Station - Playje</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body style="display: block; padding-top: 80px;">
    <%@ include file="../header.jsp" %>
    <div class="container" style="max-width: 500px;">
        <div class="card">
            <h2 style="color: #c77dff; margin-bottom: 20px;">Edit Station: <%= s.getStationId() %></h2>
            <form action="../StationServlet" method="POST">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="stationId" value="<%= s.getStationId() %>">
                
                <!-- CRITICAL: Tambah hidden input ni supaya pricingId tak jadi NULL masa update -->
                <input type="hidden" name="pricingId" value="<%= s.getPricingId() %>">
                
                <div style="margin-bottom: 15px;">
                    <label>Station Name:</label>
                    <input type="text" name="stationName" value="<%= s.getStationName() %>" required class="input-field" style="width: 100%;">
                </div>

                <!-- specifications field supaya data specs tak hilang dlm DB -->
                <div style="margin-bottom: 15px;">
                    <label>Specifications:</label>
                    <textarea name="specifications" required class="input-field" style="width: 100%; height: 80px;"><%= s.getSpecifications() %></textarea>
                </div>

                <div style="margin-bottom: 15px;">
                <label>Station Category (Update Type & Price):</label>
                <select name="pricingId" required class="input-field" style="width: 100%;">
                    <%-- Pastikan value P001, P002 ni sama dlm database kau --%>
                    <option value="P001" <%= "P001".equals(s.getPricingId()) ? "selected" : "" %>>PS5 Category (RM 5.00)</option>
                    <option value="P002" <%= "P002".equals(s.getPricingId()) ? "selected" : "" %>>Simulator Category (RM 8.00)</option>
                    <option value="P003" <%= "P003".equals(s.getPricingId()) ? "selected" : "" %>>PC Gaming (RM 6.00)</option>
                </select>
</div>
</div>

                <div style="margin-bottom: 25px;">
                    <label>Current Status:</label>
                    <select name="status" class="input-field" style="width: 100%;">
                        <option value="available" <%= "available".equalsIgnoreCase(s.getStatus()) ? "selected" : "" %>>Available</option>
                        <option value="occupied" <%= "occupied".equalsIgnoreCase(s.getStatus()) ? "selected" : "" %>>Occupied</option>
                        <option value="maintenance" <%= "maintenance".equalsIgnoreCase(s.getStatus()) ? "selected" : "" %>>Maintenance</option>
                    </select>
                </div>

                <div style="display: flex; gap: 10px;">
                    <button type="submit" class="btn-primary">Update Station</button>
                    <button type="button" onclick="location.href='dashboardAjk.jsp'" class="btn-secondary" style="background:#444;">Back</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>