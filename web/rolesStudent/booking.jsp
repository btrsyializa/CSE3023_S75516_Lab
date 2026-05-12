<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lab.model.Station, com.lab.dao.StationDAO, java.util.List" %>
<%
    StationDAO dao = new StationDAO();
    List<Station> stations = dao.getAllStations();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Step 1: Select Station - Playje</title>
    <link rel="stylesheet" href="../css/dashboard.css">
</head>
<body>
    <%@ include file="../header.jsp" %>
    <div class="container" style="max-width: 600px; margin-top: 50px;">
        <div class="card">
            <div style="display: flex; justify-content: space-between; margin-bottom: 30px;">
                <span style="color: purple; font-weight: bold;">1. Station</span>
                <span style="color: #ccc;">2. Time Slot</span>
                <span style="color: #ccc;">3. Payment</span>
            </div>

            <h2>Select Gaming Station</h2>
            <form action="timeSlot.jsp" method="GET">
                <div class="form-group">
                    <label>Station:</label>
                    <select name="stationId" required style="width:100%; padding:10px;">
                        <option value="">-- Choose Station --</option>
                            <% for(Station s : stations) { %>
                                <option value="<%= s.getStationId() %>"><%= s.getStationName() %></option>
                            <% } %>
                    </select>
                </div>

                <div class="form-group" style="margin-top: 15px;">
                    <label>Booking Date:</label>
                    <input type="date" name="bookingDate" id="datePicker" required style="width:100%; padding:10px;">
                </div>

                <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 20px;">
                    Next: Select Time Slot
                </button>
            </form>
        </div>
    </div>

    <script>
        // Set tarikh minimum kepada hari ini
        document.getElementById('datePicker').min = new Date().toISOString().split("T")[0];
    </script>
</body>
</html>