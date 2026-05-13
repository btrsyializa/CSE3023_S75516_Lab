<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lab.model.User, com.lab.model.StaffSchedule, com.lab.dao.StaffScheduleDAO, com.lab.dao.UserDAO, com.lab.dao.StationDAO, java.util.List, java.util.Map" %>
<%
    // 1. Session Validation
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null || !currentUser.getRole().equals("advisor")) {
        response.sendRedirect("../login.jsp");
        return;
    }
    
    // 2. Data Retrieval
    StaffScheduleDAO staffDAO = new StaffScheduleDAO();
    UserDAO userDAO = new UserDAO();
    StationDAO stationDAO = new StationDAO();
    
    List<StaffSchedule> schedules = staffDAO.getAllSchedules();
    Map<String, String> ajkStaffList = staffDAO.getAllAJKStaff();
    List<User> fullAjkList = userDAO.getUsersByRole("ajk"); // Tarikh list AJK untuk CRUD
    
    // Stats
    int totalUsers = userDAO.getTotalUserCount(); 
    int availableStations = stationDAO.getAvailableStationCount();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Advisor Dashboard - Playje</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
    <style>
        /* Fix Header and Container Spacing */
        body { padding-top: 80px; } /* Elak content kena tutup dgn fixed header */
        .header-fixed { position: fixed; top: 0; width: 100%; z-index: 1000; background: #1a1a2e; }
        .stats-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px; margin-bottom: 30px; }
        .stat-card { background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.1); padding: 25px; border-radius: 12px; }
        .stat-card h3 { font-size: 2rem; color: #c77dff; margin-top: 10px; }
        .crud-section { margin-top: 40px; }
        .badge-position { background: #6366f1; color: white; padding: 4px 10px; border-radius: 20px; font-size: 0.8rem; }
    </style>
</head>
<body>
    <div class="header-fixed">
        <%@ include file="../header.jsp" %> 
    </div>

    <div class="container">
        
        <!-- Section 1: System Analytics -->
        <div class="card">
            <h2 style="margin-bottom: 20px; color: #fff;">System Analytics</h2>
            <div class="stats-grid">
                <div class="stat-card">
                    <p style="color: #bbb;">Total Registered Users</p>
                    <h3><%= totalUsers %></h3>
                </div>
                <div class="stat-card">
                    <p style="color: #bbb;">Available Stations</p>
                    <h3><%= availableStations %></h3>
                </div>
            </div>
        </div>

        <!-- Section 2: Manage AJK Members (NEW CRUD SECTION) -->
        <div class="card crud-section">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                <h2 style="color: #fff;">AJK Member Management</h2>
                <button class="btn-primary" onclick="location.href='addAjk.jsp'" style="width: auto; padding: 10px 20px;">+ Add New AJK</button>
            </div>
            
            <div style="overflow-x: auto;">
                <table class="staff-table" style="width: 100%; border-collapse: collapse;">
                    <thead>
                        <tr style="background: rgba(199, 125, 255, 0.1);">
                            <th style="padding: 12px;">No. Matric</th>
                            <th style="padding: 12px;">Name</th>
                            <th style="padding: 12px;">Position</th>
                            <th style="padding: 12px;">Email</th>
                            <th style="padding: 12px; text-align: center;">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for(User ajk : fullAjkList) { %>
                        <tr style="border-bottom: 1px solid rgba(255,255,255,0.05);">
                            <td style="padding: 12px;"><%= ajk.getUserId() %></td>
                            <td style="padding: 12px;"><strong><%= ajk.getUsername() %></strong></td>
                            <td style="padding: 12px;"><span class="badge-position"><%= ajk.getPosition() %></span></td>
                            <td style="padding: 12px;"><%= ajk.getEmail() %></td>
                            <td style="padding: 12px; text-align: center;">
                                <div style="display: flex; gap: 10px; justify-content: center;">
                                    <a href="editAjk.jsp?id=<%= ajk.getUserId() %>" class="btn-edit" style="color: #ffc107; text-decoration: none;">Edit</a>
                                    <form action="../UserServlet" method="POST" onsubmit="return confirm('Confirm remove AJK <%= ajk.getUsername() %>?')">
                                        <input type="hidden" name="action" value="deleteAjk">
                                        <input type="hidden" name="userId" value="<%= ajk.getUserId() %>">
                                        <button type="submit" style="background:none; border:none; color:#ef4444; cursor:pointer; text-decoration:underline;">Delete</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
        
        <!-- Section 3: Staff Duty Schedule -->
            <div class="card" style="margin-top: 40px;">
                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                    <h2 style="color: #fff;">Staff Duty Schedule</h2>
                    <!-- Gantikan tab dlm image_6575b4.png dengan butang ni -->
                    <button class="btn-primary" onclick="location.href='addSchedule.jsp'" style="width: auto; padding: 10px 20px;">
                        + Add New Schedule
                    </button>
                </div>

                <div style="overflow-x: auto;">
                    <table class="staff-table" width="100%">
                        <thead>
                            <tr style="background: rgba(199, 125, 255, 0.1);">
                                <th style="padding: 12px;">ID</th>
                                <th style="padding: 12px;">Staff Name</th>
                                <th style="padding: 12px;">Duty Role</th>
                                <th style="padding: 12px;">Date</th>
                                <th style="padding: 12px;">Status</th>
                                <th style="padding: 12px; text-align: center;">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if(schedules.isEmpty()) { %>
                                <tr><td colspan="6" style="text-align:center; padding: 30px; color: #999;">No schedules found.</td></tr>
                            <% } else { 
                                for(StaffSchedule s : schedules) { %>
                                <tr style="border-bottom: 1px solid rgba(255,255,255,0.05);">
                                    <td style="padding: 12px;"><%= s.getScheduleId() %></td>
                                    <td style="padding: 12px;"><strong><%= s.getAjkName() %></strong></td>
                                    <td style="padding: 12px;"><%= s.getDutyRole() %></td>
                                    <td style="padding: 12px;"><%= s.getShiftDate() %></td>
                                    <td style="padding: 12px;">
                                        <span class="status-badge <%= (s.getIsAssigned() == 1) ? "assigned" : "unassigned" %>">
                                            <%= (s.getIsAssigned() == 1) ? "Assigned" : "Pending" %>
                                        </span>
                                    </td>
                                    <td style="padding: 12px; text-align: center;">
                                        <div style="display: flex; gap: 10px; justify-content: center;">
                                            <a href="editSchedule.jsp?id=<%= s.getScheduleId() %>" class="btn-edit" style="color: #ffc107;">Edit</a>
                                            <form action="../ScheduleServlet" method="POST" style="display:inline;">
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="scheduleId" value="<%= s.getScheduleId() %>">
                                                <button type="submit" style="background:none; border:none; color:#ef4444; cursor:pointer; text-decoration:underline;" onclick="return confirm('Delete schedule <%= s.getScheduleId() %>?')">Delete</button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            <% } } %>
                        </tbody>
                    </table>
                </div>
            </div>
            
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
    </script>
</body>
</html>