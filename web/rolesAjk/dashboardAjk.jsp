<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lab.model.User, com.lab.model.Booking, com.lab.model.Station, com.lab.dao.BookingDAO, com.lab.dao.StationDAO, java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
    <title>AJK Dashboard - Playje</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body style="display: block;">

    <%@ include file="../header.jsp" %>

    <div class="container">
        <div class="card welcome-box">
            <h2>Welcome AJK <%= currentUser.getUsername() %>!</h2>
            <div class="user-info">
                <p><strong>User ID:</strong> <%= currentUser.getUserId() %></p>
                <p><strong>Email:</strong> <%= currentUser.getEmail() %></p>
                <p><strong>Role:</strong> <%= currentUser.getRole() %></p>
            </div>
        </div>

        <div class="card">
    <h3>Pending Approvals</h3>
    <table class="staff-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Student</th>
                <th>Station</th>
                <th>Slot Time</th> <!-- Column Baru -->
                <th>Date</th>      <!-- Column Baru -->
                <th>Price</th>     <!-- Column Baru -->
                <th>Receipt</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
    <%
        BookingDAO bDao = new BookingDAO();
        List<Booking> pendingList = bDao.getAllPendingBookings(); 
        if(pendingList == null || pendingList.isEmpty()) {
    %>
        <tr><td colspan="8" style="text-align:center; padding: 20px;">No pending bookings.</td></tr>
    <% } else { 
        // Pindahkan SimpleDateFormat ke luar loop supaya jimat memory
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy hh:mm a");
        
        for(Booking b : pendingList) { 
            String formattedDate = sdf.format(b.getBookingDate());
    %>
        <tr>
            <td><%= b.getBookingId() %></td>
            <td><%= b.getStudentId() %></td>
            <td><%= b.getStationName() %></td>
            <td style="white-space: nowrap;"><%= b.getSlotTime() %></td> 
            <td style="white-space: nowrap; color: #fbbf24; font-weight: 500;"><%= formattedDate %></td>
            <td style="font-weight: bold;">RM <%= String.format("%.2f", b.getTotalPrice()) %></td> 
            <td>
                <a href="<%= request.getContextPath() %>/<%= b.getPaymentProofPath() %>" 
                   target="_blank" style="color: #60a5fa; text-decoration: underline;">View Receipt</a>
            </td>
            <td style="display: flex; gap: 5px;">
                <form action="<%= request.getContextPath() %>/AjkServlet" method="POST">
                    <input type="hidden" name="action" value="approve">
                    <input type="hidden" name="bookingId" value="<%= b.getBookingId() %>">
                    <button type="submit" class="btn btn-save" style="background:#22c55e; cursor: pointer;">Approve</button>
                </form>
                <form action="<%= request.getContextPath() %>/AjkServlet" method="POST" onsubmit="return confirm('Reject this booking?')">
                    <input type="hidden" name="action" value="reject">
                    <input type="hidden" name="bookingId" value="<%= b.getBookingId() %>">
                    <input type="hidden" name="stationId" value="<%= b.getStationId() %>">
                    <button type="submit" class="btn btn-delete" style="background:#ef4444; cursor: pointer;">Reject</button>
                </form>
            </td>
        </tr>
    <% } } %>
</tbody>
    </table>
</div>

        <div class="card">
            <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:15px;">
                <h3>Gaming Station Management</h3>
                <button class="btn btn-primary" onclick="location.href='addStation.jsp'">+ Add Station</button>
            </div>
            <table class="staff-table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Type</th>
                        <th>Price/Hr</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
<%
                            StationDAO sDao = new StationDAO();
                            List<Station> stations = sDao.getAllStations();
                            for(Station s : stations) {
                        %>
                            <tr>
                                <td><strong><%= s.getStationName() %></strong></td>
                                <td><%= s.getStationType() %></td>
                                <td>RM <%= String.format("%.2f", s.getBasePricePerHour()) %></td>
                                <td>
                                    <%-- Guna class badge dari dashboard.css kita --%>
                                    <span class="badge status-<%= s.getStatus().toLowerCase() %>">
                                        <%= s.getStatus().toUpperCase() %>
                                    </span>
                                </td>
                                <td style="display: flex; gap: 8px; justify-content: center;">
                                    <a href="editStation.jsp?id=<%= s.getStationId() %>" class="btn" style="background:#ffc107; padding:5px 12px; border-radius:4px; text-decoration:none; color:black; font-weight:bold; font-size:0.8rem;">Edit</a>
                                    
                                    <%-- Guna form POST untuk delete supaya function dlm StationServlet --%>
                                    <form action="../StationServlet" method="POST" onsubmit="return confirm('Confirm delete station <%= s.getStationName() %>?')">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="stationId" value="<%= s.getStationId() %>">
                                        <button type="submit" style="background:#dc3545; padding:5px 12px; border-radius:4px; color:white; border:none; cursor:pointer; font-weight:bold; font-size:0.8rem;">Delete</button>
                                    </form>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>