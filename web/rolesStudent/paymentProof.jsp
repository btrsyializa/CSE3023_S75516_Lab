<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 1. Ambil data dari Step 2 (timeSlot.jsp)
    String stationId = request.getParameter("stationId");
    String bookingDate = request.getParameter("bookingDate");
    
    // Ambil SEMUA slotId yang ditick (sebagai Array)
    String[] selectedSlots = request.getParameterValues("slotId");
    
    // Ambil total price yang dah dikira oleh JavaScript kat page sebelum ni
    String totalPriceStr = request.getParameter("totalPrice");

    // Safety check: Kalau takde slot, balik ke booking
    if (selectedSlots == null || selectedSlots.length == 0) {
        response.sendRedirect("booking.jsp");
        return;
    }

    // Parsing harga ke double untuk paparan
    double finalPrice = (totalPriceStr != null) ? Double.parseDouble(totalPriceStr) : 0.0;
    int totalSlots = selectedSlots.length;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Step 3: Payment - Playje</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/dashboard.css">
</head>
<body style="display: block; background-color: #1a1a2e;">
    <%@ include file="../header.jsp" %>
    
    <div class="container" style="max-width: 600px; margin-top: 80px;">
        <div class="card" style="text-align: center;">
            <!-- Progress Tracker -->
            <div style="display: flex; justify-content: space-between; margin-bottom: 30px; font-size: 0.9rem;">
                <span style="color: #22c55e;">✔ Station</span>
                <span style="color: #22c55e;">✔ Time Slot</span>
                <span style="color: #c77dff; font-weight: bold;">3. Payment</span>
            </div>

            <h2 style="color: #fff; margin-bottom: 20px; text-align: left;">Make Payment</h2>
            
            <!-- QR Section -->
            <div style="margin-bottom: 25px;">
                <p style="font-size: 0.9rem; color: #bbb; margin-bottom: 10px;">Scan to Pay (DuitNow/TnG):</p>
                <div style="background: white; padding: 15px; border-radius: 15px; display: inline-block;">
                    <img src="<%= request.getContextPath() %>/images/qr.jpg" 
                         alt="Payment QR" 
                         style="width: 180px; height: 180px; display: block;">
                </div>
            </div>

            <!-- Payment Info Box (Dah fix background & text dlm image_62c9a5.png) -->
            <div style="background: rgba(199, 125, 255, 0.1); padding: 20px; border-radius: 12px; margin-bottom: 25px; border: 1px dashed rgba(199, 125, 255, 0.3); text-align: left;">
                <p style="color: #fff; margin: 0; font-size: 1.1rem;">
                    Total to Pay (<%= totalSlots %> slots): 
                    <span style="color: #fbbf24; font-weight: bold; font-size: 1.3rem;">RM <%= String.format("%.2f", finalPrice) %></span>
                </p>
                <p style="font-size: 0.85rem; color: #ccc; margin-top: 10px; border-top: 1px solid rgba(255,255,255,0.1); padding-top: 10px;">
                    Bank Transfer: <strong style="color: #fff;">0500341100006605</strong><br>
                    <span style="color: #aaa;">(BSN - Esport UMT)</span>
                </p>
            </div>

            <form action="<%= request.getContextPath() %>/BookingServlet" method="POST" enctype="multipart/form-data" style="text-align: left;">
                <input type="hidden" name="stationId" value="<%= stationId %>">
                <input type="hidden" name="bookingDate" value="<%= bookingDate %>">
                <input type="hidden" name="totalPrice" value="<%= finalPrice %>">
                <input type="hidden" name="action" value="submitBooking">
                
                <%-- Loop untuk hantar semua slot_id yang dipilih --%>
                <% for(String sId : selectedSlots) { %>
                    <input type="hidden" name="slotId" value="<%= sId %>">
                <% } %>

                <div class="form-group" style="margin-top: 10px;">
                    <label style="color: #fff; display: block; margin-bottom: 8px;">Upload Payment Proof (Receipt):</label>
                    <input type="file" name="paymentProof" accept="image/*" required 
                           class="input-field" style="width:100%; border: 1px dashed rgba(255,255,255,0.2); background: rgba(0,0,0,0.2);">
                    <small style="color: #ef4444; display:block; margin-top:5px;">* Sila pastikan resit dalam format gambar (PNG/JPG).</small>
                </div>

                <div style="display: flex; gap: 15px; margin-top: 35px;">
                    <button type="button" onclick="history.back()" class="btn-secondary" style="flex: 1; background: #444;">Back</button>
                    <button type="submit" class="btn-primary" style="flex: 2; padding: 12px;">Confirm & Submit Booking</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>