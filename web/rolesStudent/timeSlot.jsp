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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/dashboard.css">
    <style>
        .slot-grid { display: grid; grid-template-columns: 1fr; gap: 12px; margin-top: 20px; }
        
        .slot-option { 
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            padding: 18px; 
            border-radius: 12px; 
            cursor: pointer;
            display: flex; 
            justify-content: space-between; 
            align-items: center;
            transition: all 0.3s ease;
        }
        
        .slot-option:hover { 
            border-color: #c77dff; 
            background: rgba(199, 125, 255, 0.1); 
        }
        
        /* Style bila checkbox kena tick */
        .slot-checkbox:checked + .slot-label-text { font-weight: bold; color: #fff; }
        
        .slot-option:has(.slot-checkbox:checked) { 
            border-color: #c77dff; 
            background: rgba(199, 125, 255, 0.2); 
            box-shadow: 0 0 15px rgba(199, 125, 255, 0.2); 
        }

        .price-display {
            margin-top: 25px; 
            padding: 20px; 
            background: rgba(0, 0, 0, 0.2); 
            border-radius: 12px;
            display: flex; 
            justify-content: space-between; 
            align-items: center;
            border: 1px solid rgba(255, 255, 255, 0.05);
        }

        .slot-checkbox {
            width: 18px;
            height: 18px;
            accent-color: #c77dff;
            margin-right: 12px;
        }
    </style>
</head>
<body style="display: block; background-color: #1a1a2e;">
    <%@ include file="../header.jsp" %>
    
    <div class="container" style="max-width: 600px; margin-top: 80px;">
        <div class="card">
            <!-- Progress Tracker -->
            <div style="display: flex; justify-content: space-between; margin-bottom: 30px; font-size: 0.9rem;">
                <span style="color: #22c55e;">✔ Station</span>
                <span style="color: #c77dff; font-weight: bold;">2. Time Slot</span>
                <span style="color: #666;">3. Payment</span>
            </div>

            <h2 style="color: #fff; margin-bottom: 10px;">Available Slots for <%= bookingDate %></h2>
            <p style="color: #aaa; margin-bottom: 20px;">Station ID: <strong style="color: #c77dff;"><%= stationId %></strong></p>

            <form action="paymentProof.jsp" method="POST" id="slotForm">
                <input type="hidden" name="stationId" value="<%= stationId %>">
                <input type="hidden" name="bookingDate" value="<%= bookingDate %>">
                <input type="hidden" name="totalPrice" id="hiddenTotalPrice" value="0">

                <div class="slot-grid">
                    <% if(slots.isEmpty()) { %>
                        <div style="text-align: center; color: #ef4444; padding: 40px; background: rgba(239, 68, 68, 0.05); border-radius: 12px; border: 1px dashed #ef4444;">
                            <p style="margin: 0;">No available slots for this date/station.</p>
                            <p style="font-size: 0.85rem; margin-top: 5px;">Please go back and choose another date.</p>
                        </div>
                    <% } else { 
                        for(TimeSlot ts : slots) { %>
                        <label class="slot-option">
                            <div style="display: flex; align-items: center;">
                                <input type="checkbox" name="slotId" value="<%= ts.getSlotId() %>" 
                                       class="slot-checkbox" data-price="7.00" onchange="updateSummary()">
                                <span class="slot-label-text" style="color: #eee;"><%= ts.getStartTime() %> - <%= ts.getEndTime() %></span>
                            </div>
                            <span style="font-weight: bold; color: #fbbf24;">RM 7.00</span>
                        </label>
                    <% } } %>
                </div>

                <div class="price-display">
                    <span style="color: #ccc;">Selected: <strong id="countDisplay" style="color: #fff;">0</strong> slots</span>
                    <span style="font-size: 1.2rem; color: #fff;">Total: <strong id="totalDisplay" style="color: #fbbf24;">RM 0.00</strong></span>
                </div>

                <div style="display: flex; gap: 15px; margin-top: 30px;">
                    <button type="button" onclick="history.back()" class="btn-secondary" style="flex: 1; background: #444;">Back</button>
                    <button type="submit" id="nextBtn" class="btn-primary" style="flex: 2; padding: 12px;" disabled>
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

            totalDisplay.innerText = 'RM ' + total.toFixed(2);
            countDisplay.innerText = count;
            hiddenPrice.value = total.toFixed(2);
            
            nextBtn.disabled = (count === 0);
        }
    </script>
</body>
</html>