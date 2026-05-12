<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lab.model.User" %>
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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard - Playje</title>
    <link rel="stylesheet" href="../css/dashboard.css">
</head>
<body>
    <div class="navbar">
        <h1>Gaming Lounge - Student Dashboard</h1>
        <a href="../login.jsp">Logout</a>
    </div>
    
    <div class="container">
        <div class="welcome-box card">
            <h2>Welcome <%= currentUser.getUsername() %>!</h2>
            <div class="user-info">
                <p><strong>User ID:</strong> <%= currentUser.getUserId() %></p>
                <p><strong>Email:</strong> <%= currentUser.getEmail() %></p>
                <p><strong>Role:</strong> <span style="text-transform: capitalize;"><%= currentUser.getRole() %></span></p>
            </div>
            <button class="btn btn-primary" onclick="initiateBooking();" style="margin-top: 20px; width: 100%;">
                Book Gaming Session
            </button>
        </div>
        
        <div class="card">
            <h2 style="margin-bottom: 20px; color: #333;">Available Gaming Stations</h2>
            <div class="stations-grid">
                <div class="station-card">
                    <h3>PS5 Station 1</h3>
                    <p><strong>Type:</strong> PlayStation 5</p>
                    <p><strong>Price:</strong> RM 7.00/hour</p>
                    <p><span class="status available">Available</span></p>
                </div>
                
                <div class="station-card">
                    <h3>PS5 Station 2</h3>
                    <p><strong>Type:</strong> PlayStation 5</p>
                    <p><strong>Price:</strong> RM 7.00/hour</p>
                    <p><span class="status occupied">Occupied</span></p>
                </div>
                
                <div class="station-card">
                    <h3>Logitech G29 Sim 1</h3>
                    <p><strong>Type:</strong> Car Simulator</p>
                    <p><strong>Price:</strong> RM 8.00/hour</p>
                    <p><span class="status available">Available</span></p>
                </div>
            </div>
        </div>
        
        <div class="card" style="grid-column: 1 / -1;">
            <h2 style="margin-bottom: 20px; color: #333;">My Booking History</h2>
            
            <div class="booking-tabs">
                <button class="tab-btn active" onclick="switchBookingTab('all')">All Bookings</button>
                <button class="tab-btn" onclick="switchBookingTab('pending')">Pending</button>
                <button class="tab-btn" onclick="switchBookingTab('approved')">Approved</button>
                <button class="tab-btn" onclick="switchBookingTab('completed')">Completed</button>
                <button class="tab-btn" onclick="switchBookingTab('cancelled')">Cancelled</button>
            </div>
            
            <div class="bookings-container">
                <div class="booking-item status-pending">
                    <div class="booking-info">
                        <h4>Console Station A (PlayStation 5)</h4>
                        <p><strong>Date:</strong> 25 Dec 2024 | <strong>Time:</strong> 14:00 - 16:00 (2 hours)</p>
                        <p><strong>Amount:</strong> RM 14.00 | <strong>Status:</strong> <span class="badge pending">Awaiting Approval</span></p>
                    </div>
                    <div class="booking-actions">
                        <button class="btn-small btn-edit">Edit</button>
                        <button class="btn-small btn-cancel">Cancel</button>
                    </div>
                </div>
                
                <div class="booking-item status-approved">
                    <div class="booking-info">
                        <h4>Gaming Station Beta (Premium PC)</h4>
                        <p><strong>Date:</strong> 22 Dec 2024 | <strong>Time:</strong> 10:00 - 12:00 (2 hours)</p>
                        <p><strong>Amount:</strong> RM 10.00 | <strong>Status:</strong> <span class="badge approved">Approved</span></p>
                    </div>
                    <div class="booking-actions">
                        <button class="btn-small btn-view">View</button>
                    </div>
                </div>
                
                <div class="booking-item status-completed">
                    <div class="booking-info">
                        <h4>Console Station B (Xbox Series X)</h4>
                        <p><strong>Date:</strong> 20 Dec 2024 | <strong>Time:</strong> 18:00 - 20:00 (2 hours)</p>
                        <p><strong>Amount:</strong> RM 12.00 | <strong>Status:</strong> <span class="badge completed">Completed</span></p>
                    </div>
                    <div class="booking-actions">
                        <button class="btn-small btn-receipt">Receipt</button>
                    </div>
                </div>
            </div>
            
            <div class="empty-state" style="display: none; text-align: center; padding: 40px;">
                <p style="color: #999; font-size: 1.1rem;">No bookings found</p>
            </div>
        </div>
    </div>
    
    <script>
        function initiateBooking() {
            // Navigate to booking form (to be created)
            window.location.href = './booking.jsp';
        }
        
        function switchBookingTab(tab) {
            const tabs = document.querySelectorAll('.tab-btn');
            tabs.forEach(t => t.classList.remove('active'));
            event.target.classList.add('active');
            
            // Filter bookings based on tab (to be implemented with backend)
            const bookings = document.querySelectorAll('.booking-item');
            bookings.forEach(b => {
                if (tab === 'all') {
                    b.style.display = 'flex';
                } else {
                    const status = 'status-' + tab;
                    b.style.display = b.classList.contains(status) ? 'flex' : 'none';
                }
            });
        }
    </script>
</body>
</html>
