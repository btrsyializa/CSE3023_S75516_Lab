<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lab.model.User, com.lab.model.Booking, com.lab.dao.BookingDAO, java.util.List" %>
<%
    // 1. Session Check - Pastikan student dah login
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("../login.jsp");
        return;
    }

    // 2. Tarik data booking history dari DB guna DAO
    BookingDAO bDao = new BookingDAO();
    List<Booking> myBookings = bDao.getBookingsByStudent(currentUser.getUserId());
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard - Playje</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body style="display: block; overflow-y: auto;"> <div class="container-dashboard">
        <%@ include file="../header.jsp" %>
        <div class="glass-card" style="max-width: 100%; margin-bottom: 30px; text-align: left; padding: 30px;">
            <h2 style="color: #fff;">Hello, <%= currentUser.getUsername() %>!</h2>
            <p class="subtitle" style="margin-bottom: 20px;">Ready for your next gaming session?</p>
            <button class="btn-primary" onclick="location.href='booking.jsp'" style="width: auto; padding: 12px 30px;">
                + BOOK NEW SESSION
            </button>
        </div>

        <% if ("pending".equals(request.getParameter("status"))) { %>
            <div class="success-msg">
                Booking submitted! Sila tunggu approval dari AJK Bertugas.
            </div>
        <% } %>

        <div class="glass-card" style="max-width: 100%; padding: 30px; text-align: left;">
            <h3 style="margin-bottom: 20px; color: #c77dff;">My Booking History</h3>
            
            <div style="overflow-x: auto;">
                <table class="booking-table">
                    <thead>
                        <tr>
                            <th>Station</th>
                            <th>Slot Time</th>
                            <th>Booking Date</th>
                            <th>Total Price</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if(myBookings == null || myBookings.isEmpty()) { %>
                            <tr>
                                <td colspan="5" style="text-align:center; padding: 40px; color: #999;">
                                    Belum ada history booking. Jom main!
                                </td>
                            </tr>
                        <% } else { 
                            for(Booking b : myBookings) { %>
                            <tr>
                                <td><strong><%= b.getStationName() %></strong></td>
                                <td><%= b.getSlotTime() %></td>
                                <td><%= b.getBookingDate() %></td>
                                <td>RM <%= String.format("%.2f", b.getTotalPrice()) %></td>
                                <td>
                                    <span class="badge <%= b.getStatus().toLowerCase() %>">
                                        <%= b.getStatus().toUpperCase() %>
                                    </span>
                                </td>
                            </tr>
                        <% } } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</body>
</html>