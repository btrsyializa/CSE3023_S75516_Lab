<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lab.model.User, com.lab.dao.StaffScheduleDAO, java.util.Map" %>
<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null || !currentUser.getRole().equals("advisor")) {
        response.sendRedirect("../login.jsp");
        return;
    }

    StaffScheduleDAO staffDAO = new StaffScheduleDAO();
    Map<String, String> ajkStaffList = staffDAO.getAllAJKStaff();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Schedule - Playje</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body style="display: block; padding-top: 80px;">
    <%@ include file="../header.jsp" %>
    
    <div class="container" style="max-width: 600px;">
        <div class="card">
            <h2 style="color: #c77dff; margin-bottom: 25px;">Assign New Duty Schedule</h2>
            
            <form action="../ScheduleServlet" method="POST">
                <input type="hidden" name="action" value="add">
                <input type="hidden" name="advisorId" value="<%= currentUser.getUserId() %>">
                
                <div style="margin-bottom: 15px;">
                    <label>Select AJK Staff:</label>
                    <select name="ajkId" required class="input-field" style="width: 100%; margin-top: 5px;">
                        <option value="">-- Select AJK Member --</option>
                        <% for(Map.Entry<String, String> entry : ajkStaffList.entrySet()) { %>
                            <option value="<%= entry.getKey() %>"><%= entry.getValue() %></option>
                        <% } %>
                    </select>
                </div>
                
                <div style="margin-bottom: 15px;">
                    <label>Duty Role:</label>
                    <select name="dutyRole" required class="input-field" style="width: 100%; margin-top: 5px;">
                        <option value="Jaga Kaunter">Jaga Kaunter</option>
                        <option value="Sapu Lantai">Sapu Lantai</option>
                        <option value="Semak Barang">Semak Barang</option>
                        <option value="Record Video">Record Video</option>
                    </select>
                </div>
                
                <div style="margin-bottom: 25px;">
                    <label>Shift Date:</label>
                    <input type="date" name="shiftDate" required class="input-field" style="width: 100%; margin-top: 5px;">
                </div>
                
                <div style="display: flex; gap: 10px;">
                    <button type="submit" class="btn-primary">Save Schedule</button>
                    <button type="button" onclick="location.href='dashboardAdvisor.jsp'" class="btn-secondary" style="background: #444;">Cancel</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>