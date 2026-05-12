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
%>
<!DOCTYPE html>
<html>
<head>
    <title>Step 3: Payment - Playje</title>
    <link rel="stylesheet" href="../css/dashboard.css">
</head>
<body>
    <%@ include file="../header.jsp" %>
    <div class="container" style="max-width: 600px; margin-top: 50px;">
        <div class="card">
            <div style="display: flex; justify-content: space-between; margin-bottom: 30px;">
                <span style="color: green;">✔ Station</span>
                <span style="color: green;">✔ Time Slot</span>
                <span style="color: purple; font-weight: bold;">3. Payment</span>
            </div>

            <h2 style="margin-bottom: 10px;">Make Payment</h2>
            <div style="text-align: center; margin-bottom: 20px;">
                <p style="font-size: 0.9rem; color: #666; margin-bottom: 8px;">Scan to Pay (DuitNow/TnG):</p>
                <img src="<%= request.getContextPath() %>/images/qr.jpg" 
                     alt="Payment QR" 
                     style="width: 180px; height: 180px; border: 2px solid #ddd; padding: 5px; border-radius: 8px; background: white;">
            </div>
            <div class="card-info" style="background: #f8f9fa; padding: 15px; border-radius: 8px; margin-bottom: 20px;">
                <p>Total to Pay (1 slots): <span style="color: #9333ea; font-weight: bold; font-size: 1.2rem;">RM 7.00</span></p>
                <p style="font-size: 0.85rem; color: #555;">Bank Transfer to: <strong>0500341100006605 (BSN - Esport UMT)</strong></p>
            </div>
            <form action="<%= request.getContextPath() %>/BookingServlet" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="stationId" value="<%= stationId %>">
                <input type="hidden" name="bookingDate" value="<%= bookingDate %>">
                <input type="hidden" name="totalPrice" value="<%= finalPrice %>">
                
                <%-- Loop untuk hantar semua slot_id yang dipilih --%>
                <% for(String sId : selectedSlots) { %>
                    <input type="hidden" name="slotId" value="<%= sId %>">
                <% } %>

                <div class="form-group" style="margin-top: 20px;">
                    <label>Upload Payment Proof (Receipt):</label>
                    <input type="file" name="paymentProof" accept="image/*" required style="width:100%; padding:10px; border: 1px dashed #ccc;">
                    <small style="color: red; display:block; margin-top:5px;">* Sila pastikan resit dalam format gambar (PNG/JPG).</small>
                </div>

                <div style="display: flex; gap: 10px; margin-top: 30px;">
                    <button type="button" onclick="history.back()" class="btn btn-secondary" style="flex: 1;">Back</button>
                    <button type="submit" class="btn btn-primary" style="flex: 2;">Confirm & Submit Booking</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>