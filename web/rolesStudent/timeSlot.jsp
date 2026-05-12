<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lab.model.TimeSlot, com.lab.dao.TimeSlotDAO, java.util.List" %>
<%
    String stationId = request.getParameter("stationId");
    String bookingDate = request.getParameter("bookingDate");

    if (stationId == null || bookingDate == null) {
        response.sendRedirect("booking.jsp");
        return;
    }

    TimeSlotDAO tsDao = new TimeSlotDAO();
    List<TimeSlot> slots = tsDao.getSlotsByStationAndDate(stationId, bookingDate);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Step 2: Select Time Slot - Playje</title>
    <link rel="stylesheet" href="../css/dashboard.css">
    <style>
        .slot-grid { display: grid; grid-template-columns: 1fr; gap: 10px; margin-top: 20px; }
        .slot-option { 
            border: 1px solid #ddd; padding: 15px; border-radius: 8px; cursor: pointer;
            display: flex; justify-content: space-between; align-items: center;
            transition: 0.3s;
        }
        .slot-option:hover { border-color: purple; background: #f9f0ff; }
        
        /* Style bila checkbox kena tick */
        .slot-checkbox:checked + .slot-label-text { font-weight: bold; color: purple; }
        .slot-option:has(.slot-checkbox:checked) { border-color: purple; background: #f9f0ff; box-shadow: 0 0 5px rgba(128, 0, 128, 0.2); }

        .price-display {
            margin-top: 20px; padding: 15px; background: #f4f4f4; border-radius: 8px;
            display: flex; justify-content: space-between; align-items: center;
        }
    </style>
</head>
<body>
    <%@ include file="../header.jsp" %>
    <div class="container" style="max-width: 600px; margin-top: 50px;">
        <div class="card">
            <div style="display: flex; justify-content: space-between; margin-bottom: 30px;">
                <span style="color: green;">✔ Station</span>
                <span style="color: purple; font-weight: bold;">2. Time Slot</span>
                <span style="color: #ccc;">3. Payment</span>
            </div>

            <h2>Available Slots for <%= bookingDate %></h2>
            <p>Station ID: <strong><%= stationId %></strong></p>

            <form action="paymentProof.jsp" method="POST" id="slotForm">
                <input type="hidden" name="stationId" value="<%= stationId %>">
                <input type="hidden" name="bookingDate" value="<%= bookingDate %>">
                <input type="hidden" name="totalPrice" id="hiddenTotalPrice" value="0">

                <div class="slot-grid">
                    <% if(slots.isEmpty()) { %>
                        <p style="text-align: center; color: red; padding: 20px;">
                            No available slots for this date/station. <br>
                            Please go back and choose another date.
                        </p>
                    <% } else { 
                        for(TimeSlot ts : slots) { %>
                        <label class="slot-option">
                            <div class="slot-content">
                                <input type="checkbox" name="slotId" value="<%= ts.getSlotId() %>" 
                                       class="slot-checkbox" data-price="7.00" onchange="updateSummary()">
                                <span class="slot-label-text"><%= ts.getStartTime() %> - <%= ts.getEndTime() %></span>
                            </div>
                            <span style="font-weight: bold; color: #333;">RM 7.00</span>
                        </label>
                    <% } } %>
                </div>

                <div class="price-display">
                    <span>Total Slots Selected: <strong id="countDisplay">0</strong></span>
                    <span style="font-size: 1.2rem;">Total: <strong id="totalDisplay" style="color: purple;">RM 0.00</strong></span>
                </div>

                <div style="display: flex; gap: 10px; margin-top: 20px;">
                    <button type="button" onclick="history.back()" class="btn btn-secondary" style="flex: 1;">Back</button>
                    <button type="submit" id="nextBtn" class="btn btn-primary" style="flex: 2;" disabled>
                        Next: Make Payment
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script>
        function updateSummary() {
            const checkboxes = document.querySelectorAll('.slot-checkbox');
            const totalDisplay = document.getElementById('totalDisplay');
            const countDisplay = document.getElementById('countDisplay');
            const hiddenPrice = document.getElementById('hiddenTotalPrice');
            const nextBtn = document.getElementById('nextBtn');
            
            let total = 0;
            let count = 0;

            checkboxes.forEach(cb => {
                if (cb.checked) {
                    total += parseFloat(cb.getAttribute('data-price'));
                    count++;
                }
            });

            // Update UI
            totalDisplay.innerText = 'RM ' + total.toFixed(2);
            countDisplay.innerText = count;
            hiddenPrice.value = total.toFixed(2);
            
            // Enable/Disable button
            nextBtn.disabled = (count === 0);
        }
    </script>
</body>
</html>