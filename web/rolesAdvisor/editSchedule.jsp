<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lab.model.User" %>
<%@ page import="com.lab.model.StaffSchedule" %>
<%@ page import="com.lab.dao.StaffScheduleDAO" %>
<%@ page import="java.util.Map" %>
<%
    // 1. Session Validation
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null || !currentUser.getRole().equals("advisor")) {
        response.sendRedirect("../login.jsp");
        return;
    }

    // 2. Dapatkan ID dari URL
    String scheduleId = request.getParameter("id");
    StaffScheduleDAO dao = new StaffScheduleDAO();
    StaffSchedule schedule = dao.getScheduleById(scheduleId);

    // Kalau ID tak wujud, hantar balik ke dashboard
    if (schedule == null) {
        response.sendRedirect("dashboardAdvisor.jsp");
        return;
    }

    // 3. Tarik senarai AJK untuk dropdown
    Map<String, String> ajkStaffList = dao.getAllAJKStaff();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Schedule - Playje</title>
    <link rel="stylesheet" href="../css/dashboard.css">
</head>
<body>
    <%@ include file="../header.jsp" %>
    <div class="navbar">
        <h1>Edit Staff Assignment</h1>
        <a href="dashboardAdvisor.jsp">Back to Dashboard</a>
    </div>

    <div class="edit-container card">
        <h2>Update Schedule: <%= schedule.getScheduleId() %></h2>
        <hr style="margin-bottom: 20px; border: 0; border-top: 1px solid #eee;">

        <form action="../ScheduleServlet" method="POST">
            <!-- Hidden Fields: Penting untuk Servlet tahu ini operation UPDATE dan ID mana -->
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="scheduleId" value="<%= schedule.getScheduleId() %>">

            <div class="form-group">
                <label>Assigned AJK:</label>
                <select name="ajkId" required>
                    <% for(Map.Entry<String, String> entry : ajkStaffList.entrySet()) { %>
                        <option value="<%= entry.getKey() %>" <%= entry.getKey().equals(schedule.getAjkId()) ? "selected" : "" %>>
                            <%= entry.getValue() %>
                        </option>
                    <% } %>
                </select>
            </div>

            <div class="form-group">
                <label>Duty Role:</label>
                <select name="dutyRole" required>
                    <option value="Jaga Kaunter" <%= "Jaga Kaunter".equals(schedule.getDutyRole()) ? "selected" : "" %>>Payment Verification</option>
                    <option value="Sapu Lantai" <%= "Sapu Lantai".equals(schedule.getDutyRole()) ? "selected" : "" %>>Station Management</option>
                    <option value="Semak Barang" <%= "Semak Barang".equals(schedule.getDutyRole()) ? "selected" : "" %>>Booking Support</option>
                    <option value="Buat Konten" <%= "Buat Konten".equals(schedule.getDutyRole()) ? "selected" : "" %>>Maintenance</option>
                </select>
            </div>

            <div class="form-group">
                <label>Shift Date:</label>
                <input type="date" name="shiftDate" value="<%= schedule.getShiftDate() %>" required>
            </div>

            <div class="form-group">
                <label>Assignment Status:</label>
                <select name="isAssigned" required>
                    <option value="1" <%= (schedule.getIsAssigned() == 1) ? "selected" : "" %>>Assigned</option>
                    <option value="0" <%= (schedule.getIsAssigned() == 0) ? "selected" : "" %>>Pending / Unassigned</option>
                </select>
            </div>

            <div style="margin-top: 30px;">
                <button type="submit" class="btn-save">Update Schedule</button>
                <a href="dashboardAdvisor.jsp" class="btn-cancel">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>