<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lab.model.User" %>
<%@ page import="com.lab.model.StaffSchedule" %>
<%@ page import="com.lab.dao.StaffScheduleDAO" %>
<%@ page import="com.lab.dao.UserDAO" %>
<%@ page import="com.lab.dao.StationDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%
    // Session Validation
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null || !currentUser.getRole().equals("advisor")) {
        response.sendRedirect("../login.jsp");
        return;
    }
    
    // Data Retrieval
    StaffScheduleDAO staffDAO = new StaffScheduleDAO();
    UserDAO userDAO = new UserDAO();
    StationDAO stationDAO = new StationDAO();
    
    List<StaffSchedule> schedules = staffDAO.getAllSchedules();
    Map<String, String> ajkStaffList = staffDAO.getAllAJKStaff();
    
    // Real Stats from Database
    int totalUsers = userDAO.getTotalUserCount(); 
    int availableStations = stationDAO.getAvailableStationCount();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Advisor Dashboard - Playje</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
    <%@ include file="../header.jsp" %> 
    <div class="container">
        <div class="card">
            <h2 style="margin-bottom: 20px;">System Analytics</h2>
            <div class="stats-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 15px;">
                <div class="stat-card" style="padding: 20px; border: 1px solid #eee; border-radius: 8px;">
                    <p>Total Registered Users</p>
                    <h3><%= totalUsers %></h3>
                </div>
                <div class="stat-card" style="padding: 20px; border: 1px solid #eee; border-radius: 8px;">
                    <p>Available Stations</p>
                    <h3><%= availableStations %></h3>
                </div>
            </div>
        </div>
        
        <div class="card" style="margin-top: 20px;">
            <h2>Manage Staff Schedule</h2>
            <div class="staff-tabs" style="margin: 20px 0;">
                <button class="staff-tab-btn active" onclick="switchStaffTab('view')">View Schedule</button>
                <button class="staff-tab-btn" onclick="switchStaffTab('add')">Add New Schedule</button>
            </div>
            
            <div id="view-tab" class="staff-tab-content active">
                <table border="1" width="100%" style="border-collapse: collapse; text-align: left; margin-top: 10px;">
                    <thead>
                        <tr style="background: #f4f4f4;">
                            <th style="padding: 10px;">ID</th>
                            <th style="padding: 10px;">Staff Name</th>
                            <th style="padding: 10px;">Duty Role</th>
                            <th style="padding: 10px;">Date</th>
                            <th style="padding: 10px;">Status</th>
                            <th style="padding: 10px;">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if(schedules.isEmpty()) { %>
                            <tr><td colspan="6" style="text-align:center; padding: 20px;">No schedules found.</td></tr>
                        <% } else { 
                            for(StaffSchedule s : schedules) { %>
                            <tr>
                                <td style="padding: 10px;"><%= s.getScheduleId() %></td>
                                <td style="padding: 10px;"><%= s.getAjkName() %></td>
                                <td style="padding: 10px;"><%= s.getDutyRole() %></td>
                                <td style="padding: 10px;"><%= s.getShiftDate() %></td>
                                <td style="padding: 10px;">
                                    <span class="status-badge <%= (s.getIsAssigned() == 1) ? "assigned" : "unassigned" %>">
                                        <%= (s.getIsAssigned() == 1) ? "Assigned" : "Pending" %>
                                    </span>
                                </td>
                                <td style="padding: 10px;">
                                    <div style="display: flex; gap: 8px;">
                                        <a href="editSchedule.jsp?id=<%= s.getScheduleId() %>" class="btn-edit">Edit</a>
                                        
                                        <form action="../ScheduleServlet" method="POST" style="display:inline;">
                                            <input type="hidden" name="action" value="delete">
                                            <input type="hidden" name="scheduleId" value="<%= s.getScheduleId() %>">
                                            <button type="submit" class="btn-delete" onclick="return confirm('Betul ke nak delete schedule <%= s.getScheduleId() %>?')">
                                                Delete
                                            </button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        <% } } %>
                    </tbody>
                </table>
            </div>
            
            <div id="add-tab" class="staff-tab-content">
                <form action="../ScheduleServlet" method="POST">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="advisorId" value="<%= currentUser.getUserId() %>">
                    
                    <div style="margin-bottom: 10px;">
                        <label>AJK Staff:</label><br>
                        <select name="ajkId" required style="width: 100%; padding: 8px;">
                            <option value="">-- Select AJK --</option>
                            <% for(Map.Entry<String, String> entry : ajkStaffList.entrySet()) { %>
                                <option value="<%= entry.getKey() %>"><%= entry.getValue() %></option>
                            <% } %>
                        </select>
                    </div>
                    
                    <div style="margin-bottom: 10px;">
                        <label>Duty Role:</label><br>
                        <select name="dutyRole" required style="width: 100%; padding: 8px;">
                            <option value="Payment Verification">Payment Verification</option>
                            <option value="Station Management">Station Management</option>
                            <option value="Maintenance">Maintenance</option>
                        </select>
                    </div>
                    
                    <div style="margin-bottom: 10px;">
                        <label>Shift Date:</label><br>
                        <input type="date" name="shiftDate" required style="width: 100%; padding: 8px;">
                    </div>
                    
                    <button type="submit" style="padding: 10px 20px; background: #007bff; color: white; border: none; cursor: pointer; border-radius: 4px;">Save Schedule</button>
                </form>
            </div>
        </div>
    </div>

    <script>
        function switchStaffTab(tab) {
            document.querySelectorAll('.staff-tab-content').forEach(c => c.classList.remove('active'));
            document.querySelectorAll('.staff-tab-btn').forEach(b => b.classList.remove('active'));
            document.getElementById(tab + '-tab').classList.add('active');
            event.target.classList.add('active');
        }

        function handleLogout() {
            window.location.href = '../login.jsp';
        }
    </script>
</body>
</html>