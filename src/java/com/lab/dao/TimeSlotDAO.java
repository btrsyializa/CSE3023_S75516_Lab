package com.lab.dao;

import com.lab.model.TimeSlot;
import com.lab.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TimeSlotDAO {

    // 1. Method untuk tarik slot yang available ikut Station & Tarikh
    public List<TimeSlot> getSlotsByStationAndDate(String stationId, String date) {
        List<TimeSlot> list = new ArrayList<>();
        // Kita check is_available = 1 supaya tak tunjuk slot yang dah kena book
        String query = "SELECT * FROM time_slot WHERE station_id = ? AND slot_date = ? AND is_available = 1 ORDER BY start_time ASC";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            
            stmt.setString(1, stationId);
            stmt.setString(2, date);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                TimeSlot ts = new TimeSlot();
                ts.setSlotId(rs.getString("slot_id"));
                ts.setStationId(rs.getString("station_id"));
                ts.setSlotDate(rs.getDate("slot_date"));
                ts.setStartTime(rs.getTime("start_time"));
                ts.setEndTime(rs.getTime("end_time"));
                ts.setIsAvailable(rs.getInt("is_available"));
                list.add(ts);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching slots: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    // 2. Method untuk update status slot (Guna masa student dah setel booking)
    public boolean updateSlotAvailability(String slotId, int status) {
        String query = "UPDATE time_slot SET is_available = ? WHERE slot_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            
            stmt.setInt(1, status); // 0 = Taken, 1 = Available
            stmt.setString(2, slotId);
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}